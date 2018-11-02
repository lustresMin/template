package ${packageName}.repository;

import ${packageName}.${entity}.${modelName};
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @description ${comment}实体接口实现类
 * @createDate ${.now?string("yyyy-MM-dd HH:mm:ss")}
 * @version 1.0
 * @author mc
 */
public interface ${modelName}Repository extends JpaRepository<${modelName}, ${primaryKey.columnType}>, JpaSpecificationExecutor<${modelName}> {

}