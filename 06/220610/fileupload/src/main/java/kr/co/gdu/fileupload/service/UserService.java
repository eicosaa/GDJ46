package kr.co.gdu.fileupload.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.fileupload.mapper.UserMapper;
import kr.co.gdu.fileupload.vo.User;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public User getUserOne(User user) {
		return userMapper.selectUserOne(user);
	}
	
	public Map<String, Object> getUserListByPage(int currentPage, int rowPerPage, String searchWord) {
		
		log.debug("\u001B[31m" + "▶▶▶▶▶▶▶▶▶▶▶ [UserService.getUserListByPage] currentPage : " + currentPage + "\u001B[0m");
		log.debug("\u001B[31m" + "▶▶▶▶▶▶▶▶▶▶▶ [UserService.getUserListByPage] rowPerPage : " + rowPerPage + "\u001B[0m");
		log.debug("\u001B[31m" + "▶▶▶▶▶▶▶▶▶▶▶ [UserService.getUserListByPage] searchWord : " + searchWord + "\u001B[0m");
		
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		paramMap.put("beginRow", beginRow); // 매개변수 Map에 beginRow키 값 추가
		
		log.debug("\u001B[31m" + "▶▶▶▶▶▶▶▶▶▶▶ [UserService.getUserListByPage] paramMap : " + paramMap + "\u001B[0m");
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<User> userList = userMapper.selectUserList(paramMap);
		int totalCount = userMapper.selectTotalCount((String)(paramMap.get("searchWord")));
		int lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage != 0) {
			lastPage++;
		}
		returnMap.put("userList", userList);
		returnMap.put("lastPage", lastPage);
		
		log.debug("\u001B[31m" + "▶▶▶▶▶▶▶▶▶▶▶ [UserService.getUserListByPage] returnMap : " + returnMap + "\u001B[0m");
		
		return returnMap;
	}
}
