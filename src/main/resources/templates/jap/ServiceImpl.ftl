package ${packageName}.service.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 * @description ${comment}实体接口实现类
 * @createDate ${.now?string("yyyy-MM-dd HH:mm:ss")}
 * @version 1.0
 * @author mc
 */

@Service
@Transactional(rollbackFor={RuntimeException.class, Exception.class})
public class ${modelName}ServiceImpl implements ${modelName}Service {
    private Logger logger = LoggerFactory.getLogger(${modelName}ServiceImpl.class);
    @Resource
    private ${modelName}Repository ${fieldName}Repository;

    @Override
    public Result insert(${modelName} ${fieldName}) {
        logger.debug("增加信息->"+ToStringBuilder.reflectionToString(${fieldName}));
        if (${fieldName} == null){
            return fail(Tips.PARAMETER_ERROR.msg);
        }
        ${fieldName}.setCreateTime(LocalDateTime.now());
        ${fieldName}Repository.save(${fieldName});
        return ok();
    }

    @Override
    public Result update(${modelName} ${fieldName}) {
        logger.debug("删除信息->"+ToStringBuilder.reflectionToString(${fieldName}));
        if (${fieldName} == null){
            return fail(Tips.PARAMETER_ERROR.msg);
        }
        ${fieldName}.setUpdateTime(LocalDateTime.now());
        ${fieldName}Repository.save(${fieldName});
        return ok();
    }

    @Override
    public Result deleteInBatch(List<${modelName}> ${fieldName}List) {
        if (${fieldName}List.size() == 0){
            return fail(Tips.PARAMETER_ERROR.msg);
        }
        ${fieldName}Repository.deleteInBatch(${fieldName}List);
        return ok();
    }

    @Override
    public Result deleteGetById(${primaryKey.columnType} ${primaryKey.changeColumnName}){
        if (${primaryKey.changeColumnName} == null){
            return fail(Tips.PARAMETER_ERROR.msg);
        }
        ${modelName} one = ${fieldName}Repository.getOne(id);
        if(one != null){
            ${fieldName}Repository.deleteById(id);
        }
        return ok();
    }


    @Override
    public Result findOne(${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        if (${primaryKey.changeColumnName} == null){
        return fail(Tips.PARAMETER_ERROR.msg);
        }
        ${modelName} one = ${fieldName}Repository.getOne(${primaryKey.changeColumnName});
        return ok(one);
    }

    @Override
    public Result pageQuery(Integer page, Integer size, String sort, ${modelName} ${fieldName}) {
        page = page == null?0:page;
		size = size == null?10:size;
    	if (page>0){page--;}
        PageRequest pageable = PageRequest.of(page, size);
        if (sort !=null && sort.trim().equals("")) {
            pageable= PageRequest.of(page,page,new Sort(Sort.Direction.DESC,sort));
        }
        Page<${modelName}> all = ${fieldName}Repository.findAll((Specification) (root,criteriaQuery,criteriaBuilder)-> {
            List<Predicate> list = new ArrayList<>();
            if (${fieldName} != null) {
<#list columnClassList as columnClass>
    <#if columnClass.columnType == "String">
                if ((${fieldName}.get${columnClass.changeColumnName?cap_first}() != null) && (!${fieldName}.get${columnClass.changeColumnName?cap_first}().trim().equals(""))) {
                    list.add(criteriaBuilder.like(root.get("${columnClass.changeColumnName}").as(${columnClass.columnType}.class), "%" + ${fieldName}.get${columnClass.changeColumnName?cap_first}() + "%"));
                }
    <#else>
                if (${fieldName}.get${columnClass.changeColumnName?cap_first}() != null) {
                    list.add(criteriaBuilder.equal(root.get("${columnClass.changeColumnName}").as(${columnClass.columnType}.class), ${fieldName}.get${columnClass.changeColumnName?cap_first}()));
                }
    </#if>
</#list>
            }
            return criteriaBuilder.and(list.toArray(new Predicate[list.size()]));
        }, pageable);
        Map map = new HashMap();
        map.put("total",all.getTotalElements());
        map.put("rows",all.getContent());
        return Result.ok(map);
    }
}

