package ${mappers};

import ${entity}.${modelName};
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;
/**
  * @author mc
  * Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
  * Version 1.0
  * Description ${comment}持久层
  */
public interface ${modelName}Mapper extends Mapper<${modelName}>,MySqlMapper<${modelName}> {


}
