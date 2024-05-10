<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<--qnaNo insertCommentAction.jsp param");
	
	int adminNo = Integer.parseInt(request.getParameter("adminNo"));
	System.out.println(adminNo + "<--adminNo insertCommentAction.jsp param");
	
	String commentContent = request.getParameter("commentContent");
	System.out.println(commentContent + "<--commentContent insertCommentAction.jsp param");
	
	// QnA 작성하는 메서드
	int row = CommentDAO.insertQnAComment(qnaNo, adminNo, commentContent);
	
	if(row == 1){
		System.out.println("입력성공");
		response.sendRedirect("/Semi_F_GDCC/admin/QnAOne.jsp?qnaNo="+qnaNo); //성공시
	} else {
		System.out.println("입력실패");
		response.sendRedirect("/Semi_F_GDCC/admin/QnAOne.jsp?qnaNo="+qnaNo); //실패시			
	}

%>