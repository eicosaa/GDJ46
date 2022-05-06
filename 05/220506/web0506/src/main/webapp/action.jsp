<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   
   if(request.getParameter("id")==null || request.getParameter("pw") == null ||
         request.getParameter("gender") == null || request.getParameterValues("interest")==null ||
         request.getParameter("birth") == null || request.getParameter("age") == null || 
         request.getParameter("emailId") ==null ||
         request.getParameter("emailUrl") == null) {
      response.sendRedirect(request.getContextPath()+"/form.jsp");
      return;
   } 
   
   String id = request.getParameter("id");
   System.out.println(id + " <-- id");
   String pw = request.getParameter("pw");
   System.out.println(pw + " <-- pw");
   String gender = request.getParameter("gender");
   System.out.println(gender + " <-- gender");
   
   String[] interest = request.getParameterValues("interest");
   if(interest != null) {
      for(String inter : interest) {
         System.out.println(inter + " <-- interest");
      }
   }
   
   String birth = request.getParameter("birth");
   int age = Integer.parseInt(request.getParameter("age"));
   System.out.println(age + " <-- age");
   
   String email = request.getParameter("emailId") + request.getParameter("emailUrl");
   System.out.println(email + " <-- email");
   
   String memo = request.getParameter("memo");
   System.out.println(memo + " <-- memo");
%>