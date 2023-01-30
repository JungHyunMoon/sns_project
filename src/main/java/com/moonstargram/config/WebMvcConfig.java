package com.moonstargram.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.moonstargram.common.FileManagerService;
import com.moonstargram.interceptor.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**") // 웹 이미지 주소 http://localhost:8080/images/aaaa_1620546868/sun.png
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);
		
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**")			// /** 아래 디렉토리 확인
		.excludePathPatterns("/favicon.ico", "/error", "/static/**", "/moonstargram/sign_out");
		
	}
}
