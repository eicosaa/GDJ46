package kr.co.gdu.stats;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StatsController {
	@GetMapping("/stats")
	public List<Map<String, Object>> stats() {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> m1 = new HashMap<>();
		m1.put("gender", "Male");
		m1.put("count", 18);
		Map<String, Object> m2 = new HashMap<>();
		m2.put("gender", "Female");
		m2.put("count", 27);
		Map<String, Object> m3 = new HashMap<>();
		m3.put("gender", "null");
		m3.put("count", 4);
		list.add(m1);
		list.add(m2);
		list.add(m3);
		return list;
	}
}
