package com.own.template.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

@Component
public class CodeGenerateUtils {
	@Value("${targetProject}")
	private String targetProject;

	@Value("${controller}")
    private String controller;

	@Value("${server}")
	private String server;

    @Value("${serverImpl}")
    private String serverImpl;

    @Value("${mappers}")
    private String mappers;

    @Value("${entity}")
    private String entity;
    @Value("${data_resources}")
    private String data_resources;


    @Autowired
    private DatabaseLinkUtil databaseLinkUtil;
    @Autowired
    private InputFreemarkUtil inputFreemarkUtil;
    @Value("${TABLE_NAME}")
    private String table;
    public void generate() throws Exception {
        String[] split = table.split(",");
        String packageName=controller.substring(0,controller.length()-11);
        Connection connection = databaseLinkUtil.getConnection();
        List<String> tableNames = DatabaseLinkUtil.getTableNames(connection);
        for (String tableName : tableNames) {
            for (String t:split) {
                if (t.equals(tableName)) {
                    Map<String, Object> stringObjectMap = FreemarkUtil.generateDataModel(connection, tableName, packageName);
                    // 生成Controller文件
                    inputFreemarkUtil.generateControllerFile(stringObjectMap, targetProject + controller.replace(".", "/"));
                    // 生成service层接口文件
                    inputFreemarkUtil.generateServiceInterfaceFile(stringObjectMap, targetProject + server.replace(".", "/"));
                    // 生成serviceImpl层文件
                    inputFreemarkUtil.generateServiceImplFile(stringObjectMap, targetProject + serverImpl.replace(".", "/"));

					if("data_resources".equals("mybatis")){
						// 生成DAO  Mapper 层接口文件
						inputFreemarkUtil.generateMapperFile(stringObjectMap, targetProject + mappers.replace(".", "/"));
					}
					if("data_resources".equals("jpa")){
						// 生成DAO  Repository 层接口文件
                    	inputFreemarkUtil.generateRepositoryFile(stringObjectMap, targetProject + mappers.replace(".", "/"));

					}
					if("data_resources".equals("mybatis")) {
						//生成POJO
						inputFreemarkUtil.generateModelFile(stringObjectMap, targetProject + entity.replace(".", "/"));
					}
				}
            }
        }
    }

}
