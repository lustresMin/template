package ${packageName}.controller;

import ${packageName}.${entity}.${modelName};
import ${packageName}.${service}.${modelName}${service?cap_first};
import javax.validation.Valid;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @description ${comment}实体类
 * @createDate ${.now?string("yyyy-MM-dd HH:mm:ss")}
 * @version 1.0
 * @author mc
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
    @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header")
    public Result insert(@ApiParam(hidden = true)@AuthorizationUser Integer userId,
                         @Valid @RequestBody ${modelName} ${fieldName},BindingResult errors) {
        return ${fieldName}Service.insert(${fieldName},userId);
    }

    @PutMapping("update")
    @ApiOperation(value = "修改")
    @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header")
    public Result update(@ApiParam(hidden = true)@AuthorizationUser Integer userId,
                         @Valid @RequestBody ${modelName} ${fieldName},BindingResult errors) {
        return ${fieldName}Service.update(${fieldName},userId);
    }

    @DeleteMapping("deleteInBatch")
    @ApiOperation(value = "批量删除")
    @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header")
    public Result deleteInBatch(@RequestBody List<${modelName}> ${fieldName}List,
                                @ApiParam(hidden = true)@AuthorizationUser Integer userId) {
        return ${fieldName}Service.deleteInBatch(${fieldName}List,userId);
    }

    @DeleteMapping("getById")
    @ApiOperation(value = "根据主键删除")
    @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header")
    public Result deleteGetById(@ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}") ${primaryKey.columnType} ${primaryKey.changeColumnName},
                                @ApiParam(hidden = true)@AuthorizationUser Integer userId) {
        return ${fieldName}Service.deleteGetById(${primaryKey.changeColumnName},userId);
    }

    @GetMapping("findOne")
    @ApiOperation(value = "根据主键查询")
    @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header")
    public Result findOne(@ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}") ${primaryKey.columnType} ${primaryKey.changeColumnName},
                          @ApiParam(hidden = true)@AuthorizationUser Integer userId) {
        return ${fieldName}Service.findOne(${primaryKey.changeColumnName});
    }

    @PostMapping("pageQuery")
    @ApiOperation(value = "条件分页查询")
    @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header")
    public Result pageQuery(@ApiParam(hidden = true)@AuthorizationUser Integer userId,
                            @ApiParam(value = "第几页", required = true) @RequestParam(value = "page") Integer page,
                            @ApiParam(value = "多少条",required = true)@RequestParam(value = "size") Integer size,
                            @ApiParam(value = "排序字段")@RequestParam(value = "sort",required = false) String sort,
                            @RequestBody(required = false) ${modelName} ${fieldName}) {
        return ${fieldName}Service.pageQuery(page, size, sort, ${fieldName});
    }
}
