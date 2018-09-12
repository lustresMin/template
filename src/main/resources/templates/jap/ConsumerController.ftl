package com.liaoin.microservice.consumer.platform.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import com.liaoin.common.jackson.Result;

@RestController
@RequestMapping("/consumer/${fieldName}/")
@Api(tags  = "${fieldName}API")
public class ${modelName}ConsumerController {

    @Autowired
    private ${modelName}RemoteService ${fieldName}RemoteService;

    @PostMapping("insert")
    @ApiOperation(value = "新增")
    public Result save(@RequestBody ${modelName} ${fieldName}) {
        return ${fieldName}RemoteService.insert(${fieldName});
    }

    @PostMapping("update")
    @ApiOperation(value = "修改")
    public Result update(@RequestBody ${modelName} ${fieldName}) {
        return ${fieldName}RemoteService.update(${fieldName});
    }

    @PostMapping("deleteInBatch")
    @ApiOperation(value = "批量删除")
    public Result deleteInBatch(@RequestBody List<${modelName}> ${fieldName}List) {
        return ${fieldName}RemoteService.deleteInBatch(${fieldName}List);
    }

    @PostMapping("getById")
    @ApiOperation(value = "根据主键删除")
    public Result deleteGetById(@ApiParam(value = "主键",required = true)@RequestParam(value = "id") ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}RemoteService.deleteGetById(id);
    }

    @GetMapping("findOne")
    @ApiOperation(value = "根据主键查询")
    public Result findOne(@ApiParam(value = "主键",required = true)@RequestParam(value = "id") ${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return ${fieldName}RemoteService.findOne(${primaryKey.changeColumnName});
    }

    @PostMapping("pageQuery")
    @ApiOperation(value = "条件分页查询",notes = "")
    public Result pageQuery(@ApiParam(value = "第几页", required = true) @RequestParam(value = "page") Integer page,
                            @ApiParam(value = "多少条",required = true)@RequestParam(value = "size") Integer size,
                            @ApiParam(value = "排序字段,暂时未启用,传空串",required = false) String sort,
                            @RequestBody ${modelName} ${fieldName}) {
        return ${fieldName}RemoteService.pageQuery(page, size, sort, ${fieldName});
    }
}
