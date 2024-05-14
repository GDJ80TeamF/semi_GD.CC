<%@page import="gdcc.dao.ComplexDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	int complexNo = Integer.parseInt(request.getParameter("complexNo"));
	String complexState = request.getParameter("complexState");
	
	// 디버깅
	System.out.println("complexNo: " + complexNo);
	System.out.println("complexState: " + complexState);
	
	int row = ComplexDAO.updateComplexState(complexNo, complexState); 
	
	if(row == 1){
		System.out.println("상태변경성공");
		response.sendRedirect("/Semi_F_GDCC/admin/complexList.jsp");
	}else{
		System.out.println("상태변경실패");
		response.sendRedirect("/Semi_F_GDCC/admin/complexList.jsp");
	}

%>
