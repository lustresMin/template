package ${serverImpl};

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageHelper;
import ${entity}.${modelName};
import ${mappers}.${modelName}${mapper?cap_first};
import ${server}.${modelName}${service?cap_first};
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.weekend.WeekendSqls;
import lombok.extern.slf4j.Slf4j;
import com.liaoin.smart.commons.jackson.Result;
import ${packageName}.security.BeanConfig;
import com.github.surpassm.tool.util.ValidateUtil;


import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.liaoin.smart.commons.jackson.Result.fail;
import static com.liaoin.smart.commons.jackson.Result.ok;


/**
  * @author mc
  * Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
  * Version 1.0
  * Description ${comment}实现类
  */
@Slf4j
@Service
@Transactional(rollbackFor={RuntimeException.class, Exception.class})
public class ${modelName}ServiceImpl implements ${modelName}Service {
    @Resource
    private ${modelName}Mapper ${fieldName}Mapper;

    @Override
    public Result<${modelName}> insert(String accessToken,${modelName} ${fieldName}) {
        if (${fieldName} == null){
            return fail(ResultCode.PARAM_IS_BLANK.getMsg());
        }
        ${fieldName}Mapper.insert(${fieldName});
        return ok();
    }

    @Override
    public Result update(String accessToken,${modelName} ${fieldName}) {
        if (${fieldName} == null){
            return fail(ResultCode.PARAM_IS_BLANK.getMsg());
        }
        ${fieldName}Mapper.updateByPrimaryKeySelective(${fieldName});
        return ok();
    }

    @Override
    public Result deleteGetById(String accessToken,${primaryKey.columnType} ${primaryKey.changeColumnName}){
        if (${primaryKey.changeColumnName} == null){
            return fail(ResultCode.PARAM_IS_BLANK.getMsg());
        }
        ${modelName} ${fieldName} = ${fieldName}Mapper.selectByPrimaryKey(${primaryKey.changeColumnName});
        if(${fieldName} == null){
            return fail(ResultCode.RESULE_DATA_NONE.getMsg());
        }
        ${fieldName}Mapper.updateByPrimaryKeySelective(${fieldName});
        return ok();
    }


    @Override
    public Result<${modelName}> findById(String accessToken,${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        if (${primaryKey.changeColumnName} == null){
            return fail(ResultCode.PARAM_IS_BLANK.getMsg());
        }
		${modelName} ${fieldName} = ${fieldName}Mapper.selectByPrimaryKey(${primaryKey.changeColumnName});
        if (${fieldName} == null){
			return fail(ResultCode.RESULE_DATA_NONE.getMsg());
		}
        return ok(${fieldName});

    }

    @Override
    public Result<PageInfo<${modelName}>> pageQuery(String accessToken,Integer page, Integer size, String sort, ${modelName} ${fieldName}) {
        page = null  == page ? 1 : page;
        size = null  == size ? 10 : size;
        if (size > 101){
			return fail("num must not be greater than 100");
		}
        if (sort != null && !"".equals(sort.trim())){
			PageHelper.startPage(page, size,sort);
		}else {
			PageHelper.startPage(page, size);
		}
        Example.Builder builder = new Example.Builder(${modelName}.class);
        if(${fieldName} != null){
<#list columnClassList as columnClass>
    <#if columnClass.columnType == "String" >
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
        }
        Page<${modelName}> all = (Page<${modelName}>) ${fieldName}Mapper.selectByExample(builder.build());
        return ok(all.toPageInfo());
    }
}

