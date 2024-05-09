<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	HashMap<String,Object> loginMember 
	= (HashMap<String,Object>)(session.getAttribute("loginCustomer"));

	String cusMail = request.getParameter("cusMail");
	System.out.println(cusMail+ "<<==cusMail");
	
	//고객 본인이 작성한 QnA 조회하는 메서드
	ArrayList<HashMap<String, Object>> list = QnaDAO.selectQnAPerCus(cusMail);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div>
<h1>나의 QnA 목록</h1>
	<table border="1">
		<tr>
			<th>qnaNo</th>
			<th>cusMail</th>
			<th>qnaTitle</th>
			<th>qnaContent</th>
			<th>createDate</th>
			<th>updateDate</th>
		</tr>
		<%
			for(HashMap m : list) {
		%>
			<tr>
				<td><%=(String)(m.get("qnaNo"))%></td>
				<td><%=(String)(m.get("cusMail"))%></td>
				<td><%=(String)(m.get("qnaTitle"))%></td>
				<td><%=(String)(m.get("qnaContent"))%></td>
				<td><%=(String)(m.get("createDate"))%></td>
				<td><%=(String)(m.get("updateDate"))%></td>
			</tr>
		<%
			}
		%>
	</table>

</div>

</body>
</html>