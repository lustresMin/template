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
* Description ${comment}VO数据流
*/

@Data
@ApiModel(value = "${comment}VO")
public class ${modelName}VO implements Serializable {








    public ${modelName} convertTo(){
        ConvertImpl impl = new ConvertImpl();
        return impl.doForward(this);
    }

    public ${modelName}VO convertFor(${modelName} ${fieldName}){
        ConvertImpl impl = new ConvertImpl();
        return impl.doBackward(${fieldName});
    }

    private static class ConvertImpl implements Convert<${modelName}VO, ${modelName}> {
        @Override
        public ${modelName} doForward(${modelName}VO vo) {
            ${modelName} ${fieldName} = new ${modelName}();
            BeanUtils.copyProperties(vo,${fieldName});
            return ${fieldName};
        }
        @Override
            public ${modelName}VO doBackward(${modelName} ${fieldName}) {
                ${modelName}VO vo = new ${modelName}VO();
                BeanUtils.copyProperties(${fieldName}, vo);
                return vo;
        }
    }




}
