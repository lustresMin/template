package ${packageName}.${service};

import ${packageName}.${entity}.${modelName};

import java.util.List;

/**
 * @description ${comment}实体接口
 * @createDate ${.now?string("yyyy-MM-dd HH:mm:ss")}
 * @version 1.0
 * @author mc
 */
public interface ${modelName}Service {
    /**
     * 新增
     * @return
     */
    Result insert(${modelName} ${fieldName},Integer userId);
    /**
     * 修改
     * @return
     */
    Result update(${modelName} ${fieldName},Integer userId);
    /**
     * 批量删除
     * @return
     */
    Result deleteInBatch(List<${modelName}> ${fieldName}List,Integer userId);
    /**
     * 根据主键删除
     * @return
     */
    Result deleteGetById(${primaryKey.columnType} ${primaryKey.changeColumnName},Integer userId);
    /**
     * 根据主键查询
     * @return
     */
    Result findOne(${primaryKey.columnType} ${primaryKey.changeColumnName});
    /**
     * 条件分页查询
     * @return
     */
    Result pageQuery(Integer page, Integer size, String sort, ${modelName} ${fieldName});
}
