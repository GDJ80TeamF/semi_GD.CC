<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	System.out.println("session.invalidate()" +  session.getId());
	session.invalidate();	// 세션 초기화(포맷)
	System.out.println("session.invalidate()" +  session.getId());
	response.sendRedirect("/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp");
	System.out.println("로그아웃 성공");
%>