package kr.co.gdu.fileupload.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.co.gdu.fileupload.vo.User;

@Mapper
public interface UserMapper {
	
	// 로그인
	User selectUserOne(User user);
	
	int selectTotalCount(String searchWord);
	
	List<User> selectUserList(Map<String, Object> map);
}
