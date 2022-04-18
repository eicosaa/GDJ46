package model;

import java.util.ArrayList;
import java.util.List;

public class LoginService {
	public List<String> getLoginResult(String id, String pw, String[] hobby, String[] interest) {
		List<String> list = new ArrayList<String>();
		
		String result = "";
		if(id.equals("guest") && pw.equals("1234")) {
			// 디버깅
			System.out.println("로그인 성공");
			result = "success! Hello.";
		} else {
			// 디버깅
			System.out.println("로그인 실패");
			result = "fail! Bye.";
		}
		
		String hobbyResult = "";
		for(String h : hobby) {
			// hobbyResult = hobbyResult + h + " ";
			hobbyResult += h + " ";
		}
		String interestResult = "";
		for(String i : interest) {
			interestResult += i + " ";
		}
		list.add(result);
		list.add(hobbyResult);
		list.add(interestResult);
		
		return list;
	}
}
