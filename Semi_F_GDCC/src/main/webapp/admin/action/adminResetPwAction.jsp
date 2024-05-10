<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%

	
	String adminMail = request.getParameter("checkedId");
	String newPw = request.getParameter("newPw");
	
	System.out.println(adminMail);
	System.out.println(newPw);
	
	int row = AdminDAO.updateResetPw(adminMail, newPw);
	if(row != 0){
		System.out.println("비번 리셋 성공 ");
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
	}else{
		System.out.println("비번 리셋 실패 ");
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
	}
	



%>