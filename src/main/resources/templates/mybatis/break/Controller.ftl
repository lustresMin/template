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


import static ${entity}.common.Result.fail;
import static ${entity}.common.Result.ok;


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

    @PostMapping("${version}/insert")
    @ApiOperation(value = "新增")
    public Result insert(@ApiParam(hidden = true)@Login Long userId,
                         @Valid ${modelName}Dto ${fieldName}Dto,BindingResult errors) {
        if (errors.hasErrors()){
			StringBuilder builder = new StringBuilder();
			errors.getAllErrors().forEach(i -> builder.append(i.getDefaultMessage()).append(","));
			return fail(builder.toString());
		}
        return ${fieldName}Service.insert(userId,${fieldName}Dto);
    }

    @PostMapping("${version}/update")
    @ApiOperation(value = "修改")
    public Result update(@ApiParam(hidden = true)@Login Long userId,
                         @Valid ${modelName}Dto ${fieldName}Dto,BindingResult errors) {
        if (errors.hasErrors()){
			StringBuilder builder = new StringBuilder();
			errors.getAllErrors().forEach(i -> builder.append(i.getDefaultMessage()).append(","));
			return fail(builder.toString());
		}
        return ${fieldName}Service.update(userId,${fieldName}Dto);
    }

    @PostMapping("${version}/getById")
    @ApiOperation(value = "根据主键删除")
    public Result deleteGetById(@ApiParam(hidden = true)@Login Long userId,
                                @ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}") ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}Service.deleteGetById(userId,${primaryKey.changeColumnName});
    }

    @PostMapping("${version}/findById")
    @ApiOperation(value = "根据主键查询")
    public Result findById(@ApiParam(hidden = true)@Login Long userId,
                           @ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}") ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}Service.findById(userId,${primaryKey.changeColumnName});
    }

    @PostMapping("${version}/pageQuery")
    @ApiOperation(value = "条件分页查询")
    public Result pageQuery(@ApiParam(hidden = true)@Login Long userId,
                            @ApiParam(value = "第几页", required = true,example = "1") @RequestParam(value = "page") Integer page,
                            @ApiParam(value = "多少条",required = true,example = "10")@RequestParam(value = "size") Integer size,
                            @ApiParam(value = "排序字段",example = "create_time desc")@RequestParam(value = "sort",required = false) String sort,
                            ${modelName}Dto ${fieldName}Dto) {
        return ${fieldName}Service.pageQuery(userId,page, size, sort, ${fieldName}Dto);
    }
}
