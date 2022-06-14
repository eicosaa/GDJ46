package kr.co.gdu.fileupload.rest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberRestController {
	
	@PostMapping("/idCheck")
	public String idCheck(@RequestParam(value="id") String id) {
		if(id.equals("admin")) {
			return "false";
		}
		return id;
	}
}
