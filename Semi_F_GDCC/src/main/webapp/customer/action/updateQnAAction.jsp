<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	String qnaTitle = request.getParameter("qnaTitle");
	System.out.println(qnaTitle + "<--qnaTitle insertQnAAction.jsp param");
	
	String qnaContent = request.getParameter("qnaContent");
	System.out.println(qnaContent + "<--qnaContent insertQnAAction.jsp param");
	
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<--qnaNo insertQnAAction.jsp param");
	
	int row = QnaDAO.updateQnA(qnaTitle, qnaContent, qnaNo);
	
	if(row == 1){
		System.out.println("성공");
		response.sendRedirect("/Semi_F_GDCC/customer/QnAOne.jsp?qnaNo="+qnaNo); //성공시
	} else {
		System.out.println("실패");
		response.sendRedirect("/Semi_F_GDCC/customer/updateQnAForm.jsp?qnaNo="+qnaNo); //실패시 다시 입력 페이지로			
	}

%>