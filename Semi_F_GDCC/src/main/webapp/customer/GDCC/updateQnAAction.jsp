<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	String qnaTitle = request.getParameter("qnaTitle");
	System.out.println(qnaTitle + "<--qnaTitle updateQnAAction.jsp param");
	
	String qnaContent = request.getParameter("qnaContent");
	System.out.println(qnaContent + "<--qnaContent updateQnAAction.jsp param");
	
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<--qnaNo updateQnAAction.jsp param");
	
	// qnaNo가 ?인 QnA 수정하는 메서드
	int row = QnaDAO.updateQnA(qnaTitle, qnaContent, qnaNo);
	
	if(row == 1){
		System.out.println("수정성공");
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/QnAOne.jsp?qnaNo="+qnaNo); //성공시
	} else {
		System.out.println("수정실패");
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/updateQnAForm.jsp?qnaNo="+qnaNo); //실패시 다시 수정페이지로			
	}

%>