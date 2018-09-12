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

    @Autowired
    private ${modelName}Service ${fieldName}Service;

    @PostMapping("insert")
    @ApiOperation(value = "新增")
    public Result insert(@Valid @RequestBody ${modelName} ${fieldName},
                         @RequestParam Integer userId,
                         BindingResult errors) {
        return ${fieldName}Service.insert(${fieldName},userId);
    }

    @PutMapping("update")
    @ApiOperation(value = "修改")
    public Result update(@Valid @RequestBody ${modelName} ${fieldName},
                         @RequestParam Integer userId,
                         BindingResult errors) {
        return ${fieldName}Service.update(${fieldName},userId);
    }

    @DeleteMapping("deleteInBatch")
    @ApiOperation(value = "批量删除")
    public Result deleteInBatch(@RequestBody List<${modelName}> ${fieldName}List,@RequestParam Integer userId) {
        return ${fieldName}Service.deleteInBatch(${fieldName}List,userId);
    }

    @DeleteMapping("getById")
    @ApiOperation(value = "根据主键删除")
    public Result deleteGetById(@ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}") ${primaryKey.columnType} ${primaryKey.changeColumnName},
                                @RequestParam(value = "userId") Integer userId) {
        return ${fieldName}Service.deleteGetById(${primaryKey.changeColumnName},userId);
    }

    @GetMapping("findOne")
    @ApiOperation(value = "根据主键查询")
    public Result findOne(@ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}") ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}Service.findOne(${primaryKey.changeColumnName});
    }

    @GetMapping("pageQuery")
    @ApiOperation(value = "条件分页查询",notes = "")
    public Result pageQuery(@ApiParam(value = "第几页", required = true) @RequestParam(value = "page") Integer page,
                            @ApiParam(value = "多少条",required = true)@RequestParam(value = "size") Integer size,
                            @ApiParam(value = "排序字段",required = false)@RequestParam(value = "sort",required = false)String sort,
                            @RequestBody(required = false) ${modelName} ${fieldName}) {
        return ${fieldName}Service.pageQuery(page, size, sort, ${fieldName});
    }
}
