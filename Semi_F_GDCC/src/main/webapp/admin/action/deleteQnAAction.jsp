<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<--qnaNo deleteQnAAction.jsp param");
	
	// qnaNo가 ?인 QnA 삭제하는 메서드
	int row = QnaDAO.deleteQnA(qnaNo);
	
	if(row == 1){
		System.out.println("삭제성공");
		response.sendRedirect("/Semi_F_GDCC/admin/QnAList.jsp"); //성공시
	} else {
		System.out.println("삭제실패");
		response.sendRedirect("/Semi_F_GDCC/admin/QnAOne.jsp?qnaNo="+qnaNo); //실패시 다시 상세페이지로			
	}

%>