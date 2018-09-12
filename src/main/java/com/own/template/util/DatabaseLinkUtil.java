package com.own.template.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@Component
public class DatabaseLinkUtil {
    @Value("${spring.datasource.driver-class-name}")
    private  String driver;
    @Value("${spring.datasource.url}")
    private  String url;
    @Value("${spring.datasource.username}")
    private  String username;
    @Value("${spring.datasource.password}")
    private  String password;


    public Connection getConnection() throws Exception {
        Class.forName(driver);
		Properties props =new Properties();
		props.put("user", username);
		props.put("password", password);
		//表注释
		props.put("useInformationSchema","true");
        return DriverManager.getConnection(url, props);
    }

    static List<String> getTableNames(Connection connection) throws Exception {
        DatabaseMetaData databaseMetaData = connection.getMetaData();
        ResultSet tables = databaseMetaData.getTables(connection.getCatalog(), connection.getSchema(), null, new String[]{"TABLE"});
        List<String> tableNames = new ArrayList<>();
        while (tables.next()) {
            tableNames.add(tables.getString("TABLE_NAME"));
        }
        return tableNames;
    }
}
