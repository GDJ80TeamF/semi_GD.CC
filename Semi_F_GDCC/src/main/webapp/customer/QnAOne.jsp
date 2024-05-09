<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<-- qnaNo QnAOne.jsp param ");

	// qnaNo에 따라QnA 출력하는 메서드 / 상세보기
	HashMap<String, Object> m = QnaDAO.selectQnAOne(qnaNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div>
	<h1>QnA 상세보기</h1>
		<table border="1">
			<tr>
				<th>qnaNo</th>
				<th>cusMail</th>
				<th>qnaTitle</th>
				<th>qnaContent</th>
				<th>createDate</th>
				<th>updateDate</th>
			</tr>
			<tr>
				<td><%=(Integer)(m.get("qnaNo"))%></td>	
				<td><%=(String)(m.get("cusMail"))%></td>	
				<td><%=(String)(m.get("qnaTitle"))%></td>	
				<td><%=(String)(m.get("qnaContent"))%></td>	
				<td><%=(String)(m.get("createDate"))%></td>
				<td><%=(String)(m.get("updateDate"))%></td>
			</tr>

			<a href="/Semi_F_GDCC/customer/updateQnAForm.jsp?qnaNo=<%=qnaNo%>">글 수정</a>
			<br>
			<a href="/Semi_F_GDCC/customer/action/deleteQnAAction.jsp?qnaNo=<%=qnaNo%>">글 삭제</a>
	</table>
	
</div>

<div>
<h1>QnA 댓글</h1>
	<table border="1">
		<tr>
			<th>commentNo</th>
			<th>qnaNo</th>
			<th>adminNo</th>
			<th>commentContent</th>
			<th>createDate</th>
			<th>updateDate</th>
		</tr>
	</table>

</div>
</body>
</html>