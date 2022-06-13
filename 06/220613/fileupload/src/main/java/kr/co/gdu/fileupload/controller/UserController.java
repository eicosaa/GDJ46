package kr.co.gdu.fileupload.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.fileupload.service.UserService;
import kr.co.gdu.fileupload.vo.User;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	// 로그아웃 폼
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
	
	// 로그인 폼
	@GetMapping("/login")
	public String login(HttpSession session) {
		
		// 로그인 성공
		if(session.getAttribute("loginUser") != null) {
			return "redirect:/userList";
		}
		
		return "login";
	}
	
	// 로그인 액션
	@PostMapping("/login")
	public String login(HttpSession session, User user) {
		User loginUser = userService.getUserOne(user);
		
		// 로그인 실패
		if(loginUser == null) {
			log.debug("\u001B[31m" + "▶▶▶▶▶▶▶▶▶▶▶ [UserController.login] loginUser : " + loginUser + " / 로그인 실패" + "\u001B[0m");
			return "redirect:/login";
		}
		
		// 로그인 성공
		session.setAttribute("loginUser", loginUser);
		
		return "redirect:/userList";
	}

	// userList 폼
	@GetMapping("/userList")
	public String userList(HttpSession session
							, Model model
							, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage
							, @RequestParam(value = "searchWord", required = false) String searchWord) { // -required = false -> null이 가능할 수 있다
		
		// 로그인 실패
		if(session.getAttribute("loginUser") == null) {
			log.debug("\u001B[31m" + "▶▶▶▶▶▶▶▶▶▶▶ [UserController.userList] login : " + " 로그인 상태가 아닙니다." + "\u001B[0m");
			return "redirect:/login";
		}
		
		Map<String, Object> map = userService.getUserListByPage(currentPage, rowPerPage, searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("userList", map.get("userList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		
		log.debug("\u001B[31m" + "▶▶▶▶▶▶▶▶▶▶▶ [UserController.userList] map : " + map + "\u001B[0m");
		
		return "userList";
	}
}
