<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<-- qnaNo updateQnAForm.jsp param");
	
	// qnaNo에 따라QnA 출력하는 메서드 / 상세보기
	HashMap<String, Object> m = QnaDAO.selectQnAOne(qnaNo);
	System.out.println(m + "<-- m updateQnAForm.jsp param");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div>
<h1>QnA 글 수정</h1>
<form method="post" action="/Semi_F_GDCC/customer/action/updateQnAAction.jsp">
	<table>

		<tr>
			<th>아이디 :</th>
			<td><input type="text" value="<%=(String)(m.get("cusMail"))%>" name="cusMail"></td>
		</tr>
		<tr>
			<th>qnaNo :</th>
			<td><input type="text" value="<%=qnaNo%>" name="qnaNo"></td>
		</tr>
		<tr>
			<th>제목 :</th>
			<td><input type="text" value="<%=(String)(m.get("qnaTitle"))%>" name="qnaTitle"></td>
		</tr>
		<tr>
			<th>내용 :</th>
			<td><textarea  style="width: 550px; height: 300px;"
						 name="qnaContent"><%=(String)(m.get("qnaContent"))%></textarea></td>
		</tr>

		<tr>
			<td><button type="submit">수정</button></td>
		</tr>
	</table>
		
</form>		
</div>
</body>
</html>