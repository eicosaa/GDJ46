package kr.co.gdu.fileupload.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.gdu.fileupload.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MemberScheduler {

	@Autowired
	UserService userService;
	
	// 59초 59분 23시 1일 매월 매주(요일)
	@Scheduled(cron="59 59 23 1 * *")
	public void modifyDormantUser() {
		// service에서 휴먼계정 수정 메서드 호출
		int row = userService.modifyUserActivity();
		log.debug("\u001B[31m" + "▶▶▶▶▶▶▶▶▶▶▶ [MemberScheduler.modifyDormantUser] row : " + row + " 명을 휴먼처리하였습니다." + "\u001B[0m");
	}
}
