<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
	HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
	
	String cusMail = (String)(login.get("cusMail"));
%>
<%
	int rsvComNo = Integer.parseInt(request.getParameter("rsvComNo"));

	HashMap<String,Object> m = RsvComplexDAO.selectRsvOne(rsvComNo);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>시설 예약번호 </td>
			<td><%=(Integer)m.get("comNo") %></td>
		</tr>
		<tr>
			<td>호텔 예약번호</td>
			<td><%=(Integer)m.get("rsvNo") %></td>
		</tr>
		<tr>
			<td>예약한 시설</td>
			<td><%=(String)m.get("rsvPlace") %></td>
		</tr>
		<tr>
			<td>예약 날짜 </td>
			<td><%=(String)m.get("rsvDate") %></td>
		</tr>
		<tr>
			<td>예약 시간 </td>
			<td><%=(String)m.get("rsvTime") %></td>
		</tr>
		<tr>
			<td>예약 인원수</td>
			<td><%=(Integer)m.get("rsvMember") %></td>
		</tr>
		<tr>
			<td>예약 완료 날짜 </td>
			<td><%=(String)m.get("createDate") %></td>
		</tr>
		
	
	</table>
	<div><a href="/Semi_F_GDCC/customer/hotelComplex/rsvComplexList.jsp?cusMail=<%=cusMail%>">리스트로 돌아가기 </a></div>
	
	<div><a href="/Semi_F_GDCC/customer/hotelComplex/updateRsvForm.jsp">예약 정보 변경하기 </a></div>
</body>
</html>