package kr.co.gdu.fileupload.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.fileupload.vo.Noticefile;

@Mapper
public interface NoticefileMapper {
	
	// 파일 리스트
	List<Noticefile> selectNoticefileList(int noticeId);
	
	int insertNoticefile(Noticefile noticefile);
	
	// 여러 개 삭제
	int deletenoticefileList(int noticeId);
	
	// 하나 삭제
	int deletenoticeOne(int noticefileId);
	
	List<String> selectNoticefileNameList(int noticeId);
	
}
