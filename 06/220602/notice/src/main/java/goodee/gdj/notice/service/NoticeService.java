package goodee.gdj.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj.notice.mapper.NoticeMapper;
import goodee.gdj.notice.vo.Notice;

@Service
@Transactional
public class NoticeService {
	
	// 요청 -> Controller -> Service -> Mapper
	// 응답 <- Controller <- Service <- Mapper 
	
	@Autowired // 스프링에 의해 객체 주입되도록
	NoticeMapper noticeMapper;
	
	// update action
	public int modifyNotice(Notice notice) { // 수정 프로세스에서 Service는 중계 역할만 한다.
		return noticeMapper.updateNotice(notice);
	}
	
	// update form + 상세보기
	public Notice getNoticeOne(int noticeNo) {
		return noticeMapper.selectNoticeOne(noticeNo);
	}
	
	// 입력
	public int addNotice(Notice notice) { // 입력 프로세스에서 Service는 중계 역할만 한다.
		return noticeMapper.insertNotice(notice);
	}
	
	// 삭제
	public int deleteNotice(Notice notice) {
		return noticeMapper.deleteNotice(notice);
	}
	
	public Map<String, Object> getNoticeByPage(int currentPage, int rowPerPage) {
		
		// 1) controller에서 넘어온 매개변수 값을 가공 후 mapper 호출
		
		int startRow = (currentPage -1) * rowPerPage;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rowPerPage", rowPerPage);
		map.put("startRow", startRow);
		
		List<Notice> list = noticeMapper.selectNoticeByPage(map);
		
		// 2) mapper에서 반환된 값을 가공 controller에 반환
		// 다수의 mapper를 호출할 수도 있다.
		// R : select 다수 -> map으로 묶어서 반환
		// CUD 다수 -> Transactional
		
		int totalCount = noticeMapper.selectTotalCount();
		int lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage));
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		
		return returnMap; // -list를 반환해도 되고 noticeMapper.selectNoticeByPage(map) 반환해도 된다
	}
}
