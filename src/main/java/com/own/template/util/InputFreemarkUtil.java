package com.own.template.util;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.freemarker.FreeMarkerConfigurationFactoryBean;

import java.io.*;
import java.util.Map;

@Component
public class InputFreemarkUtil {

    @Autowired
    private FreeMarkerConfigurationFactoryBean bean;

    private void generateFileByTemplate(String templateName, String diskPath, String fileName, Map<String, Object> dataModel) throws Exception {
        Configuration configuration = bean.createConfiguration();
        Template template = configuration.getTemplate(templateName);
        File targetFile = new File(diskPath);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        FileOutputStream fos = new FileOutputStream(diskPath + "/" + fileName);
        Writer out = new BufferedWriter(new OutputStreamWriter(fos, "UTF-8"), 10240);
        template.process(dataModel, out);
    }


    public void generateModelFile(Map<String, Object> dataModel, String diskPath) throws Exception {
        // 生成模板的位置
        String suffix = ".java";
        String modelName = (String) dataModel.get("modelName");
        String fileName = modelName + suffix;
        // 模板名称
        String templateName = "Entity.ftl";
        generateFileByTemplate(templateName, diskPath, fileName, dataModel);
    }

    public void generateModelDtoFile(Map<String, Object> dataModel, String diskPath) throws Exception {
        // 生成模板的位置
        String suffix = ".java";
        String modelName = (String) dataModel.get("modelName");
        String fileName = modelName + "Dto" + suffix;
        // 模板名称
        String templateName = "DTO.ftl";
        generateFileByTemplate(templateName, diskPath, fileName, dataModel);
    }

    public void generateConsumerControllerFile(Map<String, Object> dataModel, String diskPath) throws Exception {
        // 生成模板的位置
        String suffix = "ConsumerController.java";
        String modelName = (String) dataModel.get("modelName");
        String fileName = modelName + suffix;
        // 模板名称
        String templateName = "ConsumerController.ftl";
        generateFileByTemplate(templateName, diskPath, fileName, dataModel);
    }

    public void generateRemoteServiceFile(Map<String, Object> dataModel, String diskPath) throws Exception {
        // 生成模板的位置
        String suffix = "RemoteService.java";
        String modelName = (String) dataModel.get("modelName");
        String fileName = modelName + suffix;
        // 模板名称
        String templateName = "RemoteService.ftl";
        generateFileByTemplate(templateName, diskPath, fileName, dataModel);
    }


    public void generateRepositoryFile(Map<String, Object> dataModel, String diskPath) throws Exception {
        // 生成模板的位置
        String suffix = "Repository.java";
        String modelName = (String) dataModel.get("modelName");
        String fileName = modelName + suffix;
        // 模板名称
        String templateName = "Repository.ftl";
        generateFileByTemplate(templateName, diskPath, fileName, dataModel);
    }

    public void generateMapperFile(Map<String, Object> dataModel, String diskPath) throws Exception {
        // 生成模板的位置
        String suffix = "Mapper.java";
        String modelName = (String) dataModel.get("modelName");
        String fileName = modelName + suffix;
        // 模板名称
        String templateName = "Mapper.ftl";
        generateFileByTemplate(templateName, diskPath, fileName, dataModel);
    }

    public void generateServiceInterfaceFile(Map<String, Object> dataModel, String diskPath) throws Exception {
        // 生成模板的位置
        String suffix = "Service.java";
        String modelName = (String) dataModel.get("modelName");
        String fileName = modelName + suffix;
        // 模板名称
        String templateName = "ServiceInterface.ftl";
        generateFileByTemplate(templateName, diskPath, fileName, dataModel);
    }

    public void generateServiceImplFile(Map<String, Object> dataModel, String diskPath) throws Exception {
        // 生成模板的位置
        String suffix = "ServiceImpl.java";
        String modelName = (String) dataModel.get("modelName");
        String fileName = modelName + suffix;
        // 模板名称
        String templateName = "ServiceImpl.ftl";
        // 模型数据
        generateFileByTemplate(templateName, diskPath, fileName, dataModel);
    }

    public void generateControllerFile(Map<String, Object> dataModel, String diskPath) throws Exception {
        // 生成模板的位置
        String suffix = "Controller.java";
        String modelName = (String) dataModel.get("modelName");
        String fileName = modelName + suffix;
        // 模板名称
        String templateName = "Controller.ftl";
        // 模型数据
        generateFileByTemplate(templateName, diskPath, fileName, dataModel);
    }

    public void generateMapperXmlFile(Map<String, Object> dataModel, String diskPath) throws Exception {
        // 生成模板的位置
        String suffix = "Mapper.xml";
        String modelName = (String) dataModel.get("modelName");
        String fileName = modelName + suffix;
        // 模板名称
        String templateName = "mapperXml.ftl";
        // 模型数据
        generateFileByTemplate(templateName, diskPath, fileName, dataModel);
    }


}
