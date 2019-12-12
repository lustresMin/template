package ${packageName}.${service};

import ${entity}.${modelName};
import ${entity}.common.Result;
import java.util.List;

/**
  * @author mc
  * Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
  * Version 1.0
  * Description ${comment}接口
  */
public interface ${modelName}Service {
    /**
	 * 新增
	 *
	 * @param userId userId
	 * @param ${fieldName}Dto 对象
	 * @return 前端返回格式
	 */
    Result insert(Long userId,${modelName}Dto ${fieldName}Dto);
    /**
	 * 修改
	 *
	 * @param userId userId
	 * @param ${fieldName}Dto 对象
	 * @return 前端返回格式
	 */
    Result update(Long userId,${modelName}Dto ${fieldName}Dto);
    /**
	 * 根据主键删除
	 *
	 * @param userId userId
	 * @param ${primaryKey.changeColumnName} 标识
	 * @return 前端返回格式
	 */
    Result deleteGetById(Long userId,${primaryKey.columnType} ${primaryKey.changeColumnName});
    /**
	 * 根据主键查询
	 *
	 * @param userId userId
	 * @param ${primaryKey.changeColumnName} 标识
	 * @return 前端返回格式
	 */
    Result findById(Long userId,${primaryKey.columnType} ${primaryKey.changeColumnName});
    /**
	 * 条件分页查询
	 *
	 * @param userId userId
	 * @param page 当前页
	 * @param size 显示多少条
	 * @param sort 排序字段
	 * @param ${fieldName}Dto 查询条件
	 * @return 前端返回格式
	 */
    Result pageQuery(Long userId,Integer page, Integer size, String sort, ${modelName}Dto ${fieldName}Dto);
}
