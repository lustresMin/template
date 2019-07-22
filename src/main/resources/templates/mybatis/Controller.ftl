package ${controller};

import ${server}.${modelName}${service?cap_first};
import javax.validation.Valid;
import io.swagger.annotations.*;
import ${entity}.${modelName};
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import com.liaoin.smart.commons.jackson.Result;
import com.github.pagehelper.PageInfo;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

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
    public Result<${modelName}> insert(@RequestParam(value = "accessToken") String accessToken,
                                       @Valid ${modelName} ${fieldName},BindingResult errors) {
        if (errors.hasErrors()){
			StringBuilder builder = new StringBuilder();
			errors.getAllErrors().forEach(i -> builder.append(i.getDefaultMessage()).append(","));
			return Result.fail(builder.toString());
		}
        return ${fieldName}Service.insert(accessToken,${fieldName});
    }

    @PostMapping("${version}/update")
    @ApiOperation(value = "修改")
    public Result update(@RequestParam(value = "accessToken") String accessToken,
                         @Valid ${modelName} ${fieldName},BindingResult errors) {
        if (errors.hasErrors()){
			StringBuilder builder = new StringBuilder();
			errors.getAllErrors().forEach(i -> builder.append(i.getDefaultMessage()).append(","));
			return Result.fail(builder.toString());
		}
        return ${fieldName}Service.update(accessToken,${fieldName});
    }

    @PostMapping("${version}/getById")
    @ApiOperation(value = "根据主键删除")
    public Result deleteGetById(@RequestParam(value = "accessToken") String accessToken,
                                @ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}")@NotNull ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}Service.deleteGetById(accessToken,${primaryKey.changeColumnName});
    }

    @PostMapping("${version}/findById")
    @ApiOperation(value = "根据主键查询")
    public Result<${modelName}> findById(@RequestParam(value = "accessToken") String accessToken,
                                         @ApiParam(value = "主键",required = true)@RequestParam(value = "${primaryKey.changeColumnName}")@NotNull ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}Service.findById(accessToken,${primaryKey.changeColumnName});
    }

    @PostMapping("${version}/pageQuery")
    @ApiOperation(value = "条件分页查询")
    public Result<PageInfo<${modelName}>> pageQuery(@RequestParam(value = "accessToken") String accessToken,
                                                @ApiParam(value = "第几页", required = true,example = "1") @RequestParam(value = "page") Integer page,
                                                @ApiParam(value = "多少条",required = true,example = "10")@RequestParam(value = "size") Integer size,
                                                @ApiParam(value = "排序字段",example = "create_time desc")@RequestParam(value = "sort",required = false) String sort,
                                                ${modelName} ${fieldName}) {
        return ${fieldName}Service.pageQuery(accessToken,page, size, sort, ${fieldName});
    }
}
