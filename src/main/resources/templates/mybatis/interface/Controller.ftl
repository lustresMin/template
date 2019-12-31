package ${controller};

import ${server}.${modelName}${service?cap_first};
import javax.validation.Valid;
import io.swagger.annotations.*;
import ${entity}.${modelName};
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import java.util.List;
import ${entity}.common.Result;
import ${entity}.common.ResultCode;

import javax.annotation.Resource;
import javax.validation.Valid;



/**
  * @author mc
  * Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
  * Version 1.0
  * Description ${comment}控制层
  */
@CrossOrigin
@RestController
@RequestMapping("/${fieldName}/")
@Api(tags  =  "${comment}Api")
public class ${modelName}Controller {

    @Resource
    private ${modelName}Service ${fieldName}Service;



    @Login
    @PostMapping("${version}/insert")
    @ApiOperation(value = "新增")
    public Object insert(@ApiParam(hidden = true)@Login Long userId,
                         @Valid ${modelName}VO vo,BindingResult errors) {
        if (errors.hasErrors()){
			StringBuilder builder = new StringBuilder();
			errors.getAllErrors().forEach(i -> builder.append(i.getDefaultMessage()).append(","));
            throw new CustomException(builder.toString());
		}
        return ${fieldName}Service.insertVO(vo);
    }

    @Login
    @PostMapping("${version}/update")
    @ApiOperation(value = "修改")
    public Object update(@ApiParam(hidden = true)@Login Long userId,
                         @Valid ${modelName}VO vo,BindingResult errors) {
        if (errors.hasErrors()){
			StringBuilder builder = new StringBuilder();
			errors.getAllErrors().forEach(i -> builder.append(i.getDefaultMessage()).append(","));
            throw new CustomException(builder.toString());
		}
        return ${fieldName}Service.updateVO(vo);
    }

    @Login
    @PostMapping("${version}/getById")
    @ApiOperation(value = "根据主键删除")
    public Object deleteGetById(@ApiParam(hidden = true)@Login Long userId,
                                @ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}")@NotNull @Min(1) ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        ${fieldName}Service.deleteGetById(${primaryKey.changeColumnName});
        return "";
    }

    @Login
    @PostMapping("${version}/findById")
    @ApiOperation(value = "根据主键查询")
    public Object findById(@ApiParam(hidden = true)@Login Long userId,
                           @ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}") @NotNull @Min(1) ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}Service.findById(${primaryKey.changeColumnName});
    }

    @Login
    @PostMapping("${version}/pageQuery")
    @ApiOperation(value = "条件分页查询")
    public Object pageQuery(@ApiParam(hidden = true)@Login Long userId,
                            @ApiParam(value = "第几页", required = true,example = "1") @RequestParam(value = "page") @NotNull @Min(0) Integer page,
                            @ApiParam(value = "多少条", required = true,example = "10")@RequestParam(value = "size") @NotNull @Min(1) Integer size,
                            @ApiParam(value = "排序字段")@RequestParam(value = "sort",required = false) String sort,
                            ${modelName}VO vo) {
        return ${fieldName}Service.pageQuery(page, size, sort, vo);
    }
}
