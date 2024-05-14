<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*"%>
<%
	//로그인 인증분기
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>
<%
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
		System.out.println(rsvNo + "<==rsvHotelOne.rsvNo");
		
	//rsv_hotel테이블에서 예약한 정보 다 가져오기
	
	HashMap<String,Object> rsvOne = RsvHotelDAO.rsvHotelOne(rsvNo);
		System.out.println(rsvOne + "<==rsvHotelOne.rsvOne");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 상세보기</title>
</head>
<body>
	<div>
		<h1>예약 상세보기</h1>
			<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?table=rsv_hotel">
				예약리스트 돌아가기
			</a>
				<table>
					<tr>
						<th>성함</th>
						<td><%=rsvOne.get("name") %>님</td>
					</tr>
					<tr>
						<th>mail</th>
						<td><%=rsvOne.get("mail") %></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><%=rsvOne.get("contact") %></td>
					</tr>
					<tr>
						<th>CHECK-IN</th>
						<td><%=rsvOne.get("checkin") %></td>
					</tr>
					<tr>
						<th>CHECK-OUT</th>
						<td><%=rsvOne.get("checkout") %></td>
					</tr>
					<tr>
						<th>인원</th>
						<td><%=rsvOne.get("member") %>분</td>
					</tr>
					<tr>
						<th>요청사항</th>
						<td>
							<%
								if(rsvOne.get("request") == null){
									//요청사항이 없음.
							%>
								<span>요청사항이 없습니다</span>
							<%
								}else{
									//요청사항 있음
							%>
									<%=rsvOne.get("request") %>
							<%
								}
							%>
						</td>
					</tr>
				</table>
	</div>

</body>
</html>