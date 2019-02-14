package ${packageName}.${mapper};

import ${packageName}.${entity}.${modelName};

/**
  * @author mc
  * Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
  * Version 1.0
  * Description
  */
public interface ${modelName}Mapper extends ${"tk.mybatis.mapper.common.Mapper"}<${modelName}> {

    int insertSelectiveCustom(${modelName} ${fieldName});
}
