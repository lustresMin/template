package ${mappers};

import ${entity}.${modelName};

/**
  * @author mc
  * Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
  * Version 1.0
  * Description ${comment}持久层
  */
public interface ${modelName}Mapper extends ${"tk.mybatis.mapper.common.Mapper"}<${modelName}>,tk.mybatis.mapper.common.MySqlMapper<${modelName}> {


}
