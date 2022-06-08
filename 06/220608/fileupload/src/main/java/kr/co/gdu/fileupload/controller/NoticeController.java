package kr.co.gdu.fileupload.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.fileupload.service.NoticeService;
import kr.co.gdu.fileupload.vo.NoticeForm;
import lombok.extern.slf4j.Slf4j;

@Slf4j // log 객체 변수 주입
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	// 입력 폼
	@GetMapping("/addNotice")
	public String addNotice() {
		return "addNotice";
	}
	
	// 입력 액션
	@PostMapping("/addNotice")
	public String addNotice(HttpServletRequest request, NoticeForm noticeForm) {
		String path = request.getServletContext().getRealPath("/upload/");
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ [NoticeController.addNotice] path : " + path);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ [NoticeController.addNotice] noticeForm : " + noticeForm);
		List<MultipartFile> noticefileList = noticeForm.getNoticefileList();
		
		if(noticefileList.get(0).getSize() > 0) { // 하나 이상의 파일이 업로드 되면
			for(MultipartFile mf : noticefileList) {
				log.debug("▶▶▶▶▶▶▶▶▶▶▶ [NoticeController.addNotice] OriginalFilename : " + mf.getOriginalFilename());
			}
		}
		
		noticeService.addNotice(noticeForm, path);
		return "redirect:/addNotice";
	}
}
