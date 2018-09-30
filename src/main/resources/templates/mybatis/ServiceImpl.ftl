package ${packageName}.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import ${packageName}.${entity}.${modelName};
import ${packageName}.${mapper}.${modelName}${mapper?cap_first};
import ${packageName}.${service}.${modelName}${service?cap_first};
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.weekend.WeekendSqls;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description ${comment}实体接口实现类
 * @createDate ${.now?string("yyyy-MM-dd HH:mm:ss")}
 * @version 1.0
 * @author mc
 */
@Service
@Transactional(rollbackFor={RuntimeException.class, Exception.class})
public class ${modelName}ServiceImpl implements ${modelName}Service {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Resource
    private ${modelName}Mapper ${fieldName}Mapper;

    @Override
    public Result insert(${modelName} ${fieldName},Integer userId) {
        logger.debug("增加信息->"+ToStringBuilder.reflectionToString(${fieldName}));
        if (${fieldName} == null){
            return fail(Tips.PARAMETER_ERROR.msg);
        }
        ${fieldName}Mapper.insert(${fieldName});
        return ok();
    }

    @Override
    public Result update(${modelName} ${fieldName},Integer userId) {
        logger.debug("修改信息->"+ToStringBuilder.reflectionToString(${fieldName}));
        if (${fieldName} == null){
            return fail(Tips.PARAMETER_ERROR.msg);
        }
        ${fieldName}.setUpdateTime(new Date());
        ${fieldName}.setUpdateUserId(userId);
        ${fieldName}Mapper.updateByPrimaryKeySelective(${fieldName});
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
        try{
            ${modelName} one = ${fieldName}Mapper.selectByPrimaryKey(${primaryKey.changeColumnName});
            if(one == null){
                return fail(Tips.MSG_NOT.msg);
            }
            one.setDeleteTime(new Date());
            one.setDeleteUserId(userId);
            ${fieldName}Mapper.deleteByPrimaryKey(${primaryKey.changeColumnName});
        }catch (Exception e){
            e.printStackTrace();
            return fail(Tips.PARAMETER_ERROR.msg);
        }
        return ok();
    }


    @Override
    public Result findOne(${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        if (${primaryKey.changeColumnName} == null){
            return fail(Tips.PARAMETER_ERROR.msg);
        }
        try{
            ${modelName} one = ${fieldName}Mapper.selectByPrimaryKey(${primaryKey.changeColumnName});
            return ok(one);
        }catch (Exception e){
            e.printStackTrace();
            return fail(Tips.PARAMETER_ERROR.msg);
        }
    }

    @Override
    public Result pageQuery(Integer page, Integer size, String sort, ${modelName} ${fieldName}) {
        page = null  == page ? 1 : page;
        size = null  == size ? 10 : size;
        PageHelper.startPage(page, size);
        WeekendSqls<${modelName}> custom = WeekendSqls.custom();
<#list columnClassList as columnClass>
    <#if columnClass.columnType == "String">
        if (${fieldName}.get${columnClass.changeColumnName?cap_first}() != null && !"".equals(${fieldName}.get${columnClass.changeColumnName?cap_first}().trim())){
            custom.andEqualTo(${modelName}::get${columnClass.changeColumnName?cap_first},${fieldName}.get${columnClass.changeColumnName?cap_first}());
        }
    <#elseif columnClass.columnType == "Integer">
        if (${fieldName}.get${columnClass.changeColumnName?cap_first}() != null && !"".equals(${fieldName}.get${columnClass.changeColumnName?cap_first}())){
            custom.andEqualTo(${modelName}::get${columnClass.changeColumnName?cap_first},${fieldName}.get${columnClass.changeColumnName?cap_first}());
        }
    <#else>
        if (${fieldName}.get${columnClass.changeColumnName?cap_first}() != null){
            custom.andEqualTo(${modelName}::get${columnClass.changeColumnName?cap_first},${fieldName}.get${columnClass.changeColumnName?cap_first}());
        }
    </#if>
</#list>
        Page<${modelName}> all = (Page<${modelName}>) ${fieldName}Mapper.selectByExample(new Example.Builder(${modelName}.class).where(custom));
        Map<String, Object> map = new HashMap<>(16);
        map.put("total",all.getTotal());
        map.put("rows",all.getResult());
        return ok(map);
    }
}

