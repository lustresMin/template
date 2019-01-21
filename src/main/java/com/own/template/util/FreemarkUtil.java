package com.own.template.util;

import com.own.template.entity.ColumnClass;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FreemarkUtil {

    public static Map<String, Object> generateDataModel(Connection connection, String tableName,String packageName) throws Exception {
        DatabaseMetaData databaseMetaData = connection.getMetaData();
        //表注释
		ResultSet hr = databaseMetaData.getTables(null, "HR", tableName, new String[]{"TABLE", "VIEW"});
		String comment="";
		while(hr.next()){
			System.out.print("目录名："+hr.getString(1));
			System.out.print(" 模式名："+hr.getString(2));
			System.out.print(" 表名："+hr.getString(3));
			System.out.print(" 表的类型："+hr.getString(4));
			System.out.println(" 注释："+hr.getString(5));
			comment=hr.getString(5);
		}
		// 主键元数据
        ResultSet primaryKeys = databaseMetaData.getPrimaryKeys(connection.getCatalog(), connection.getSchema(), tableName);
        // 列元数据
        ResultSet columns = databaseMetaData.getColumns(connection.getCatalog(), connection.getSchema(), tableName, null);
        // 封装模型数据
        Map<String, Object> dataModel = new HashMap<>();
        ColumnClass primaryKey = new ColumnClass();
        while (primaryKeys.next()) {
            String columnName = primaryKeys.getString("COLUMN_NAME");
            primaryKey.setColumnName(columnName);
            primaryKey.setChangeColumnName(getFieldName(getModelName(columnName)));
        }
        List<ColumnClass> columnClassList = new ArrayList<>();
        while (columns.next()) {
			ColumnClass columnClass = new ColumnClass();
            // 1.数据库字段名称
            String columnName = columns.getString("COLUMN_NAME");
            columnClass.setColumnName(columnName);
            // 2.Java变量名称
            String changeColumnName = getFieldName(getModelName(columnName));
            columnClass.setChangeColumnName(changeColumnName);
            // 4.Java数据类型
            String typeName = columns.getString("TYPE_NAME");
            columnClass.setColumnType(getJavaTypeSqlServer(typeName));
            // 3.数据库中的字段注释
            String remarks = columns.getString("REMARKS");
            columnClass.setColumnComment(remarks);
            // 5.更新主键的Java数据类型
            if (changeColumnName.equals(primaryKey.getChangeColumnName())) {
                columnClass.setPrimaryKey(true);
                primaryKey.setColumnType(getJavaTypeSqlServer(typeName));
            } else {
				columnClass.setColumnType(getJavaTypeSqlServer(typeName));
                columnClass.setPrimaryKey(false);
            }
            // 6.将columnClass对象添加到集合中
            columnClassList.add(columnClass);
        }
        dataModel.put("primaryKey", primaryKey);//主键列
        dataModel.put("columnClassList", columnClassList);//所有字段信息
        dataModel.put("tableName", tableName);
        dataModel.put("modelName", getModelName(tableName));
        dataModel.put("fieldName", getFieldName(getModelName(tableName)));
		dataModel.put("packageName", packageName);
		dataModel.put("comment",comment);

		dataModel.put("entity", "entity");
		dataModel.put("mapper", "mapper");
		dataModel.put("service", "service");
		dataModel.put("controller", "controller");

        return dataModel;
    }

    private static String getFieldName(String str) {
        String s1 = str.substring(0, 1).toLowerCase();
        String s2 = str.substring(1);
        return s1 + s2;
    }
	//mysql
    private static String getJavaTypeMysql(String typeName) {
        Map<String, String> map = new HashMap<>(16);
        map.put("VARCHAR", "String");
        map.put("TEXT", "String");
        map.put("INT", "Integer");
        map.put("BIGINT", "Long");
        map.put("DOUBLE", "Double");
        map.put("decimal", "BigDecimal");
        map.put("DATE", "java.util.Date");
        map.put("DATETIME", "java.util.Date");
        map.put("LONGTEXT", "String");
        map.put("FLOAT", "Float");
        map.put("BIT", "Boolean");
        map.put("TINYBLOB", "java.time.LocalDateTime");

        return map.get(typeName);
    }
	//SqlServer
	private static String getJavaTypeSqlServer(String typeName) {
		Map<String, String> map = new HashMap<>(16);
		map.put("nvarchar", "String");
		map.put("varchar", "String");
		map.put("TEXT", "String");
		map.put("int identity", "Integer");
		map.put("int", "Integer");
		map.put("bigint", "Long");
		map.put("DOUBLE", "Double");
		map.put("decimal", "BigDecimal");
		map.put("date", "java.util.Date");
		map.put("DATETIME", "java.util.Date");
		map.put("LONGTEXT", "String");
		map.put("FLOAT", "Float");
		map.put("BIT", "Boolean");
		map.put("TINYBLOB", "java.time.LocalDateTime");

		return map.get(typeName);
	}
    private static String getModelName(String str) {
        StringBuilder sb = new StringBuilder();
        // 将字符串全部变为小写
        str = str.toLowerCase();
        // 切割字符串为字符数组
        String[] strArray = str.split("_");
        // 遍历字符数组，将首字母变为大写
        for (String s : strArray) {
            // 如果第一个字符为一个字母，则跳过
            if (s.length() == 1) {
                continue;
            }
            String c = s.substring(0, 1);
            sb.append(c.toUpperCase());
            sb.append(s.substring(1));
        }
        return sb.toString();
    }
}
