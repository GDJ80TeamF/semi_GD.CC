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
	//호텔 예약한 날짜범위안에서만 예약가능 
	int rsvNo = (Integer)m.get("rsvNo");
	HashMap<String,Object> date = RsvHotelDAO.selectdate(rsvNo);
	//변경가능한 시간대 확인을 위해 예약변경 날짜 넘겨서 받아오기 
	String rsvDate = request.getParameter("rsvDate");
	if(rsvDate == null){
		rsvDate = " ";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(rsvDate == " "){
%>
<form method="post" action="/Semi_F_GDCC/customer/hotelComplex/updateRsvDateCheck.jsp?rsvComNo=<%=rsvComNo%>">
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
			<td><input name="rsvDate" type="date" value="<%=(String)m.get("rsvDate") %>" min="<%=(String)date.get("checkinDate") %>" max="<%=(String)date.get("checkoutDate") %>">
			</td>
		</tr>
	</table>
	<button type="submit">예약 변경 가능한 시간 확인 </button>
</form>


<%
	}else if(rsvDate != " "){
%>

<form method="post" action="/Semi_F_GDCC/customer/hotelComplex/updateRsvAction.jsp?rsvComNo=<%=rsvComNo%>">
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
			<td><input name="rsvDate" type="date" value="<%=rsvDate%>">
			</td>
		</tr>
		<tr>
			<td>예약 시간 </td>
			<td>
			<%
			// 예약시설 번호 구하기 
			int rsvPlaceint = (Integer)m.get("rsvPlaceNo");
			ArrayList<HashMap<String,Object>> times = RsvComplexDAO.selectTimes(rsvPlaceint, rsvDate);
			System.out.println(times.size());
			%>
			
			<% 
			if(times.size() !=0){
			%>
			<select name="rsvTime">
				<option value="<%=(String)m.get("rsvTime")%>">현재 예약된 시간: <%=(String)m.get("rsvTime")%></option>
			<% 
			
				for(HashMap<String,Object> t:times){
				
			%>
				<option value="<%=(String)t.get("rsvTime")%>"><%=(String)t.get("rsvTime")%></option>
			<% 
					}
			%>
			</select>
		</tr>
		<tr>
			<td>예약 인원수</td>
			<td><input name="rsvMember" type="number" min="1" max="6" value="<%=(Integer)m.get("rsvMember") %>"></td>
		</tr>

	</table>
	<button type="submit">예약 변경하기</button>
	
</form>
<a href="/Semi_F_GDCC/customer/hotelComplex/updateRsvForm.jsp?rsvComNo=<%=rsvComNo%>">다른 날짜 선택 </a>
		<% 
			}else if(times.size() == 0){
		%>
			<div>모든 시간대가 마감되었습니다. 다른 날짜를 선택해주세요.</div>
			<a href="/Semi_F_GDCC/customer/hotelComplex/updateRsvForm.jsp?rsvComNo=<%=rsvComNo%>">다른 날짜 선택 </a>
		<% 
				}
		%>


<% 	
		
	}

%>


			
				
				
			
	<div><a href="/Semi_F_GDCC/customer/hotelComplex/rsvComplexList.jsp?cusMail<%=cusMail%>">리스트로 돌아가기 </a></div>
	
	
</body>
</html>