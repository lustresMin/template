package ${packageName}.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ${modelName}Repository extends JpaRepository<${modelName}, ${primaryKey.columnType}>, JpaSpecificationExecutor<${modelName}> {

}