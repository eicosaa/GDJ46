package goodee.gdj.notice.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj.notice.vo.Notice;

@Mapper
public interface NoticeMapper {
	
	// update action
	Integer updateNotice(Notice notice);
	
	// update form + 상세보기
	Notice selectNoticeOne(int noticeNo);
	
	// insert
	int insertNotice(Notice notice);
	
	// delete
	Integer deleteNotice(Notice notice);
	
	// 전체 row
	int selectTotalCount();
	
	// select
	List<Notice> selectNoticeByPage(Map<String, Object> map);
}
