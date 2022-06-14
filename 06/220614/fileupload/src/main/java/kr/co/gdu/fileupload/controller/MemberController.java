package kr.co.gdu.fileupload.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	@GetMapping("/addMember")
	public String addMember() {
		return "addMember";
	}
}
