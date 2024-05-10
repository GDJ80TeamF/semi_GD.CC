<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%
	
	//param ->state, mail 
	String adminMail = request.getParameter("adminMail");
	String adminState = request.getParameter("active");
	
	System.out.println(adminMail);
	System.out.println(adminState);
	
	if(adminState.equals("OFF")){
		adminState = "ON";
	}else{
		adminState = "OFF";
	}
	
	int row = AdminDAO.updateState(adminMail, adminState);
	if(row != 0){
		System.out.println("adminState 업데이트 완료 ");
		response.sendRedirect("/Semi_F_GDCC/admin/adminList.jsp");
	}else{
		System.out.println("adminState 업데이트 실패 ");
		response.sendRedirect("/Semi_F_GDCC/admin/adminList.jsp");
	}

	

%>
