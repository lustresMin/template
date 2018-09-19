package com.liaoin.microservice.consumer.platform.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

/**
 * @description:
 * @author:         mc
 * @createDate:     2018/7/2 14:58
 * @updateRemark:
 * @version:        1.0
 */
@Configuration
public class WebAppConfigurer implements WebMvcConfigurer {
    @Autowired
    private UserMethodArgumentResolver userMethodArgumentResolver;
    @Autowired
    private UserInterceptor userInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(userInterceptor)
                /*.excludePathPatterns("/consumer/user/login/**")
                .excludePathPatterns("/consumer/user/getCode/**")
                .excludePathPatterns("/consumer/user/register/**")
                .excludePathPatterns("/consumer/user/updatePassword/**")
                .excludePathPatterns("/consumer/news/appHomeBanner/**")
                .excludePathPatterns("/home/getAbout")*/
                .excludePathPatterns("/**")
                //.addPathPatterns("/**")
        ;
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(userMethodArgumentResolver);
    }


}
