<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	String adminMail = request.getParameter("adminMail");
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	
	System.out.println("adminMail: " + adminMail);
	System.out.println("noticeTitle: " + noticeTitle);
	System.out.println("noticeContent: " + noticeContent);
	
	int NT = NoticeDAO.insertNotice(adminMail, noticeTitle, noticeContent);
	
	if(NT == 1){
		System.out.println("게시판 등록 완료"); 
		response.sendRedirect("/Semi_F_GDCC/admin/noticeList.jsp");
		
	}else{
		System.out.println("개시판 등록 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/noticeList.jsp");
	}

	
	
%>