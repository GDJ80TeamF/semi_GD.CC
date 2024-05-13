<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@ page import="gdcc.dao.*" %>
 <%
 

	//인증 분기 세션 변수 이름 : loginCustomer
		if(session.getAttribute("loginCustomer") == null){
			response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
			return;
	}
	HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
	
	String cusMail = (String)(login.get("cusMail"));
	
	//고객 아이디로 예약된 예약 번호 불러오기 
 	ArrayList<HashMap<String,Object>> list = RsvComplexDAO.selectRsvList(cusMail);
 
 
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h2>시설 예약리스트 </h2>
	<a href="/Semi_F_GDCC/customer/main.jsp">메인화면으로 돌아가기 </a>
	<table class="table table-hover">
		<tr>
			<th>시설 예약 번호</th>
			<th>호텔 예약 번호 </th>
			<th> 예약한 시설 </th>
			<th>예약날짜 </th>
			<th>예약시간  </th>
			<th>예약 상태  </th>
			<th>상세보기 </th>
			<th>예약취소 </th>
			
		</tr>
		<tr>
		<%
			for(HashMap<String,Object> m :list){
		%>
		<td><%= (Integer)m.get("comNo")%></td>
		<td><%= (Integer)m.get("rsvNo")%></td>
		<td><%= (String)m.get("rsvPlace")%></td>
		<td><%= (String)m.get("rsvDate")%></td>
		<td><%= (String)m.get("rsvTime")%></td>
		<td><%= (String)m.get("rsvState")%></td>
		<td><a href="/Semi_F_GDCC/customer/hotelComplex/rsvComplexOne.jsp?rsvComNo=<%=(Integer)m.get("comNo")%>">상세보기 </a></td>
		<td><a href="/Semi_F_GDCC/customer/hotelComplex/cancelRsvForm.jsp?rsvComNo=<%=(Integer)m.get("comNo")%>">취소하기 </a></td>
		</tr>
		<%
			}
		
		
		%>
		
	</table>
	
	<div><a href="/Semi_F_GDCC/customer/hotelComplex/insertRsvForm.jsp">호텔 시설 새로운 예약하기 !</a></div>
	
	
</body>
</html>