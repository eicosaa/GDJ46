package kr.co.p0705;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
@ServletComponentScan
public class P0705Application implements WebMvcConfigurer {
	
	@Autowired MyInterceptor myInterceptor;

	public static void main(String[] args) {
		SpringApplication.run(P0705Application.class, args);
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		
		// 인터셉터를 호출 + HelloController
		registry.addInterceptor(myInterceptor).addPathPatterns("/*");
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
}
