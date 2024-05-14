<%@page import="gdcc.dao.ComplexDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int complexNo = Integer.parseInt(request.getParameter("complexNo"));
	String complexName = request.getParameter("complexName");
	String complexState = request.getParameter("complexState");
	String complexInfo = request.getParameter("complexInfo");
	
	System.out.println("complexNo: " + complexNo);
	System.out.println("complexName: " + complexName);
	System.out.println("complexState: " + complexState);
	System.out.println("complexInfo: " + complexInfo);
	
	int row = ComplexDAO.updateComplex(complexNo, complexName, complexState, complexInfo);
	
	if(row == 1){
		System.out.println("수정 성공");
		response.sendRedirect("/Semi_F_GDCC/admin/complexList.jsp");
	}else{
		System.out.println("수정 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/complexList.jsp");
	}
%>