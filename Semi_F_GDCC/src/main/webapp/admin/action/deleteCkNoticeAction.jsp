<%@page import="gdcc.dao.NoticeDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	String checkId = request.getParameter("checkId");
	String checkPw = request.getParameter("checkPw");
	
	System.out.println("noticeNo: "+ noticeNo);
	System.out.println("checkId: "+ checkId);
	System.out.println("checkPw: "+ checkPw);
	
	boolean ck = NoticeDAO.noticeCheckIdPw(checkId, checkPw);
	if(ck == false){
		response.sendRedirect("/Semi_F_GDCC/admin/deleteNoticeForm.jsp?noticeNo=" + noticeNo + "&ck=F");
	}else{
		response.sendRedirect("/Semi_F_GDCC/admin/deleteNoticeForm.jsp?noticeNo=" + noticeNo + "&ck=T");
	}
%>
