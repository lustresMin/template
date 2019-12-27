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
    @Value("${packageName}")
    private String packageName;
    @Value("${version}")
    private String version;
    @Value("${dto}")
    private String dto;


    @Autowired
    private DatabaseLinkUtil databaseLinkUtil;
    @Autowired
    private InputFreemarkUtil inputFreemarkUtil;
    @Value("${TABLE_NAME}")
    private String table;
    public void generate() throws Exception {
		String[] split = null;
    	if (table != null && !"".equals(table)){
			split = table.split(",");
		}
        Connection connection = databaseLinkUtil.getConnection();
        List<String> tableNames = DatabaseLinkUtil.getTableNames(connection);
        for (String tableName : tableNames) {
        	if (split != null && split.length != 0) {
				for (String t : split) {
					if (t.equals(tableName)) {
						abstractDate(connection,tableName,packageName);
					}
				}
			}else {
				abstractDate(connection,tableName,packageName);
			}
        }
    }

    public void abstractDate(Connection connection,String tableName,String packageName) throws Exception{
		Map<String, Object> stringObjectMap = FreemarkUtil.generateDataModel(connection, tableName, packageName);
		stringObjectMap.put("mappers",mappers);
		stringObjectMap.put("serverImpl",serverImpl);
		stringObjectMap.put("server",server);
		stringObjectMap.put("controller",controller);
		stringObjectMap.put("entity",entity);
		stringObjectMap.put("version",version);
		// 生成Controller文件
		inputFreemarkUtil.generateControllerFile(stringObjectMap, targetProject + controller.replace(".", "/"));
		// 生成service层接口文件
		inputFreemarkUtil.generateServiceInterfaceFile(stringObjectMap, targetProject + server.replace(".", "/"));
		// 生成serviceImpl层文件
		inputFreemarkUtil.generateServiceImplFile(stringObjectMap, targetProject + serverImpl.replace(".", "/"));

		if (data_resources.equals("mybatis")) {
			// 生成DAO  Mapper 层接口文件

			inputFreemarkUtil.generateMapperFile(stringObjectMap, targetProject + mappers.replace(".", "/"));
		}
		if (data_resources.equals("jpa")) {
			// 生成DAO  Repository 层接口文件
			inputFreemarkUtil.generateRepositoryFile(stringObjectMap, targetProject + mappers.replace(".", "/"));

		}
		if (data_resources.equals("mybatis")) {
			//生成POJO
			inputFreemarkUtil.generateModelFile(stringObjectMap, targetProject + entity.replace(".", "/"));
			inputFreemarkUtil.generateMapperXmlFile(stringObjectMap, targetProject + entity.replace(".", "/"));
			inputFreemarkUtil.generateModelDtoFile(stringObjectMap, targetProject + dto.replace(".", "/"));
			inputFreemarkUtil.generateModelVoFile(stringObjectMap, targetProject + dto.replace(".", "/"));
		}
	}

}
