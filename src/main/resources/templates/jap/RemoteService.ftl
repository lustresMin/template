package com.liaoin.microservice.consumer.platform.service;

import com.liaoin.common.jackson.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;
import java.util.List;

/**
 * @description ${comment}实体接口实现类
 * @createDate ${.now?string("yyyy-MM-dd HH:mm:ss")}
 * @version 1.0
 * @author mc
 */

@FeignClient(name = "provider-${fieldName}")
@RequestMapping("/${fieldName}/")
public interface ${modelName}RemoteService {
    /**
     * 新增
     * @return
     */
    @PostMapping("insert")
    Result insert(@RequestBody ${modelName} ${fieldName});
    /**
     * 修改
     * @return
     */
    @PostMapping("update")
    Result update(@RequestBody ${modelName} ${fieldName});
    /**
     * 批量删除
     * @return
     */
    @PostMapping("deleteInBatch")
    Result deleteInBatch(@RequestBody List<${modelName}> ${fieldName}List);
    /**
    * 根据主键删除
    * @return
    */
    @PostMapping("getById")
    Result deleteGetById(@RequestParam(value = "id") Integer id);
    /**
    * 根据主键查询
    * @return
    */
    @GetMapping("findOne")
    Result findOne(@RequestParam(value = "id") Integer id);
    /**
    * 条件分页查询
    * @return
    */
    @PostMapping("pageQuery")
    Result pageQuery(@RequestParam(value = "page") Integer page,
    @RequestParam(value = "size") Integer size,
    @RequestParam(value = "sort") String sort,
    @RequestBody ${modelName} ${fieldName});
    }
