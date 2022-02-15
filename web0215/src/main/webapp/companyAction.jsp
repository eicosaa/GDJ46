<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.Company" %>
<%
	// 인코딩 설정
	request.setCharacterEncoding("utf-8");

	//1. 요청(request) 처리 (Controller Layer)
	int no = Integer.parseInt(request.getParameter("no"));
	System.out.println(no + " <-- no"); // 디버깅 코드
	
	String agreement = request.getParameter("agreement");
	System.out.println(agreement + " <-- agreement");
	
	boolean document = Boolean.parseBoolean(request.getParameter("document"));
	System.out.println(document + " <-- document");
	
	String studentName = request.getParameter("studentName");
	System.out.println(studentName + " <-- studentName");
	
	String name = request.getParameter("name");
	System.out.println(name + " <-- name");
	
	String skill = request.getParameter("skill");
	System.out.println(skill + " <-- skill");
	
	String job = request.getParameter("job");
	System.out.println(job + " <-- job");
	
	String person = request.getParameter("person");
	System.out.println(person + " <-- person");
	
	String phone = request.getParameter("phone");
	System.out.println(phone + " <-- phone");
	
	String mail = request.getParameter("mail");
	System.out.println(mail + " <-- mail");
	
	String location = request.getParameter("location");
	System.out.println(location + " <-- location");
	
	boolean internship = Boolean.parseBoolean(request.getParameter("document"));
	System.out.println(internship + " <-- internship");
	
	int salary = Integer.parseInt(request.getParameter("salary"));
	System.out.println(salary + " <-- salary");
	
	boolean tomorrow = Boolean.parseBoolean(request.getParameter("tomorrow"));
	System.out.println(tomorrow + " <-- tomorrow");
	
	String homepage = request.getParameter("homepage");
	System.out.println(homepage + " <-- homepage");
	
	long sales = Long.parseLong(request.getParameter("sales"));
	System.out.println(sales + " <-- sales");
	
	int since = Integer.parseInt(request.getParameter("since"));
	System.out.println(since + " <-- since");
	
	int employees = Integer.parseInt(request.getParameter("employees"));
	System.out.println(employees + " <-- employees");
	
	String corporation = request.getParameter("corporation");
	System.out.println(corporation + " <-- corporation");
	
	boolean young = Boolean.parseBoolean(request.getParameter("young"));
	System.out.println(young + " <-- young");
	
	boolean smallGiant = Boolean.parseBoolean(request.getParameter("smallGiant"));
	System.out.println(smallGiant + " <-- smallGiant");
	
	boolean excellence = Boolean.parseBoolean(request.getParameter("excellence"));
	System.out.println(excellence + " <-- excellence");
	
	boolean mainbiz = Boolean.parseBoolean(request.getParameter("mainbiz"));
	System.out.println(mainbiz + " <-- mainbiz");
	
	boolean innobiz = Boolean.parseBoolean(request.getParameter("innobiz"));
	System.out.println(innobiz + " <-- innobiz");
	
	boolean venture = Boolean.parseBoolean(request.getParameter("venture"));
	System.out.println(venture + " <-- venture");
	
	//2. 요청처리에 대한 결과를 데이터화 -> 모델값 (Model Layer)
	Company company = new Company();
	company.no = no;
	company.agreement = agreement;
	company.document = document;
	company.name = name;
	company.skill = skill;
	company.job = job;
	company.person = person;
	company.phone = phone;
	company.mail = mail;
	company.location = location;
	company.internship = internship;
	company.salary = salary;
	company.tomorrow = tomorrow;
	company.homepage = homepage;
	company.sales = sales;
	company.since = since;
	company.employees = employees;
	company.corporation = corporation;
	company.young = young;
	company.smallGiant = smallGiant;
	company.excellence = excellence;
	company.mainbiz = mainbiz;
	company.innobiz = innobiz;
	company.venture = venture;
	
	// 3. 출력 (View Layer)
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>companyAction 데이터 출력</title>
	<style type = "text/css">
		table {border : 1px solid #3DB7CC;}
		td {border : 1px solid #3DB7CC;}
	</style>
</head>
<body>
	<h1>정보</h1>
		<table>
			<tr>
				<td>연번</td>
				<td><%= company.no %></td>
			</tr>
			<tr>
				<td>협약</td>
				<td><%= company.agreement %></td>
			</tr>
			<tr>
				<td>협약서</td>
				<td><%= company.document %></td>
			</tr>
			<tr>
				<td>회사명</td>
				<td><%= company.name %></td>
			</tr>
			<tr>
				<td>필요 기술</td>
				<td><%= company.skill %></td>
			</tr>
			<tr>
				<td>분야 / 직무 / 기타</td>
				<td><%= company.job %></td>
			</tr>
			<tr>
				<td>담당자</td>
				<td><%= company.person %></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%= company.phone %></td>
			</tr>
			<tr>
				<td>메일</td>
				<td><%= company.mail %></td>
			</tr>
			<tr>
				<td>위치</td>
				<td><%= company.location %></td>
			</tr>
			<tr>
				<td>현장 실습</td>
				<td><%= company.internship %></td>
			</tr>
			<tr>
				<td>연봉(대졸)</td>
				<td><%= company.salary %></td>
			</tr>
			<tr>
				<td>청년내일채움공제</td>
				<td><%= company.tomorrow %></td>
			</tr>
			<tr>
				<td>홈페이지</td>
				<td><%= company.homepage %></td>
			</tr>
			<tr>
				<td>매출액</td>
				<td><%= company.sales %></td>
			</tr>
			<tr>
				<td>업력</td>
				<td><%= company.since %></td>
			</tr>
			<tr>
				<td>사원수</td>
				<td><%= company.employees %></td>
			</tr>
			<tr>
				<td>상장기업</td>
				<td><%= company.corporation %></td>
			</tr>
			<tr>
				<td>청년친화</td>
				<td><%= company.young %></td>
			</tr>
			<tr>
				<td>강소기업</td>
				<td><%= company.smallGiant %></td>
			</tr>
			<tr>
				<td>우수기업</td>
				<td><%= company.excellence %></td>
			</tr>
			<tr>
				<td>메인비즈</td>
				<td><%= company.mainbiz %></td>
			</tr>
			<tr>
				<td>이노비즈</td>
				<td><%= company.innobiz %></td>
			</tr>
			<tr>
				<td>벤처인증</td>
				<td><%= company.venture %></td>
			</tr>
		</table>
</body>
</html>