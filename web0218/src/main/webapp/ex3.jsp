<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%
	// 단점 : 속도가 느리고 기본타입으로만 만들 수 있다. 
	ArrayList<String> list = new ArrayList<String>(3); 
	list.add("김하늬");
	list.add("나재선");
	
	for(String s : list) {
		System.out.println(s);
	}
	
	for(int i=0; i < list.size(); i=i+1) {
		System.out.println(list.get(i));
	}
	// --> 굳이 ArrayList의 경우는 개발자가 index 번호를 접근할 필요가 없다.
	
	list.add("박범진");
	list.add("박선호"); // 예외가 발생해야 하는데...?
	
	for(String s : list) { // list.size()사용한다. <-- length와는 다르다.
		System.out.println(s);
	}
	
	list.remove(1); 
	
	for(String s : list) { // list.size()사용한다. <-- length와는 다르다.
		System.out.println(s);
	}
	
	// ArrayList<int> list2 = new ArrayList<int>(3);  -> <>안에는 참조타입만 가능하다.
	// ArrayList<Integer> list2 = new ArrayList<Integer>(3); 
	
%>