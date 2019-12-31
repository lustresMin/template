package ${packageName}.${service};

import ${entity}.${modelName};
import java.util.List;


import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.Optional;

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
	 * @param ${fieldName} 对象
	 * @return 前端返回格式
	 */
	${modelName} insert(${modelName} ${fieldName});

    /**
	 * 修改
	 *
	 * @param ${fieldName} 对象
	 * @return 前端返回格式
	 */
    void update(${modelName} ${fieldName});

    /**
	 * 根据主键删除
	 *
	 * @param ${primaryKey.changeColumnName} 标识
	 * @return 前端返回格式
	 */
	void deleteById(@NotNull @Min(1) ${primaryKey.columnType} ${primaryKey.changeColumnName});

    /**
	 * 根据主键查询
	 *
	 * @param userId userId
	 * @param ${primaryKey.changeColumnName} 标识
	 * @return 前端返回格式
	 */
	Optional<${modelName}> findById(@NotNull @Min(1) ${primaryKey.columnType} ${primaryKey.changeColumnName});

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
    Result pageQuery(Integer page, Integer size, String sort, ${modelName}VO vo);


	/**
	* 新增
	*
	* @param vo vo
	* @return Banner
	*/
	${modelName} insertVO(${modelName}VO vo);

	/**
	* 修改
	*
	* @param vo vo
	* @return Banner
	*/
	${modelName} updateVO(${modelName}VO vo);
}
