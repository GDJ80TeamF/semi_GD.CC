<%@page import="gdcc.dao.ComplexDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int complexNo = Integer.parseInt(request.getParameter("complexNo"));
	// 디버깅
	System.out.println("complexNo: " + complexNo);
	
	HashMap<String, Object> m = ComplexDAO.selectComplexOne(complexNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>complex 수정 폼</h1>
	<form method="post" action="/Semi_F_GDCC/admin/">
		<div>		
			complexNO
			<%=(Integer)(m.get("complexNo"))%>		
		</div>
		<div>
			complexName
			<%=(String)(m.get("complexName"))%>
		</div>
		<div>
			complexState
			<%=(String)(m.get("complexState"))%>
		</div>
		<div>		
			complexInfo
			<%=(String)(m.get("complexInfo"))%>
		</div>
	</form>
			
	
</body>
</html>