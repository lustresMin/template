package ${domain};


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import org.springframework.beans.BeanUtils;
import ${entity}.${modelName};



/**
* @author mc
* Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
* Version 1.0
* Description ${comment}数据流
*/
@Getter
@Setter
@ApiModel(value = "${comment}")
public class ${modelName}DTO implements Serializable {














    public ${modelName} convertTo(){
        ConvertImpl impl = new ConvertImpl();
        return impl.doForward(this);
    }

    public ${modelName}DTO convertFor(${modelName} ${fieldName}){
        ConvertImpl impl = new ConvertImpl();
        return impl.doBackward(${fieldName},this);
    }

    private static class ConvertImpl implements Convert<${modelName}DTO , ${modelName}> {
        @Override
        public ${modelName} doForward(${modelName}DTO dto) {
            ${modelName} ${fieldName} = new ${modelName}();
            BeanUtils.copyProperties(dto,${fieldName});
            return ${fieldName};
        }
        @Override
        public ${modelName}DTO doBackward(${modelName} ${fieldName}) {
            ${modelName}DTO dto = new ${modelName}DTO();
            BeanUtils.copyProperties(${fieldName}, dto);
            return dto;
        }
        public ${modelName}DTO doBackward(${modelName} ${fieldName},${modelName}DTO dto) {
            BeanUtils.copyProperties(${fieldName}, dto);
            return dto;
        }
    }
}