<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
		System.out.println("rsvNo: "+ rsvNo);
		
	//rsv_hotel테이블에서 예약한 정보 다 가져오기
	
	HashMap<String,Object> cusRsvOne = RsvHotelDAO.rsvHotelOne(rsvNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>예약 상세정보</h1>
		<table border="1">
			<tr>
				<th>예약한 성함</th>
				<th>mail</th>
				<th>체크인 날짜</th>
				<th>체크아웃 날짜</th>
				<th>인원수</th>
				<th>요청사항</th>
				
			</tr>
			<tr>
				<td><%=cusRsvOne.get("name") %>님</td>
				<td><%=cusRsvOne.get("mail") %></td>
				<td><%=cusRsvOne.get("checkin") %></td>
				<td><%=cusRsvOne.get("checkout") %></td>
				<td><%=cusRsvOne.get("member") %>명</td>
				<td>
					<%
						//요청사항이 없음.
						if(cusRsvOne.get("request").equals("")){
									
					%>
						<div>요청사항이 없습니다</div>
					<%
						//요청사항 있음
						}else{
									
					%>
							<%=cusRsvOne.get("request") %>
					<%
						}
					%>
				</td>
			</tr>
		</table>
		<a href="/Semi_F_GDCC/customer/hotel/updateRsvForm.jsp">예약 변경</a> 
</body>
</html>