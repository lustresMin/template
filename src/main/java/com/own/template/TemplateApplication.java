package com.own.template;

import com.own.template.util.CodeGenerateUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class TemplateApplication {
    public static void main(String[] args) {
        ConfigurableApplicationContext context = SpringApplication.run(TemplateApplication.class, args);
        try {
            context.getBean(CodeGenerateUtils.class).generate();
            context.close();
        } catch (Exception e) {
            e.printStackTrace();
            context.close();
        }
    }
}
