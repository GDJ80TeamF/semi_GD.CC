<%@page import="java.sql.PreparedStatement"%>
<%@ page languagenoticeTitle="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="gdcc.dao.NoticeDAO"%>
<%
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	int adminNo = Integer.parseInt(request.getParameter("adminNo"));
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	System.out.println("noticeNo: " + noticeNo);
	System.out.println("adminNo: " + adminNo);
	System.out.println("noticeTitle: " + noticeTitle);
	System.out.println("noticeContent: " + noticeContent);
	
	int row = NoticeDAO.insertNotice(noticeNo, adminNo, noticeTitle, noticeContent);
	
	if(row == 1){
		System.out.println("게시판 등록 완료"); 
		response.sendRedirect("/Semi_F_GDCC/admin/noticeList.jsp");
		
	}else{
		System.out.println("개시판 등록 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/noticeList.jsp");
	}

	
	
%>