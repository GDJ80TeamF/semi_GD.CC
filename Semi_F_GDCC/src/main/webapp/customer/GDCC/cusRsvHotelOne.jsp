<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.ParseException"%>


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
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
		System.out.println("rsvNo: "+ rsvNo);
		
	//rsv_hotel테이블에서 예약한 정보 다 가져오기
	
	HashMap<String,Object> list = RsvHotelDAO.rsvHotelOne(rsvNo);
	System.out.println(list.get("request"));
%>
<%
	// 현재 날짜 구하기
	Date currentDate = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // SimpleDateFormat을 사용하여 날짜 형식 지정
	Date rsvDate = null; // 예약 날짜를 Date 객체로 변환할 변수 초기화

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
				<td><%=list.get("name") %>님</td>
				<td><%=list.get("mail") %></td>
				<%   
                 // 예약 날짜 가져오기
                 String rsvDateStr = (String)list.get("checkin");
                 try { // 날짜 문자열을 Date 객체로 변환
                     rsvDate = sdf.parse(rsvDateStr);
                 } catch (ParseException e) {
                     e.printStackTrace(); // 예외 처리
                 }
        	 	%>

				<td><%=list.get("checkin") %></td>
				<td><%=list.get("checkout") %></td>
				<td><%=list.get("member") %>명</td>
				<td>
					<%
						//요청사항이 없음.
						if(list.get("request").equals("")){
									
					%>
							<div>요청사항이 없습니다</div>
					<%
						//요청사항 있음
						}else{
									
					%>
							<%=list.get("request") %>
					<%
						}
					%>
				</td>
			</tr>
			<tr>
				<%
	                 // 현재 날짜와 예약 날짜 비교
	                 if (currentDate.compareTo(rsvDate) <= 0) { // 현재 날짜가 예약 날짜 이후인 경우
	         	%>
	         		   <td>
		               		<a href="/Semi_F_GDCC/customer/hotel/updateRsvForm.jsp?rsvNo=<%=rsvNo%>">예약 변경</a> 
							<a href="/Semi_F_GDCC/customer/hotel/rsvCancelForm.jsp?rsvNo=<%=rsvNo%>">예약 취소</a> 
		           		</td>
	         		
	         	<%
	                 } else {
	                     // 현재 날짜가 예약 날짜 이전인 경우 버튼 숨김
		         %>
		                     <td>예약 만료</td>               
		         <%
		                 }
		         %>

			</tr>	

		</table>
		<%-- <a href="/Semi_F_GDCC/customer/hotel/updateRsvForm.jsp?rsvNo=<%=rsvNo%>">예약 변경</a> 
		<a href="/Semi_F_GDCC/customer/hotel/rsvCancelForm.jsp?rsvNo=<%=rsvNo%>">예약 취소</a>  --%>
</body>
</html>