package goodee.gdj.web2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	@GetMapping("/test")
	public String test() {
		User u = new User();
		u.setId("test");
		u.setPw("1234");
		System.out.println(u);
		return "";
	}
}
