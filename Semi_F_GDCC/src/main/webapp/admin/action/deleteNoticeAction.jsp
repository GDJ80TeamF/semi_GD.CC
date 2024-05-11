<%@page import="gdcc.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	System.out.println("noticeNo: " + noticeNo);
	
	 int row = NoticeDAO.deleteNotice(noticeNo);
	 
	 if(row == 1){
		 System.out.println("삭제 성공");
		 response.sendRedirect("/Semi_F_GDCC/admin/noticeList.jsp");
	 }else{
		 System.out.println("삭제 실패");
		 response.sendRedirect("/Semi_F_GDCC/admin/noticeList.jsp");
	 }
%>
