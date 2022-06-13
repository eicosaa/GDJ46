package kr.co.gdu.fileupload.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.fileupload.mapper.NoticeMapper;
import kr.co.gdu.fileupload.mapper.NoticefileMapper;
import kr.co.gdu.fileupload.vo.Notice;
import kr.co.gdu.fileupload.vo.NoticeForm;
import kr.co.gdu.fileupload.vo.Noticefile;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private NoticefileMapper noticefileMapper;
	
	// 상세보기 Notice + Noticefile
	public Map<String, Object> noticeOne(int noticeId) {
		
		Notice notice = noticeMapper.selectNoticeOne(noticeId);
		List<Noticefile> fileList = noticefileMapper.selectNoticefileList(noticeId);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("notice", notice);
		returnMap.put("fileList", fileList);		
		
		return returnMap;
	}
	
	// 리스트
	public Map<String, Object> noticeList(int currentPage, int rowPerPage) {
		
		// 1) controller에서 넘어온 매개변수 값을 가공 후 mapper 호출
		int beginRow = (currentPage -1) * rowPerPage;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("rowPerPage", rowPerPage);
		map.put("beginRow", beginRow);
		
		List<Notice> list = noticeMapper.selectNoticeListByPage(map);
		
		// 2) mapper에서 반환된 값을 가공 controller에 반환
		int totalCount = noticeMapper.countNotice();
		int lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage));
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
	
	// 삭제 (notice 글 삭제)
	public void removeNotice(int noticeId, String path) {
		// 1) 저장 장치의 파일을 삭제 -> 파일 이름
		List<String> noticefileList = noticefileMapper.selectNoticefileNameList(noticeId);
		for(String filename : noticefileList) {
			File f = new File(path + filename);
			if(f.exists()) {
				f.delete();
			}
		}
		// 2) db행 삭제
		noticefileMapper.deletenoticefileList(noticeId);
		noticeMapper.deleteNotice(noticeId);
	}
	
	// 삭제 (noticefile 하나 삭제)
	public void removeNoticefile(int noticeId, int noticefileId, String noticefileName, String path) {
		
		File f = new File(path + noticefileName);
		if(f.exists()) {
			f.delete();
		}
		
		noticefileMapper.deletenoticeOne(noticefileId);
	}
	
	// 입력
	public void addNotice(NoticeForm noticeForm, String path) {
		log.debug("▶▶▶▶▶▶▶▶▶▶ [NoticeService.addNotice.param] path : ", path);
		log.debug("▶▶▶▶▶▶▶▶▶▶ [NoticeService.addNotice.param] noticeForm : ", noticeForm);
		
		// NoticeMapper
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		// notice.getNoticeId() --> 0
		int row = noticeMapper.insertNotice(notice);
		log.debug("▶▶▶▶▶▶▶▶▶▶ [NoticeService.addNotice] notice.getNoticeId() : ", notice.getNoticeId()); // insert시 입력된 auto-increment 값이 출력됨
		
		// NoticefileList가 하나 이상이고 row == 1일 때 (-파일이 추가된 상황)
		// NoticefileMapper
		if(noticeForm.getNoticefileList() != null && noticeForm.getNoticefileList().get(0).getSize() > 0 && row == 1) { // -첫번째 파일의 크기가 0보다 클 때 
			log.debug("▶▶▶▶▶▶▶▶▶▶ [NoticeService.addNotice] 첨부된 파일이 있습니다.");
			for(MultipartFile mf : noticeForm.getNoticefileList()) {
				// mf -> Noticefile
				Noticefile noticefile = new Noticefile();
				
				String originName = mf.getOriginalFilename();
				// originName에서 마지막 .문자열 위치 abc.txt
				String ext = originName.substring(originName.lastIndexOf("."));
				
				// 파일을 저장할 때 사용할 중복되지 않는 새로운 이름 필요(UUID API사용)
				String filename = UUID.randomUUID().toString();
				// filename = filename.replace("-", "");
				filename = filename + ext;
				
				noticefile.setNoticeId(notice.getNoticeId());
				noticefile.setNoticefileName(filename);
				noticefile.setNoticefileType(mf.getContentType());
				noticefile.setNoticefileSize(mf.getSize());
				log.debug("▶▶▶▶▶▶▶▶▶▶ [NoticeService.addNotice] noticefile : " + noticefile);
				noticefileMapper.insertNoticefile(noticefile);
				
				try {
					mf.transferTo(new File(path + filename)); // mutipart 안의 파일을 저장장치로 저장
				} catch (Exception e) {
					e.printStackTrace();
					// 새로운 예외 발생시켜야지만 @Transactional 작동을 위해
					throw new RuntimeException(); // RuntimeException은 예외처리를 하지 않아도 컴파일된다
				}
			}
		}
	}
}
