<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import="java.net.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gdcc.dao.CustomerDAO"%>
<%
	String checkId = request.getParameter("checkId");
	System.out.println("checkId: " + checkId);
	
	boolean cusCkId = CustomerDAO.customerCheckId(checkId);
	if(cusCkId == false) {
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/insertCustomerForm.jsp?checkId=" + checkId+"&ck=F");
	}else{
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/insertCustomerForm.jsp?checkId=" + checkId+"&ck=T");
	}
%>