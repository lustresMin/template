package ${packageName}.${entity};


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import org.springframework.beans.BeanUtils;

/**
* @author mc
* Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
* Version 1.0
* Description ${comment}数据流
*/
@Getter
@Setter
@ApiModel(value = "${comment}")
public class ${modelName}Dto implements Serializable {


    public ${modelName} convertTo(){
        ConvertImpl impl = new ConvertImpl();
        return impl.doForward(this);
    }

    public ${modelName}Dto convertFor(${modelName} ${fieldName}){
        ConvertImpl impl = new ConvertImpl();
        return impl.doBackward(${fieldName});
    }

    private static class ConvertImpl implements Convert<${modelName}Dto, ${modelName}> {
        @Override
        public ${modelName} doForward(${modelName}Dto dto) {
            ${modelName} ${fieldName} = new ${modelName}();
            BeanUtils.copyProperties(dto,${fieldName});
            return department;
        }
        @Override
        public DepartmentDto doBackward(${modelName} ${fieldName}) {
            ${modelName} dto = new ${modelName}();
            BeanUtils.copyProperties(${fieldName}, dto);
            return dto;
        }
    }
}
