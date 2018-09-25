package ${packageName}.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/${fieldName}/")
@Api(tags  =  "${fieldName}API")
public class ${modelName}Controller {

    @Autowired
    private ${modelName}Service ${fieldName}Service;

    @PostMapping("insert")
    @ApiOperation(value = "新增")
    @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header")
    public Result save(@ApiParam(hidden = true)@AuthorizationUser Integer userId,
                       @RequestBody ${modelName} ${fieldName}) {
        return ${fieldName}Service.insert(${fieldName});
    }

    @PutMapping("update")
    @ApiOperation(value = "修改")
    @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header")
    public Result update(@ApiParam(hidden = true)@AuthorizationUser Integer userId,
                         @RequestBody ${modelName} ${fieldName}) {
        return ${fieldName}Service.update(${fieldName});
    }

    @DeleteMapping("deleteInBatch")
    @ApiOperation(value = "批量删除")
    @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header")
    public Result deleteInBatch(@ApiParam(hidden = true)@AuthorizationUser Integer userId,
                                @RequestBody List<${modelName}> ${fieldName}List) {
        return ${fieldName}Service.deleteInBatch(${fieldName}List);
    }

    @DeleteMapping("getById")
    @ApiOperation(value = "根据主键删除")
    @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header")
    public Result deleteGetById(@ApiParam(hidden = true)@AuthorizationUser Integer userId,
                                @ApiParam(value = "主键",required = true)@RequestParam(value = "id") ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}Service.deleteGetById(id);
    }

    @GetMapping("findOne")
    @ApiOperation(value = "根据主键查询")
    @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header")
    public Result findOne(@ApiParam(hidden = true)@AuthorizationUser Integer userId,
                          @ApiParam(value = "主键",required = true)@RequestParam(value = "id") ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}Service.findOne(${primaryKey.changeColumnName});
    }

    @PostMapping("pageQuery")
    @ApiOperation(value = "条件分页查询",notes = "")
    @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header")
    public Result pageQuery(@ApiParam(hidden = true)@AuthorizationUser Integer userId,
                            @ApiParam(value = "第几页", required = true) @RequestParam(value = "page") Integer page,
                            @ApiParam(value = "多少条",required = true)@RequestParam(value = "size") Integer size,
                            @ApiParam(value = "排序字段",required = false)String sort,
                            @RequestBody(required = false) ${modelName} ${fieldName}) {
        return ${fieldName}Service.pageQuery(page, size, sort, ${fieldName});
    }
}
