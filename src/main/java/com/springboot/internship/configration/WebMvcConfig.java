package com.springboot.internship.configration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/avatar/**")
                .addResourceLocations("file:D:/IDEA/workspace/internship/fileBase/avatar/");
        registry.addResourceHandler("/CV/**")
                .addResourceLocations("file:D:/IDEA/workspace/internship/fileBase/CV/");
        registry.addResourceHandler("/logo/**")
                .addResourceLocations("file:D:/IDEA/workspace/internship/fileBase/logo/");
    }

}
