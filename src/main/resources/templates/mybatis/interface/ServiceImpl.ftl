package ${serverImpl};

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import ${entity}.${modelName};
import ${mappers}.${modelName}${mapper?cap_first};
import ${server}.${modelName}${service?cap_first};
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.weekend.WeekendSqls;
import lombok.extern.slf4j.Slf4j;
import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
  * @author mc
  * Create date ${.now?string("yyyy-MM-dd HH:mm:ss")}
  * Version 1.0
  * Description ${comment}实现类
  */
@Slf4j
@Service
@Transactional(rollbackFor={RuntimeException.class, Exception.class})
public class ${modelName}ServiceImpl implements ${modelName}Service {
    @Resource
    private ${modelName}Mapper ${fieldName}Mapper;

    @Override
    public ${modelName} insert(${modelName} ${fieldName}) {
        ${fieldName}Mapper.insert(${fieldName});
        return ${fieldName};
    }

    @Override
    public void update(${modelName} ${fieldName}) {
        ${fieldName}Mapper.updateByPrimaryKeySelective(${fieldName});
    }

    @Override
    public void deleteById(${primaryKey.columnType} ${primaryKey.changeColumnName}){
        Optional<${modelName}> byId = this.findById(id);
        if (!byId.isPresent()) {
            throw new CustomException(ResultCode.ERROR.getCode(), ResultCode.RESULE_DATA_NONE.getMsg());
        }
        ${modelName} ${fieldName} = byId.get();
        ${fieldName}.setIsDelete(1);
        ${fieldName}.setUpdateTime(LocalDateTime.now());
        this.update(${fieldName});
    }


    @Override
    public Optional<${modelName}> findById(${primaryKey.columnType} ${primaryKey.changeColumnName}) {
        return Optional.ofNullable(${fieldName}Mapper.selectByPrimaryKey(${primaryKey.changeColumnName}));

    }

    @Override
    public Result pageQuery(Integer page, Integer size, String sort, ${modelName}VO ${fieldName}VO) {
        page = null  == page ? 1 : page;
        size = null  == size ? 10 : size;
        if (size > 101){
            return fail("num must not be greater than 100");
        }
        if (sort != null && !"".equals(sort.trim())){
			PageHelper.startPage(page, size,sort);
		}else {
			PageHelper.startPage(page, size);
		}
        Example.Builder builder = new Example.Builder(${modelName}.class);
        builder.where(WeekendSqls.<${modelName}>custom().andEqualTo(${modelName}::getIsDelete, 0));
        if(${fieldName}VO != null){
        }
        Page<${modelName}> all = (Page<${modelName}>) ${fieldName}Mapper.selectByExample(builder.build());
        return ok(all.getTotal(),all.getResult());
    }
}

