<%@page import="gdcc.dao.ComplexDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int complexNo = Integer.parseInt(request.getParameter("complexNo"));
	String checkId = request.getParameter("checkId");
	String checkPw = request.getParameter("checkPw");
	// 디버깅
	System.out.println("complexNo: " + complexNo);
	System.out.println("checkId: " + checkId);
	System.out.println("checkPw: " + checkPw);
	
	int row = ComplexDAO.deleteRoom(complexNo);
	if(row == 1){
		System.out.println("삭제 성공");
		response.sendRedirect("/Semi_F_GDCC/admin/complexList.jsp");
	}else{
		System.out.println("삭제 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/complexList.jsp");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>