<%@page import="gdcc.dao.RsvHotelDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	//인증 분기 세션 변수 이름 : loginCustomer
		if(session.getAttribute("loginCustomer") == null){
			response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
			return;
		}
		HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
		
		String cusMail = (String)(login.get("cusMail"));
%>
<%
	String checkinDate = request.getParameter("checkinDate");
	if(checkinDate == null){
		checkinDate = " ";
	}
	String checkoutDate = request.getParameter("checkoutDate");
	if(checkoutDate == null){
		checkoutDate = " ";
	}
	System.out.println(checkinDate);
	System.out.println(checkoutDate);
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println("rsvNo: "+ rsvNo);	
%>
<%
	HashMap<String,Object> cusRsvOne = RsvHotelDAO.rsvHotelOne(rsvNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>예약 상세정보</h1>

	<form method="post" action="/Semi_F_GDCC/customer/hotel/updateRsvAction.jsp?rsvNo=<%=rsvNo%>">
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
				<td><input type="text" name="rsvName" value="<%=cusRsvOne.get("name")%>" style="display:none;"><%=cusRsvOne.get("name")%>님</td>
				<td><input type="text" name="rsvMail" value="<%=cusRsvOne.get("mail")%>" style="display:none;"><%=cusRsvOne.get("mail")%></td>
				<td><input type="date" name="cusCheckIn" value="<%=cusRsvOne.get("checkin")%>" readonly="readonly"></td>
				<td><input type="date" name="cusCheckOut" value="<%=cusRsvOne.get("checkout")%>"  readonly="readonly"></td>
				<td><input type="number" name="cusMember" value="<%=cusRsvOne.get("member")%>">명</td>
				<td>
					<%
						//요청사항이 없음.
						if(cusRsvOne.get("request").equals("")){
									
					%>
						<div><textarea  rows="5" cols="50" name="cusRequest" placeholder="요청사항을 입력해주세요."></textarea></div>
					<%
						//요청사항 있음
						}else{
									
					%>
							<textarea  rows="5" cols="50" name="cusRequest"><%=cusRsvOne.get("request")%></textarea>
					<%
						}
					%>
				</td>
			</tr>
		</table>
	<div><button type="submit">예약변경하기</button></div>
	</form>



<%-- <%
	}

%> --%>
	
</body>
</html>