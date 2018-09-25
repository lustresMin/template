package ${packageName}.service;

import org.springframework.data.domain.Pageable;
import java.util.List;

/**
 * @description ${comment}实体接口实现类
 * @createDate ${.now?string("yyyy-MM-dd HH:mm:ss")}
 * @version 1.0
 * @author mc
 */
public interface ${modelName}Service {
    /**
     * 新增
     * @return
     */
    Result insert(${modelName} ${fieldName});
    /**
     * 修改
     * @return
     */
    Result update(${modelName} ${fieldName});
    /**
     * 批量删除
     * @return
     */
    Result deleteInBatch(List<${modelName}> ${fieldName}List);
    /**
     * 根据主键删除
     * @return
     */
    Result deleteGetById(${primaryKey.columnType} ${primaryKey.changeColumnName});
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
