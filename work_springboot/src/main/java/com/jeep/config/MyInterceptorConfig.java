package com.jeep.config;

import com.jeep.utils.MyInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MyInterceptorConfig implements WebMvcConfigurer {
    @Autowired(required = false)
    MyInterceptor myInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(myInterceptor).addPathPatterns("/**")
                .excludePathPatterns("/loginServlet","/index.jsp","/resources/**")
                .excludePathPatterns("/js/**").excludePathPatterns("/css/**")
                .excludePathPatterns("/images/**").excludePathPatterns("/page/**")
                .excludePathPatterns("/json/**");
    }
}
