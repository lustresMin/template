package ${packageName}.${service};

import ${entity}.${modelName};
import com.github.surpassm.common.jackson.Result;

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
	 * @param accessToken accessToken
	 * @param ${fieldName} 对象
	 * @return 前端返回格式
	 */
    Result insert(String accessToken,${modelName} ${fieldName});
    /**
	 * 修改
	 *
	 * @param accessToken accessToken
	 * @param ${fieldName} 对象
	 * @return 前端返回格式
	 */
    Result update(String accessToken,${modelName} ${fieldName});
    /**
	 * 根据主键删除
	 *
	 * @param accessToken accessToken
	 * @param ${primaryKey.changeColumnName} 标识
	 * @return 前端返回格式
	 */
    Result deleteGetById(String accessToken,${primaryKey.columnType} ${primaryKey.changeColumnName});
    /**
	 * 根据主键查询
	 *
	 * @param accessToken accessToken
	 * @param ${primaryKey.changeColumnName} 标识
	 * @return 前端返回格式
	 */
    Result findById(String accessToken,${primaryKey.columnType} ${primaryKey.changeColumnName});
    /**
	 * 条件分页查询
	 *
	 * @param accessToken accessToken
	 * @param page 当前页
	 * @param size 显示多少条
	 * @param sort 排序字段
	 * @param ${fieldName} 查询条件
	 * @return 前端返回格式
	 */
    Result pageQuery(String accessToken,Integer page, Integer size, String sort, ${modelName} ${fieldName});
}
