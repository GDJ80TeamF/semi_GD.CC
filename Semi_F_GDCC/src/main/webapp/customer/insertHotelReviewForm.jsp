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
	// 세션에서 고객 mail가져오기
	HashMap<String,Object> login = (HashMap<String,Object>)(session.getAttribute("loginCustomer"));
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<-- rsvNo insertHotelReviewForm.jsp param");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div>
<h1>호텔리뷰 작성</h1>
<form method="post" action="/Semi_F_GDCC/customer/action/insertHotelReviewAction.jsp">
	<table>
		<tr>
			<th>예약번호 :</th>
			<td><input type="text" name="rsvNo" value="<%=rsvNo%>"></td>
		</tr>
		<tr>
			<th>제목 :</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<th>별점 :</th>
			<td>
				<select name="score">
					<option value="1">★<option>
					<option value="2">★★</option>
					<option value="3">★★★</option>
					<option value="4">★★★★</option>
					<option value="5">★★★★★</option>
				</select>
			</td>
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