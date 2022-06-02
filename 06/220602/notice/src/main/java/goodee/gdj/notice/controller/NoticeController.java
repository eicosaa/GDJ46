package goodee.gdj.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj.notice.service.NoticeService;
import goodee.gdj.notice.vo.Notice;
import lombok.extern.slf4j.Slf4j;

// -controller는 서비스를 호출만 하는 역할

@Slf4j // log 객체를 사용하도록
@Controller("/admin") // servlet 역할을 하도록
public class NoticeController {
	
	// 요청 -> Controller -> Service -> Mapper
	// 응답 <- Controller <- Service <- Mapper
	
	@Autowired
	NoticeService noticeService;
	
	// 수정 액션
	@PostMapping("/modifyNotice")
	public String modifyNotice(Notice notice) {
		log.debug("[NoticeController.post.modifyNotice.param] notice : ", notice);
		int row = noticeService.modifyNotice(notice);
		log.debug("[NoticeController.post.modifyNotice.row] row : ", row);
		return "redirect:/getNoticeOne?noticeNo=" + notice.getNoticeNo(); // 상세보기 컨트롤러 redirect
	}
	
	// 수정 폼
	@GetMapping("/modifyNotice")
	public String modifyNotice(Model model
								, @RequestParam(name = "noticeNo") int noticeNo) {
		log.debug("[NoticeController.get.modifyNotice.param] noticeNo : ", noticeNo);
		Notice notice = noticeService.getNoticeOne(noticeNo);
		model.addAttribute("notice", notice); // request.setAttribute("notice", notice) 기능
		return "modifyNotice";
	}
	
	// 상세보기
	@GetMapping("/getNoticeOne")
	public String getNoticeOne(Model model
								, @RequestParam(name = "noticeNo") int noticeNo) {
		log.debug("[NoticeController.get.getNoticeOne.param] noticeNo : ", noticeNo);
		Notice notice = noticeService.getNoticeOne(noticeNo);
		model.addAttribute("notice", notice); // request.setAttribute("notice", notice) 기능
		return "getNoticeOne";
	}
	
	// 삭제 폼
	@GetMapping("/deleteNotice")
	public String deleteNotice(Model model
								, @RequestParam(name = "noticeNo") int noticeNo) {
		log.debug("[NoticeController.get.deleteNotice.param] noticeNo : ", noticeNo);
		model.addAttribute("noticeNo", noticeNo);		
		return "deleteNotice";
	}
	
	// 삭제 액션
	@PostMapping("/deleteNotice")
	public String deleteNotice(Notice notice) {
		log.debug("[NoticeController.post.deleteNotice.param] noticeNo : ", notice.getNoticeNo());
		int row = noticeService.deleteNotice(notice);
		log.debug("[NoticeController.post.deleteNotice.row] row : ", row);
		return "redirect:/getNoticeByPage";
	}
	
	// 입력 폼
	@GetMapping("/addNotice")
	public String addNotice() {
		return "addNotice"; // forward -> /WEB-INF/view/addNotice.jsp
	}
	
	// 입력 액션
	@PostMapping("/addNotice")
	public String addNotice(Notice notice) {
		log.debug("[NoticeController.post.addNotice.param] notice : ", notice);
		// log.debug("[KMS] NoticeController.addNotice.param : ", notice.toString());
		Integer row = noticeService.addNotice(notice);
		log.debug("[NoticeController.post.addNotice.row] row : ", row);
		// log.debug("NoticeController.addNotice.row : ", row);
		return "redirect:/getNoticeByPage";
		
		/*
		if(addNotice().startsWith("redirect:")) {
			// redirect ...
		} else {
			// forward
		}
		*/
	}
	
	@GetMapping("/getNoticeByPage")
	public String getNoticeByPage(Model model,
									@RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
									@RequestParam(name = "rowPerPage", defaultValue = "10") int rowPerPage) {
									// 디폴트 값 설정, 자동 형 변환, ...
		
		
		// 뷰를 호출 시 모델 레이어로부터 반환된 값(모델)을 뷰로 보낸다.
		Map<String, Object> map = noticeService.getNoticeByPage(currentPage, rowPerPage);
		// log 디버깅
		model.addAttribute("list", map.get("list")); // request.setAttribute() 기능
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		
		// System.out.println("[NoticeController.getNoticeByPage()] list.size() : " + list.size());
		// log.debug("[NoticeController.getNoticeByPage()] list.size() : " + list.size());
		
		return "getNoticeByPage"; // forward 기능
	}
}
