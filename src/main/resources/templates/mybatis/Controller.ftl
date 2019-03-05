package ${packageName}.controller;

import ${packageName}.${service}.${modelName}${service?cap_first};
import javax.validation.Valid;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;



import java.util.List;

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

    @PostMapping("insert")
    @ApiOperation(value = "新增")
    @ApiImplicitParam(name = "Authorization", value = "授权码请以(Bearer )开头", required = true, dataType = "string", paramType = "header")
    public Result insert(@ApiParam(hidden = true)@AuthorizationToken String accessToken,
                         @Validated(${modelName}.${modelName}InsertPcSimpleView.class) ${modelName} ${fieldName},BindingResult errors) {
        if (errors.hasErrors()){
			return Result.fail(errors.getAllErrors());
		}
        return ${fieldName}Service.insert(accessToken,${fieldName});
    }

    @PostMapping("update")
    @ApiOperation(value = "修改")
    @ApiImplicitParam(name = "Authorization", value = "授权码请以(Bearer )开头", required = true, dataType = "string", paramType = "header")
    public Result update(@ApiParam(hidden = true)@AuthorizationToken String accessToken,
                         @Validated(${modelName}.${modelName}UpdatePcSimpleView.class) ${modelName} ${fieldName},BindingResult errors) {
        if (errors.hasErrors()){
			return Result.fail(errors.getAllErrors());
		}
        return ${fieldName}Service.update(accessToken,${fieldName});
    }

    @PostMapping("getById")
    @ApiOperation(value = "根据主键删除")
    @ApiImplicitParam(name = "Authorization", value = "授权码请以(Bearer )开头", required = true, dataType = "string", paramType = "header")
    public Result deleteGetById(@ApiParam(hidden = true)@AuthorizationToken String accessToken,
                                @ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}") ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}Service.deleteGetById(accessToken,${primaryKey.changeColumnName});
    }

    @PostMapping("findById")
    @ApiOperation(value = "根据主键查询")
    @ApiImplicitParam(name = "Authorization", value = "授权码请以(Bearer )开头", required = true, dataType = "string", paramType = "header")
    public Result findById(@ApiParam(hidden = true)@AuthorizationToken String accessToken,
                           @ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}") ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}Service.findById(accessToken,${primaryKey.changeColumnName});
    }

    @PostMapping("pageQuery")
    @ApiOperation(value = "条件分页查询")
    @ApiImplicitParam(name = "Authorization", value = "授权码请以(Bearer )开头", required = true, dataType = "string", paramType = "header")
    public Result pageQuery(@ApiParam(hidden = true)@AuthorizationToken String accessToken,
                            @ApiParam(value = "第几页", required = true) @RequestParam(value = "page") Integer page,
                            @ApiParam(value = "多少条",required = true)@RequestParam(value = "size") Integer size,
                            @ApiParam(value = "排序字段")@RequestParam(value = "sort",required = false) String sort,
                            ${modelName} ${fieldName}) {
        return ${fieldName}Service.pageQuery(accessToken,page, size, sort, ${fieldName});
    }
}
