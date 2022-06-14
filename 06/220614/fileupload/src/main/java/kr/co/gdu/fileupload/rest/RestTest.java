package kr.co.gdu.fileupload.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

// 문자열을 리턴
@RestController
// @CrossOrigin
public class RestTest {
	
	@GetMapping("/test")
	public Map<String, Object> test() {
		// return "id=goodee,pw=구디";
		// return "<id>goodee</id><pw>1234</pw";
		// return "<members> <m><id>u1</id></m> <m><id>u2</id></m> </members>";
		// return "[{\"id\":\"g1\"}, {\"id\":\"g2\"}]";
		
		Map<String, Object> map = new HashMap();
		map.put("id", "goodee");
		map.put("pw", 1234);
		return map; // return 객체를 json 문자열로 변경해서 클라이언트 응답
	}
}
