package com.prm.project.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//CORS GLOBAL(Cấu hình sử dụng toàn hệ thống)
@Configuration
public class CorConfig implements WebMvcConfigurer{

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry
		.addMapping("/api/**")
		.allowedOrigins("*")
		.allowedMethods("POST","PUT","GET","DELETE")
		.allowCredentials(false)
		.maxAge(4800);
		
	}
	
}
