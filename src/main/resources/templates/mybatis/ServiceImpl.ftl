package ${packageName}.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import ${packageName}.common.jackson.Result;
import ${packageName}.${entity}.${modelName};
import ${packageName}.${mapper}.${modelName}${mapper?cap_first};
import ${packageName}.${service}.${modelName}${service?cap_first};
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.weekend.WeekendSqls;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import static ${packageName}.common.jackson.Result.fail;
import static ${packageName}.common.jackson.Result.ok;

/**
  * @author mc
  * Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
  * Version 1.0
  * Description
  */
@Service
@Transactional(rollbackFor={RuntimeException.class, Exception.class})
public class ${modelName}ServiceImpl implements ${modelName}Service {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Resource
    private ${modelName}Mapper ${fieldName}Mapper;

    @Override
    public Result insert(${modelName} ${fieldName},Integer userId) {
        if (${fieldName} == null){
            return fail(Tips.PARAMETER_ERROR.msg);
        }
        ${fieldName}.setCreateTime(new Date());
        ${fieldName}.setCreateUserId(userId);
        ${fieldName}Mapper.insert(${fieldName});
        logger.info("insert:"+userId,JsonUtils.objectToJson(${fieldName}));
        return ok();
    }

    @Override
    public Result update(${modelName} ${fieldName},Integer userId) {
        if (${fieldName} == null){
            return fail(Tips.PARAMETER_ERROR.msg);
        }
        ${fieldName}.setUpdateTime(new Date());
        ${fieldName}.setUpdateUserId(userId);
        ${fieldName}Mapper.updateByPrimaryKeySelective(${fieldName});
        logger.info("update:"+userId,JsonUtils.objectToJson(${fieldName}));
        return ok();
    }

    @Override
    public Result deleteInBatch(List<${modelName}> ${fieldName}List,Integer userId) {
        if (${fieldName}List.size() == 0){
            return fail(Tips.PARAMETER_ERROR.msg);
        }
        for(${modelName} ${fieldName}:${fieldName}List){
            ${fieldName}.setDeleteTime(new Date());
            ${fieldName}.setDeleteUserId(userId);
            ${fieldName}Mapper.deleteByPrimaryKey(${fieldName}.getId());
        }
        return ok();
    }

    @Override
    public Result deleteGetById(${primaryKey.columnType} ${primaryKey.changeColumnName},Integer userId){
        if (${primaryKey.changeColumnName} == null){
            return fail(Tips.PARAMETER_ERROR.msg);
        }
        ${modelName} ${fieldName} = ${fieldName}Mapper.selectByPrimaryKey(${primaryKey.changeColumnName});
        if(${fieldName} == null){
            return fail(Tips.MSG_NOT.msg);
        }
        ${fieldName}.setDeleteTime(new Date());
        ${fieldName}.setDeleteUserId(userId);
        ${fieldName}.setIsDelete(1);
        ${fieldName}Mapper.updateByPrimaryKeySelective(${fieldName});
        logger.info("delete:"+userId,JsonUtils.objectToJson(${fieldName}));
        return ok();
    }


    @Override
    public Result findById(${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        if (${primaryKey.changeColumnName} == null){
            return fail(Tips.PARAMETER_ERROR.msg);
        }
		${modelName} ${fieldName} = ${fieldName}Mapper.selectByPrimaryKey(${primaryKey.changeColumnName});
        if (${fieldName} == null){
			return fail(Tips.MSG_NOT.msg);
		}
        return ok(${fieldName});

    }

    @Override
    public Result pageQuery(Integer page, Integer size, String sort, ${modelName} ${fieldName}) {
        page = null  == page ? 1 : page;
        size = null  == size ? 10 : size;
        PageHelper.startPage(page, size);
        Example.Builder builder = new Example.Builder(${modelName}.class);
<#list columnClassList as columnClass>
    <#if columnClass.columnType == "String">
        if (${fieldName}.get${columnClass.changeColumnName?cap_first}() != null && !"".equals(${fieldName}.get${columnClass.changeColumnName?cap_first}().trim())){
            builder.where(WeekendSqls.<${modelName}>custom().andLike(${modelName}::get${columnClass.changeColumnName?cap_first},"%"+${fieldName}.get${columnClass.changeColumnName?cap_first}()+"%"));
        }
    <#elseif columnClass.columnType == "Integer">
        if (${fieldName}.get${columnClass.changeColumnName?cap_first}() != null){
            builder.where(WeekendSqls.<${modelName}>custom().andEqualTo(${modelName}::get${columnClass.changeColumnName?cap_first},${fieldName}.get${columnClass.changeColumnName?cap_first}()));
        }
    <#else>
        if (${fieldName}.get${columnClass.changeColumnName?cap_first}() != null){
            builder.where(WeekendSqls.<${modelName}>custom().andEqualTo(${modelName}::get${columnClass.changeColumnName?cap_first},${fieldName}.get${columnClass.changeColumnName?cap_first}()));
        }
    </#if>
</#list>
        Page<${modelName}> all = (Page<${modelName}>) ${fieldName}Mapper.selectByExample(builder.build());
        Map<String, Object> map = new HashMap<>(16);
        map.put("total",all.getTotal());
        map.put("rows",all.getResult());
        return ok(map);
    }
}

