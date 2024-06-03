<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	//호텔 번호로 체크인 날짜, 체크아웃 날짜 불러와서 해당목록의 날짜만 출력하기 
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	
	response.sendRedirect("/Semi_F_GDCC/customer/GDCC/hotelComplex/insertRsvForm.jsp?rsvNo="+rsvNo);
	
	


%>