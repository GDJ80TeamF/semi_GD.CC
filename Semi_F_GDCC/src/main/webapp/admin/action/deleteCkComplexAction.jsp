<%@page import="gdcc.dao.ComplexDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int complexNo = Integer.parseInt(request.getParameter("complexNo"));
	String checkId = request.getParameter("checkId");
	String checkPw = request.getParameter("checkPw");
	
	// 디버깅
	System.out.println("complexNo: " + complexNo);
	System.out.println("checkId: " + checkId);
	System.out.println("checkPw: " + checkPw);
	
	boolean ck = ComplexDAO.deleteCkIdPw(checkId, checkPw);
	if(ck == false){
		System.out.println("체크 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/deleteComplexForm.jsp?complexNo=" + complexNo + "&ck=" + ck + "&checkId=" + checkId);
	}else{
		System.out.println("체크 성공");
		response.sendRedirect("/Semi_F_GDCC/admin/deleteComplexForm.jsp?complexNo=" + complexNo + "&ck=" + ck + "&checkId=" + checkId);
	}
	
%>