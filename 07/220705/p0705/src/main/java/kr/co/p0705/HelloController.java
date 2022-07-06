package kr.co.p0705;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
	@GetMapping("/hello")
	public String hello() {
		
		//
		
		System.out.println("hello");
		
		//
		
		return "hello";
	}
}
/*
	AOP와 비슷한 spring 기능
	
	1) 웹 필터 (톰캣)
	2) 인터셉터 (컨트롤러)
	3) AOP (메서드)
*/