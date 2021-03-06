package kr.co.gdu.fileupload.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.fileupload.vo.Notice;

@Mapper
public interface NoticeMapper {
	
	// index 화면의 최근 5개 공지사항을 보여주는 메소드
	// List<Notice> selectLatestNoticeList();
	   
	// 공지사항 목록 페이지에서 목록 페이징
	List<Notice> selectNoticeListByPage(Map<String, Integer> map);
	   
	// 공지사항 페이지 카운트
	int countNotice();
	   
	// 공지사항 내용
	List<Notice> selectNoticeOne(int noticeId);
	   
	// 공지사항 입력
	int insertNotice(Notice notice);
	   
	// 공지사항 수정
	int updateNotice(Notice notice);
	   
	// 공지사항 삭제
	int deleteNotice(int noticeId);
}
