<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.util.*" %>
<%

	//인증 분기 세션 변수 이름 : loginCustomer
		if(session.getAttribute("loginCustomer") == null){
			response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
			return;
	}
	HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
	
	String cusMail = (String)(login.get("cusMail"));
	//고객 아이디로 예약된 예약 번호 불러오기 
	
	ArrayList <HashMap<String,Object>> list = RsvHotelDAO.selectRsvNo(cusMail);
	ArrayList <HashMap<String,Object>> complexList = ComplexDAO.selectComplexNo();
	
	String rsvNo = request.getParameter("rsvNo");
	if (rsvNo == null){
		rsvNo = " ";
	}
	
	String rsvPlace = request.getParameter("rsvPlace");
	if (rsvPlace == null){
		rsvPlace = " ";
	}
	String rsvDate = request.getParameter("rsvDate");
	if (rsvDate == null){
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
<!-- 예약번호 선택하기   -->
<%
	if(rsvNo == " "){
%>
<form method="post" action="/Semi_F_GDCC/customer/hotelComplex/checkRsvNo.jsp">
	<table>		
		<tr>
			<td>호텔 예약번호</td>
			<td>
			<select name="rsvNo">
			<%
				for(HashMap<String,Object> m:list){
			%>
			<option value="<%=(Integer)m.get("rsvNo")%>"><%=(Integer)m.get("rsvNo")%></option>
			
			<%
				}
			
			%>
			</select>
			</td>
		</tr>	
	</table>
	<button type="submit">예약번호 선택 </button>
</form>
<%
	}else if(rsvNo != " " && rsvPlace == " " && rsvDate ==" "){
		int rsvNoparam = Integer.parseInt(rsvNo);
		HashMap<String,Object> date = RsvHotelDAO.selectdate(rsvNoparam);
%>
	
<form method="post" action="/Semi_F_GDCC/customer/hotelComplex/checkDatePlace.jsp">
<table>
		<tr>
			<td>호텔 예약번호</td>
			<td>
			<input name="rsvNo" value="<%=rsvNo%>" readonly>
			</td>
		</tr>	
		<tr>
			<td>예약날짜</td>
			<td>
			<input type="date" name="rsvDate" min="<%=(String)date.get("checkinDate")%>" max="<%=(String)date.get("checkoutDate")%>">
			
			</td>
	
		</tr>
		<tr>
			<td>이용 시설 </td>
			<td>
			<select name="rsvPlace">
			<%
				for(HashMap<String,Object> n:complexList){
			%>
			<option value="<%=(Integer)n.get("complexNo")%>"><%=(String)n.get("complexName")%></option>
			<%
				}
			%>
			
			</select>
			
			</td>
			
		</tr>
</table>
		
<button type="submit">예약 가능한 시간대 확인 </button>

</form>
<%
	}else if(rsvPlace != " " && rsvDate != " " && rsvNo !=" "){
%>

<form method="post" action="/Semi_F_GDCC/customer/hotelComplex/insertRsvAction.jsp">
<table>
		<tr>
			<td>호텔 예약번호</td>
			<td>
			<input name="rsvNo" value="<%=rsvNo%>" readonly>
			</td>
		</tr>	
		<tr>
			<td>예약날짜</td>
			<td>
			<input type="date" name="rsvDate" value="<%=rsvDate%>" readonly>
			
			</td>
	
		</tr>
		<tr>
			<td>이용 시설 </td>
			<td>
			<%
			//선택된 부가시설 이름 출력해주기
			HashMap<String,Object> m = ComplexDAO.selectComplexOne(Integer.parseInt(rsvPlace));
			String complexName = (String) m.get("complexName");
			
			%>
			<select name="rsvPlace">
			<option value="<%=rsvPlace%>" selected readonly><%=complexName%></option>
			
			</select>
			
			</td>
			
		</tr>
		<tr>
			<td>예약 시간</td>
			<td>
			<%
			int rsvPlaceint = Integer.parseInt(rsvPlace);
			ArrayList<HashMap<String,Object>> times = RsvComplexDAO.selectTimes(rsvPlaceint, rsvDate);
			System.out.println(times.size());
			%>
			
			<%
				if(times.size() != 0){
			%>
			<select name="rsvTime">
			<%
					for(HashMap<String,Object> t:times){
						
			%>
					<option value="<%=(String)t.get("rsvTime")%>"><%=(String)t.get("rsvTime")%></option>
					
			<% 
					}
			%>
			</select>
			</td> 
			<tr>
			<td>예약 인원 </td>
			<td><input type="number" min="1" max="6" name="rsvMember"></td>
		</tr>
	
		</table>
		<button type="submit">예약하기 </button>
		<a href="/Semi_F_GDCC/customer/hotelComplex/insertRsvForm.jsp?rsvNo=<%=rsvNo%>">다른 날짜 선택 </a>
		</form>
 			<% 
				}else if(times.size() == 0){
			%>
					<div>모든 시간대가 마감되었습니다. 다른 날짜나 시설을 선택해주세요.</div>
					<a href="/Semi_F_GDCC/customer/hotelComplex/insertRsvForm.jsp?rsvNo=<%=rsvNo%>">다른 날짜 선택 </a>
			<% 
					}
			%>
			



<%
	}


%> 

		
		

</body>
</html>