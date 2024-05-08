<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%@page import="gdcc.dao.CustomerDAO"%>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") != null){
		response.sendRedirect("/Semi_F_GDCC/customer/mainBoard.jsp");
		return;
	}
%>
<%
	String cusMail = request.getParameter("cusMail");
	String cusName = request.getParameter("cusName");
	String cusPw = request.getParameter("cusPw");
	String cusGender = request.getParameter("cusGender");
	String cusBirth = request.getParameter("cusBirth");
	String cusContact = request.getParameter("cusContact");
	Part part  = request.getPart("cusProfile");
	String originalName = part.getSubmittedFileName();
	
	System.out.println("cusMail: " + cusMail);
	System.out.println("cusName: " + cusName);
	System.out.println("cusPw: " + cusPw);
	System.out.println("cusGender: " + cusGender);
	System.out.println("cusBirth: " + cusBirth);
	System.out.println("cusContact: " + cusContact);
	System.out.println("cusProfile: " + part);
	
	// 원본이름에서 확장자만 분리

	
	String cusFilename = null;
	
	if(originalName.length() == 0){
		cusFilename = "default.png";
	}else{
		
		//원본 이름에서 확장자만 분리
	    int dotIdx = originalName.lastIndexOf(".");
	    String ext = originalName.substring(dotIdx); // .png
	    
	    UUID uuid = UUID.randomUUID();
	   	cusFilename = uuid.toString().replace("-", "");
	    cusFilename = cusFilename + ext;
	
	}
	
	int insertCustomer = CustomerDAO.insertCustomer(cusMail, cusName, cusPw, cusGender, cusBirth, cusContact, cusFilename);
	
	if(insertCustomer == 1){
		System.out.println("회원가입 성공");
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
	}else {
		System.out.println("회원가입 실패");
		response.sendRedirect("/Semi_F_GDCC/customer/insertCustomerForm.jsp");
	}
%>
