package com.prm.project.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {
	
	@Bean
	public Docket api() {
		
		return new Docket(DocumentationType.SWAGGER_2)
				.select()
				.apis(RequestHandlerSelectors.basePackage("com.prm.project.api"))
				.build()
				.apiInfo(apiInfo());	
	}
	
	private ApiInfo apiInfo() {
		return new ApiInfo(
				"PRM Project about Flutter", 
				"Api has basic function: login, register, booking,...", 
				"nth.api.v1", 
				"Term of service", 
				new Contact("NGUYỄN THANH HIỆP", "404notfound.com", "hiepntse140248@fpt.edu.vn"),
				"License of API", "API license url",java.util.Collections.emptyList());
	}
}