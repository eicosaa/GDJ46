package goodee.gdj.web1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj.web1.mapper.MemberMapper;
import goodee.gdj.web1.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	MemberMapper memberMapper;
	
	@GetMapping("/addMember")
	public String addMember() {
		return "addMember";
	}
	
	@PostMapping("/addMember")
	public String addMember(Member member) {
		System.out.println(member);
		// DAO 호출
		memberMapper.insertMember(member);
		return "redirect:/login";
	}
}
