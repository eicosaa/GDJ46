<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.Student" %>
<%
	Student[] students = new Student[7];
	// student[0]
	Student s1 = new Student();
	s1.no = 1;
	s1.name = "강민창";
	s1.gender = "남";
	students[0] = s1;
	
	// student[1]
	Student s2 = new Student();
	s2.no = 2;
	s2.name = "강한빛";
	s2.gender = "남";
	students[1] = s2;
	
	// student[2]
	Student s3 = new Student();
	s3.no = 3;
	s3.name = "구혜민";
	s3.gender = "여";
	students[2] = s3;
	
	// student[3]
	Student s4 = new Student();
	s4.no = 4;
	s4.name = "김득환";
	s4.gender = "남";
	students[3] = s4;
	
	// student[4]
	Student s5 = new Student();
	s5.no = 5;
	s5.name = "김민서";
	s5.gender = "여";
	students[4] = s5;
	
	// student[5]
	Student s6 = new Student();
	s6.no = 6;
	s6.name = "김예담";
	s6.gender = "여";
	students[5] = s6;
	
	// student[6]
	Student s7 = new Student();
	s7.no = 7;
	s7.name = "김유진";
	s7.gender = "여";
	students[6] = s7;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentList</title>
<style>
	talbe, th, td {
		border: 1px solid #8041D9;
	}
</style>
</head>
<body>
	<h1>학생 목록(<%= students.length %>명)</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Student s : students) {
			%>
				<tr>
					<td><%= s.no %></td>
					<td><%= s.name %></td>
					<td>
						<%
							String imgFile = "female.png";
							if(s.gender.equals("남")) {
								imgFile = "male.png";
							}
						%>
						<img src="./img/<%=imgFile%>" width="100" height="100">
					</td>
				</tr>
			<%		
					
				}
			%>
		</tbody>
	</table>
</body>
</html>