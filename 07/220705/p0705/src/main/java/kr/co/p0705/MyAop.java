package kr.co.p0705;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class MyAop {

	@Before("execution(* kr.co.p0705.HelloController.hello(..))")
	public void a() {
		// Before("excution(패키지명...클래스...메서드명)")
		// spring이 실행되면 해당 패키지의 hello라는 메서드가 실행될 때 before 실행
		System.out.println("전 : AOP");
	}
	
	@After("execution(* kr.co.p0705.HelloController.hello(..))")
	public void b() {
		System.out.println("후 : AOP");
	}
}

// 1) 포함
// 2) 상속 or 구현
// 3) 어노테이션
