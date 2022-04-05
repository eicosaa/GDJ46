import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class A {
	// 메서드 단위 테스트
	public static void main(String[] args) {
		A a = new A();
		Map<String, Object> map = a.m4();
		// map 안에 리스트 + 사이즈
		List<Map<String, Object>> list = (List<Map<String, Object>>)(map.get("list"));
		Integer listSize = (Integer)(map.get("listSize")); // -(Integer)map.get("listSize"); 가능
		
		for(Map m : list) {
			System.out.println((String)m.get("name"));
			System.out.println((B)m.get("b"));
		}
		
		System.out.println("listSize : " + listSize);
	}
	
	public Map<String, Object> m4() {
		String s1 = "루피";
		B b1 = new B();
		Map<String, Object> m1 = new HashMap<>();
		m1.put("name", s1);
		m1.put("b", b1);
		
		String s2 = "조로";
		B b2 = new B();
		Map<String, Object> m2 = new HashMap<>();
		m2.put("name", s2);
		m2.put("b", b2);
		// 두개 이상의 맵을 반환 -> 하나의 리스트로 묶음
		
		List<Map<String, Object>> list = new ArrayList<>();
		list.add(m1);
		list.add(m2);
		
		// int listSize = list.size();
		// 8개의 기본타입과 매칭되는 8개의 랩퍼타입
		Integer listSize = list.size(); // 오토박싱 : 우측의 int값이 자동으로 Integer타입으로 변경되어 대입 
		// -list.size(); -> new Integer(list.size());
		// int x = new Integer(7); // 오토언박싱
		
		// 리스트와 int값을 반환
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("list", list);
		returnMap.put("listSize", listSize);
		
		return returnMap;
	}
	
	public List<Map<String, Object>> m3() {
		String s1 = "루피";
		B b1 = new B();
		Map<String, Object> m1 = new HashMap<>();
		m1.put("name", s1);
		m1.put("b", b1);
		
		String s2 = "조로";
		B b2 = new B();
		Map<String, Object> m2 = new HashMap<>();
		m2.put("name", s2);
		m2.put("b", b2);
		// 두개 이상의 맵을 반환
		
		List<Map<String, Object>> list = new ArrayList<>();
		list.add(m1);
		list.add(m2);
		return list;
	}
	
	public Map<String, Object> m2() {
		String s1 = "자바 수업";
		B b = new B();
		// 2개를 반환 하나는 문자열, 하나는 B타입
		Map<String, Object> map = new HashMap<>();
		map.put("s1", map); // map.get()호출 시 형변환 필요
		map.put("", b); // map.get()호출 시 형변환 필요
		return map;
	}
	
	public List<String> m1() {
		String s1 = "자바 수업";
		String s2 = "GDJ46";
		// 2개의 문자열을 반환하고 싶다
		// 배열 or 리스트
		List<String> list = new ArrayList<>();
		list.add(s1);
		list.add(s2);
		return list;
	}
}
class B {
	
}