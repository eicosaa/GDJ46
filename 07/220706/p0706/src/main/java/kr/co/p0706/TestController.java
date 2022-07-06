package kr.co.p0706;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	@GetMapping("/test")
	public String test(Model model) {
		
		model.addAttribute("name", "드콴");
		model.addAttribute("age", 10);
		Vo vo = new Vo(); vo.setX(7); vo.setY(17);
		
		model.addAttribute("vo", vo);
		
		List<String> list = new ArrayList<>();
		list.add("잔망루피"); 
		list.add("잔망조로"); 
		list.add("호랑나미"); 
		list.add("우솝우화"); 
		list.add("군침이싹도노"); 
		
		model.addAttribute("list", list);
		
		return "test"; // resources/templates/test.html(thymeleaf파일)
	}
}


class Vo {
	
	public int x;
	public int y;
	
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	
}