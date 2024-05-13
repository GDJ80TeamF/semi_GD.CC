<%@page import="gdcc.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터값
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	String checkPw = request.getParameter("checkPw");
	
	
	// 디버깅
	System.out.println("noticeNo: " + noticeNo);
	System.out.println("checkPw: " + checkPw);
	
	 int row = NoticeDAO.deleteNotice(noticeNo);
	 
	 if(row == 1){
		 System.out.println("삭제 성공");
		 response.sendRedirect("/Semi_F_GDCC/admin/noticeList.jsp");
	 }else{
		 System.out.println("삭제 실패");
		 response.sendRedirect("/Semi_F_GDCC/admin/noticeList.jsp");
	 }
%>
