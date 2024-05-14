<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%

	if(checkinDate == " " && checkoutDate == " "){
%>
	<form method="post" action="/Semi_F_GDCC/customer/hotel/checkRoomList.jsp">
	<table>
		<tr>
			<td>예약일시</td>
			<td><input type="date" name="checkinDate" id="checkinDate"> ~ <input type="date" name="checkoutDate" id="checkoutDate"></td>
		</tr>
	</table>
	
	<button type="submit">예약 가능한 룸 확인하기!  </button>
	</form>


<% 
	}else{
%>
	<form method="post" action="/Semi_F_GDCC/customer/hotel/insertNewRsvAction.jsp">
	
			<div>예약 일시:
			<input type="text" name="checkinDate" value="<%=checkinDate%>" readonly>
			 ~ 
			<input type="text" name="checkoutDate" value="<%=checkoutDate%>" readonly></div>

			<div>룸 선택:</div>
			
			<%
				ArrayList<HashMap<String,Object>> rooms = RsvHotelDAO.selectRoomList(checkinDate, checkoutDate);
				for(HashMap<String,Object> m:rooms){
			%>
			
			<input type="radio" name="roomNo" value="<%=(Integer)m.get("roomNo") %>">
			<div>룸 번호 : <%=(Integer)m.get("roomNo") %> </div>
			<div>룸 등급 : <%=(String)m.get("roomGrade") %> </div>
			<div>룸 가격 :<%=(Integer)m.get("roomPrice") %></div>
			<div><%=(String)m.get("roomInfo") %></div>
			<div><img src="/Semi_F_GDCC/upload/<%=(String)m.get("roomImg") %>" width="400" height="300"></div>
			

			
			
			
			<%
					
				}
			
			%>
			
			<div>예약자 아이디 : <input type="text" value="<%=cusMail%>" readonly name="rsvMail"></div>
			
			<div>동반 인원 수 : <input type="number" name="rsvMember" min="1" max="4"></div>
			
			<div>요청 사항 : <textarea rows="5" cols="40" name="rsvRequest"></textarea></div>
	
	<div><button type="submit">예약하기! </button></div>
	</form>



<%
	}

%>
	
	

</body>
</html>