<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*" %>
<%@page import="gdcc.dao.NoticeDAO"%>
<%
	// 인증 분기 세션 변수 이름 : loginAdmin
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>
<%
	// 파라미터값
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));	
	int adminNo = Integer.parseInt(request.getParameter("adminNo"));
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	// 디버깅
	System.out.println("noticeNo: " + noticeNo);
	System.out.println("adminNo: " + adminNo);
	System.out.println("noticeTitle: " + noticeTitle);
	System.out.println("noticeContent: " + noticeContent);
	
	int row = NoticeDAO.updateNotice(noticeNo, adminNo, noticeTitle, noticeContent);
	
	if(row == 1){
		System.out.println("수정 성공");
		response.sendRedirect("/Semi_F_GDCC/admin/noticeList.jsp");
	}else{
		System.out.println("수정 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/noticeList.jsp");
	}
	
%>		
