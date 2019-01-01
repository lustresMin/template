package ${packageName}.repository;

import ${packageName}.${entity}.${modelName};
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
  * @author mc
  * Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
  * Version 1.0
  * Description
  */
public interface ${modelName}Repository extends JpaRepository<${modelName}, ${primaryKey.columnType}>, JpaSpecificationExecutor<${modelName}> {

}