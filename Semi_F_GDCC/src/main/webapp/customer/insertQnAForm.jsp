<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div>
<h1>QnA 글 작성</h1>
<form method="post" action="/Semi_F_GDCC/customer/action/insertQnAAction.jsp">
	<table>
		<tr>
			<th>아이디 :</th>
			<td><input type="text" name="cusMail"></td>
		</tr>
		<tr>
			<th>제목 :</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<th>내용 :</th>
			<td><textarea style="width: 550px; height: 300px;" name="content"></textarea></td>
		</tr>
		<tr>
			<td><button type="submit">작성</button></td>
		</tr>
	</table>
		
</form>		
</div>
</body>
</html>