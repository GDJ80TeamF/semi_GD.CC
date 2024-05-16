<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.ParseException"%>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<-- rsvNo rsvOne.jsp param ");

	// rsvNo에 따라 조식예약정보 출력하는 메서드 / 상세보기
	ArrayList<HashMap<String, Object>> list = RsvBfDAO.selectRsvOne(rsvNo);
	
	// 현재 날짜 구하기
	Date currentDate = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // SimpleDateFormat을 사용하여 날짜 형식 지정
    Date rsvDate = null; // 예약 날짜를 Date 객체로 변환할 변수 초기화
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div>
	<h1>조식예약 상세보기</h1>
		<table border="1">
			<tr>
				<th>rsvNo</th>
				<th>rsvDate</th>
				<th>rsvTime</th>
				<th>rsvMember</th>
				<th>rsvState</th>
				<th>menuMain</th>
				<th>menuInfo</th>
				<th>menuImg</th>
			</tr>
			<%	
				for(HashMap m : list) {
			        // 예약 날짜 가져오기
			        String rsvDateStr = (String) m.get("rsvDate");
			        try { // 날짜 문자열을 Date 객체로 변환
			            rsvDate = sdf.parse(rsvDateStr);
			        } catch (ParseException e) {
			            e.printStackTrace(); // 예외 처리
			        }
			%>
			<tr>
				<td><%=(Integer)(m.get("rsvNo"))%></td>	
				<td><%=(String)(m.get("rsvDate"))%></td>	
				<td><%=(String)(m.get("rsvTime"))%></td>
				<td><%=(Integer)(m.get("rsvMember"))%></td>	
				<td><%=(String)(m.get("rsvState"))%></td>	
				<td><%=(String)(m.get("menuMain"))%></td>
				<td><%=(String)(m.get("menuInfo"))%></td>
				<td><%=(String)(m.get("menuImg"))%></td>
			<%
			        // 현재 날짜와 예약 날짜 비교
			        if (currentDate.compareTo(rsvDate) <= 0) { // 현재 날짜가 예약 날짜 이후인 경우
			%>
				<td>
					<a href="/Semi_F_GDCC/customer/hotelBf/rsvUpdateForm.jsp?rsvNo=<%=rsvNo%>&
								rsvBfno=<%=(Integer)(m.get("rsvBfno"))%>">예약 수정</a>
				</td>
				<td>		
				<a href="/Semi_F_GDCC/customer/hotelBf/rsvDeleteForm.jsp?rsvNo=<%=rsvNo%>&
								rsvBfno=<%=(Integer)(m.get("rsvBfno"))%>">예약 취소</a>
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
			<%
				}
			%>
	</table>
	
</div>


</body>
</html>