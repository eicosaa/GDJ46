package goodee.gdj.web1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HelloController {
	@GetMapping("/greet")
	public String greet(@RequestParam("no") int no) {
		System.out.println("hello" + no);
		return "redirect:/greet2";
	}
	
	@GetMapping("/greet2")
	public String greet2() {
		System.out.println("hello2");
		return "greet2";
	}
}
