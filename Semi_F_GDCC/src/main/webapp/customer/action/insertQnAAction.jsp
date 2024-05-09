<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	String cusMail = request.getParameter("cusMail");
	System.out.println(cusMail + "<--cusMail insertQnAAction.jsp param");
	
	String title = request.getParameter("title");
	System.out.println(title + "<--title insertQnAAction.jsp param");
	
	String content = request.getParameter("content");
	System.out.println(content + "<--content insertQnAAction.jsp param");
	
	int row = QnaDAO.insertQnA(cusMail, title, content);
	
	if(row == 1){
		System.out.println("성공");
		response.sendRedirect("/Semi_F_GDCC/customer/QnAList.jsp"); //성공시 QnA게시판으로
	} else {
		System.out.println("실패");
		response.sendRedirect("/Semi_F_GDCC/customer/insertQnAForm.jsp"); //실패시 다시 입력 페이지로			
	}

%>