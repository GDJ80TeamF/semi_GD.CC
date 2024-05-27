<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import = "java.sql.*"%>
<%@page import="java.net.*"%>
<%@ page import="gdcc.dao.*" %>
<%
	String cusMail = request.getParameter("cusMail");
	String cusPw = request.getParameter("cusPw");
	
	// 디버깅
	System.out.println("cusMail: " + cusMail);
	System.out.println("cusPw: " + cusPw);
	
	HashMap<String, String> loginCustomer = CustomerDAO.selectCusLogin(cusMail, cusPw); 
	// 작성한 아이디, 비밀번호
	System.out.println("loginCustomer: " + loginCustomer);
	if(loginCustomer != null){
		System.out.println("로그인 성공");
		session.setAttribute("loginCustomer", loginCustomer);  
		response.sendRedirect("/Semi_F_GDCC/welcome.jsp");
	}else{
		System.out.println("로그인 실패");
		String errMsg = URLEncoder.encode("아이디 비밀번호 확인해주세요." ,"utf-8");
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp?errMsg=" + errMsg);
	}
%>