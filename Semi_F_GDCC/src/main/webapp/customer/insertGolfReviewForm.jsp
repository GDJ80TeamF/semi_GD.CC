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
<h1>골프리뷰 작성</h1>
<form method="post" action="/Semi_F_GDCC/customer/action/insertGolfReviewAction.jsp">
	<table>
		<tr>
			<th>예약번호 :</th>
			<td><input type="text" name="rsvNo"></td>
		</tr>
		<tr>
			<th>제목 :</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<th>별점 :</th>
			<td><input type="text" name="score"></td>
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