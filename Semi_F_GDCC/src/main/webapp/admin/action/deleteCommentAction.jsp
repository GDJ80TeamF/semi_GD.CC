<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	
	int commentNo = Integer.parseInt(request.getParameter("commentNo"));
	System.out.println(commentNo + "<--commentNo deleteCommentAction.jsp param");
	
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<--qnaNo deleteCommentAction.jsp param");
	
	// commentNo ?인 comment 삭제하는 메서드
	int row = CommentDAO.deleteQnAComment(commentNo);
	
	if(row == 1){
		System.out.println("삭제성공");
		response.sendRedirect("/Semi_F_GDCC/admin/QnAOne.jsp?qnaNo="+qnaNo); //성공시
	} else {
		System.out.println("삭제실패");
		response.sendRedirect("/Semi_F_GDCC/admin/QnAOne.jsp?qnaNo="+qnaNo); //실패시			
	}

%>