package com.own.template.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ColumnClass {
    /**
     * 数据库字段名称
     */
    private String columnName;
    /**
     * 数据库字段类型
     */
    private String columnType;
    /**
     * 数据库字段首字母小写且去掉下划线字符串
     */
    private String changeColumnName;
    /**
     * 数据库字段注释
     */
    private String columnComment;
    /**
     * 是否主键
     */
    private boolean primaryKey;

}
