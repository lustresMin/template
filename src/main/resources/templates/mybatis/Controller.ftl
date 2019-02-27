package ${packageName}.controller;

import ${packageName}.common.jackson.Result;
import ${packageName}.${service}.${modelName}${service?cap_first};
import javax.validation.Valid;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;

import static ${packageName}.util.jackson.FrontResult.fail;


import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
  * @author mc
  * Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
  * Version 1.0
  * Description
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
    public Result insert(@ApiParam(value = "用户主键")@RequestParam(value = "${primaryKey.changeColumnName}",required = false)Integer userId,
                         @Valid @RequestBody ${modelName} ${fieldName},BindingResult errors) {
        if (errors.hasErrors()){
			return Result.fail(errors.getAllErrors());
		}
        return ${fieldName}Service.insert(${fieldName},userId);
    }

    @PostMapping("update")
    @ApiOperation(value = "修改")
    public Result update(@ApiParam(value = "用户主键")@RequestParam(value = "${primaryKey.changeColumnName}",required = false)Integer userId,
                         @Valid @RequestBody ${modelName} ${fieldName},BindingResult errors) {
        if (errors.hasErrors()){
			return Result.fail(errors.getAllErrors());
		}
        return ${fieldName}Service.update(${fieldName},userId);
    }

    @PostMapping("getById")
    @ApiOperation(value = "根据主键删除")
    public Result deleteGetById(@ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}") ${primaryKey.columnType} ${primaryKey.changeColumnName},
                                @ApiParam(value = "用户主键")@RequestParam(value = "${primaryKey.changeColumnName}",required = false) Integer userId) {
        return ${fieldName}Service.deleteGetById(${primaryKey.changeColumnName},userId);
    }

    @PostMapping("findById")
    @ApiOperation(value = "根据主键查询")
    public Result findById(@ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}") ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}Service.findById(${primaryKey.changeColumnName});
    }

    @PostMapping("pageQuery")
    @ApiOperation(value = "条件分页查询")
    public Result pageQuery(@ApiParam(value = "第几页", required = true) @RequestParam(value = "page") Integer page,
                            @ApiParam(value = "多少条",required = true)@RequestParam(value = "size") Integer size,
                            @ApiParam(value = "排序字段")@RequestParam(value = "sort",required = false) String sort,
                            ${modelName} ${fieldName}) {
        return ${fieldName}Service.pageQuery(page, size, sort, ${fieldName});
    }
}
