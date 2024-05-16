<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%

	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	// 세션에서 고객 mail가져오기
	HashMap<String,Object> login = (HashMap<String,Object>)(session.getAttribute("loginCustomer"));

	String cusMail = (String)(login.get("cusMail"));
	System.out.println(cusMail+ "<--cusMail QnAListPerCustomer.jsp param");
	
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
				<td><%=(Integer)(m.get("qnaNo"))%></td>
				<td><%=(String)(m.get("cusMail"))%></td>
				<td><%=(String)(m.get("qnaTitle"))%></td>
				<td><%=(String)(m.get("qnaContent"))%></td>
				<td><%=(String)(m.get("createDate"))%></td>
				<td><%=(String)(m.get("updateDate"))%></td>
				<td>
					<a href="/Semi_F_GDCC/customer/updateQnAForm.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">글 수정</a>
					<br>
					<a href="/Semi_F_GDCC/customer/action/deleteQnAAction.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">글 삭제</a>
				</td>
			</tr>
		<%
			}
		%>
	</table>

</div>

</body>
</html>