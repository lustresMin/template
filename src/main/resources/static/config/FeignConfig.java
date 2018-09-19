package com.liaoin.microservice.consumer.platform.config;

import feign.Retryer;
import feign.form.spring.SpringFormEncoder;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.cloud.openfeign.support.SpringEncoder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.TimeUnit;

/**
 * @description:    Feign配置类
 * @author:         mc
 * @createDate:     2018/7/3 10:13
 * @updateRemark:
 * @version:        1.1
 */
@Configuration
public class FeignConfig {
    /**
     * 支持对象作为json接收
     */
    @Autowired
    private ObjectFactory<HttpMessageConverters> messageConverters;

    /**
     * 连接超时配置类
     * @return
     */
    @Bean
    public Retryer feignRetryer(){
        return new Retryer.Default(1000,TimeUnit.SECONDS.toMillis(1),5);
    }

    @Bean
    public SpringFormEncoder feignFormEncoder() {
        return new SpringFormEncoder(new SpringEncoder(messageConverters));
    }

    @Bean
    public feign.Logger.Level multipartLoggerLevel() {
        return feign.Logger.Level.FULL;
    }
}
