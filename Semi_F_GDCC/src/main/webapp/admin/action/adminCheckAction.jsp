<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%
	int adminNo = Integer.parseInt(request.getParameter("adminNo"));
	String adminMail = request.getParameter("adminMail");
	String adminBirth = request.getParameter("adminBirth");
	String adminContact = request.getParameter("adminContact");
	
	System.out.println(adminNo);
	System.out.println(adminMail);
	System.out.println(adminBirth);
	System.out.println(adminContact);

	boolean ck = AdminDAO.selectResetPw(adminNo, adminMail, adminBirth, adminContact);
	if(ck == true){ //읽을 행 있음  -> 해당 사원 비번 리셋해주기 
		response.sendRedirect("/Semi_F_GDCC/admin/adminResetPwForm.jsp?checkId="+adminMail+"&ck=T");
	}else{ // 읽을 행 없음 
		response.sendRedirect("/Semi_F_GDCC/admin/adminResetPwForm.jsp?checkId="+adminMail+"&ck=F");
	}






%>