##引入宏定义
        $!define

        #set($tableName = $tool.append($tableInfo.name, "DTO"))
        $!callback.setFileName($tool.append($tableName, ".java"))
        $!callback.setSavePath($tool.append($tableInfo.savePath, "/domain"))
        #if($tableInfo.savePackageName)package $!{tableInfo.savePackageName}.#{end};

        ##使用全局变量实现默认包导入
        $!autoImport
import java.io.Serializable;

##使用宏定义实现类注释信息
/**
 * @author $!author
 * Version 1.0
 * Create date $!time.currTime()
 * Description $!{tableInfo.comment}($!{tableInfo.name})表服务接口
 */
@Getter
@Setter
@ApiModel(value = "$!{tableInfo.comment}数据返回类")
public class $!{tableName} implements Serializable {
private static final long serialVersionUID = $!tool.serial();
        #foreach($column in $tableInfo.fullColumn)

@ApiModelProperty(value = "#if(${column.comment}) ${column.comment} #end")
private $!{tool.getClsNameByFullName($column.type)} $!{column.name};
        #end



public $!{tableInfo.name} convertTo(){
        ConvertImpl impl = new ConvertImpl();
        return impl.doForward(this);
        }

public $!{tableName} convertFor($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name})){
        ConvertImpl impl = new ConvertImpl();
        return impl.doBackward($!tool.firstLowerCase($!{tableInfo.name}),this);
        }

private static class ConvertImpl implements Convert<$!{tableName} , $!{tableInfo.name}> {
@Override
public $!{tableInfo.name} doForward($!{tableName} dto) {
        $!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}) = new $!{tableInfo.name}();
        BeanUtils.copyProperties(dto,$!tool.firstLowerCase($!{tableInfo.name}));
        return $!tool.firstLowerCase($!{tableInfo.name});
        }
@Override
public $!{tableName} doBackward($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name})) {
        $!{tableName} dto = new $!{tableName}();
        BeanUtils.copyProperties($!tool.firstLowerCase($!{tableInfo.name}), dto);
        return dto;
        }
public $!{tableName} doBackward($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}),$!{tableName} dto) {
        BeanUtils.copyProperties($!tool.firstLowerCase($!{tableInfo.name}), dto);
        return dto;
        }
        }



        }