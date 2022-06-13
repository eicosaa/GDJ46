package kr.co.gdu.fileupload.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.fileupload.service.NoticeService;
import kr.co.gdu.fileupload.vo.Notice;
import kr.co.gdu.fileupload.vo.NoticeForm;
import lombok.extern.slf4j.Slf4j;

@Slf4j // log 객체 변수 주입
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	// 홈화면 (공지 리스트)
	@GetMapping("/noticeList")
	public String noticeList(Model model,
								@RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
								@RequestParam(name = "rowPerPage", defaultValue = "10") int rowPerPage) {
		
		Map<String, Object> map = noticeService.noticeList(currentPage, rowPerPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ [NoticeController.noticeList] map : " + map);
		model.addAttribute("list", map.get("list")); // request.setAttribute() 기능
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		
		return "noticeList";
	}
	
	// 상세보기 Notice + Noticefile
	@GetMapping("/noticeOne")
	public String noticeOne(Model model 
							, @RequestParam(name = "noticeId") int noticeId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ [NoticeController.noticeOne] noticeId : " + noticeId);
		
		Map<String, Object> map = noticeService.noticeOne(noticeId);
		model.addAttribute("notice", map.get("notice"));
		model.addAttribute("fileList", map.get("fileList"));
		
		return "noticeOne";
	}
	
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
		
		if(noticefileList != null && noticefileList.get(0).getSize() > 0) { // 하나 이상의 파일이 업로드 되면
			for(MultipartFile mf : noticefileList) {
				log.debug("▶▶▶▶▶▶▶▶▶▶▶ [NoticeController.addNotice] OriginalFilename : " + mf.getOriginalFilename());
			}
		}
		
		noticeService.addNotice(noticeForm, path);
		return "redirect:/noticeList";
	}
	
	// 삭제 액션 noticefile 하나 삭제
	@GetMapping("/deleteNoticefile")
	public String deleteNoticefile(HttpServletRequest request
									, @RequestParam(name = "noticeId") int noticeId
									, @RequestParam(name = "noticefileId") int noticefileId
									, @RequestParam(name = "noticefileName") String noticefileName) {
		String path = request.getServletContext().getRealPath("/upload/");
		noticeService.removeNoticefile(noticeId, noticefileId, noticefileName, path);
		log.debug("\u001B[31m" + "▶▶▶▶▶▶▶▶▶▶▶ [NoticeController.removeNotice] noticefileId : " + noticefileId + "\u001B[0m");
		return "redirect:/noticeOne?noticeId=" + noticeId;
	}
	
	// 삭제 액션 notice 게시글 삭제
	@GetMapping("/removeNotice")
	public String removeNotice(HttpServletRequest request
								, @RequestParam(name = "noticeId") int noticeId) {
		String path = request.getServletContext().getRealPath("/upload/");
		log.debug("\u001B[31m" + "▶▶▶▶▶▶▶▶▶▶▶ [NoticeController.removeNotice] path : " + path);
		log.debug("\u001B[31m" + "▶▶▶▶▶▶▶▶▶▶▶ [NoticeController.removeNotice] noticeId : " + noticeId);
		noticeService.removeNotice(noticeId, path);
		return "redirect:/noticeList";
	}
	
}
