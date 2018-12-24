package ${packageName}.${entity};

import lombok.Data;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import javax.persistence.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
  * @author mc
  * Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
  * Version 1.0
  * Description
  */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("${comment}实体类")
public class ${modelName} implements Serializable {

    public interface ${modelName}SimpleView {};
	public interface ${modelName}DetailView extends ${modelName}SimpleView {};

    @Id
    @KeySql(useGeneratedKeys = true)
<#if columnClassList ??>
    <#list columnClassList as column>
    <#if column.columnType == "java.util.Date">

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value="${column.columnComment}")
    private ${column.columnType} ${column.changeColumnName};

    <#else>

    @ApiModelProperty(value="${column.columnComment}")
    private ${column.columnType} ${column.changeColumnName};
    </#if>
    </#list>
</#if>



}