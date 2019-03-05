package ${packageName}.${mapper};

import ${packageName}.${entity}.${modelName};
import org.apache.ibatis.annotations.Mapper;

/**
  * @author mc
  * Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
  * Version 1.0
  * Description ${comment}持久层
  */
@Mapper
public interface ${modelName}Mapper extends ${"tk.mybatis.mapper.common.Mapper"}<${modelName}> {

    int insertSelectiveCustom(${modelName} ${fieldName});
}
