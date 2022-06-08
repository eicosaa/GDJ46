package kr.co.gdu.fileupload.service;

import java.io.File;
import java.io.IOException;
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
	
	public void addNotice(NoticeForm noticeForm, String path) {
		log.debug("[NoticeService.addNotice.param] path : ", path);
		log.debug("[NoticeService.addNotice.param] noticeForm : ", noticeForm);
		
		// NoticeMapper
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		// notice.getNoticeId() --> 0
		int row = noticeMapper.insertNotice(notice);
		log.debug("▶▶▶▶▶▶▶▶▶▶ [NoticeService.addNotice] notice.getNoticeId() : ", notice.getNoticeId()); // insert시 입력된 auto-increment 값이 출력됨
		
		// NoticefileList가 하나 이상이고 row == 1일 때 (-파일이 추가된 상황)
		// NoticefileMapper
		if(noticeForm.getNoticefileList().get(0).getSize() > 0 && row == 1) { // -첫번째 파일의 크기가 0보다 클 때 
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
