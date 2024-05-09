<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%
	String checkId = request.getParameter("checkId");
	System.out.println(checkId + " -> checkId 디버깅 ");

	boolean ck = AdminDAO.selectIdCk(checkId);
	if(ck == false){ //중복 아이디 없음 -> 해당 아이디로 가입 가능 
		response.sendRedirect("/Semi_F_GDCC/admin/insertAdminForm.jsp?checkId="+checkId+"&ck=F");
	}else{ // 해당아이디로 가입 불가능 
		response.sendRedirect("/Semi_F_GDCC/admin/insertAdminForm.jsp?checkId="+checkId+"&ck=T");
	}






%>