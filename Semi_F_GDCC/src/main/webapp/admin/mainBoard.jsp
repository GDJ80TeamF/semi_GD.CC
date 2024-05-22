<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 메인페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}

	
	HashMap<String,Object> loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
	String adminName = (String) loginAdmin.get("adminName");
	String adminMail = (String) loginAdmin.get("adminMail");
	
	ArrayList<HashMap<String,Object>> list = RsvHotelDAO.checkinToday();
	ArrayList<HashMap<String,Object>> list2 = RsvHotelDAO.checkoutToday();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./style.css">
<style>
h3,h4{
	margin-left:20px;
}
table {
  width: 50%;
  border-collapse: collapse;
}

/* 테이블 헤더 스타일 */
th {
  background-color: #f2f2f2;
  color: #333;
  font-weight: bold;
  padding: 8px;
  text-align: left;
  border-bottom: 2px solid #ddd;
}

/* 테이블 셀 스타일 */
td {
  padding: 8px;
  border-bottom: 1px solid #ddd;
}

/* 짝수 행 배경색 지정 */
tr:nth-child(even) {
  background-color: #f9f9f9;
}

/* 링크 스타일 */
a {
  text-decoration: none;
  color: #007bff;
}

a:hover {
  text-decoration: underline;
  color: #0056b3;
}
</style>
</head>
<body>
	<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<h2 style="text-align:center;">메인보드</h2>
	<hr>
	<h3><b>현재 예약 현황 >> </b></h3>
	<h4>오늘 체크인 하시는 손님</h4>
	<div style="margin-left:20px;">
	<div><a href="/Semi_F_GDCC/admin/rsvHotelList.jsp">전체 예약 확인 >> </a></div>
	<br>
	<%
	if(list.size() == 0){
	%>
			<div>오늘 체크인 하시는 손님이 없습니다. </div>
	<% 
	}else{
	%>
	<table border="1">
		<tr>
			<th>예약번호 </th>
			<th>예약자</th>
			<th>예약 룸</th>
			<th>체크아웃 날짜</th>
		
		</tr>
		<tr>
		<%
			for(HashMap m :list){
		%>
			<td><%=(Integer)m.get("rsvNo") %></td>
			<td><%=(String)m.get("rsvName") %></td>
			<td><%=(String)m.get("rsvGrade") %></td>
			<td><%=(String)m.get("checkoutDate") %></td>
			</tr>
		<% 
	
			}
		
			
		%>
	
	<% 
	}
	
	%>
			

	
	</table>
	</div>
	<br>
	<h4>오늘 체크아웃 하시는 손님</h4>
	<div style="margin-left:20px;">
	<div><a href="/Semi_F_GDCC/admin/rsvHotelList.jsp">전체 예약 확인 >> </a></div>
	<br>
	<%
	if(list2.size() == 0){
		%>
			<div>오늘 체크아웃 하시는 손님이 없습니다. </div>
		<% 
	}else{
	%>
	<table border="1">
		<tr>
			<th>예약번호 </th>
			<th>예약자</th>
			<th>예약 룸</th>
			<th>체크인 날짜</th>
		
		</tr>
		<tr>
		<%
			for(HashMap m :list2){
		%>
			<td><%=(Integer)m.get("rsvNo") %></td>
			<td><%=(String)m.get("rsvName") %></td>
			<td><%=(String)m.get("rsvGrade") %></td>
			<td><%=(String)m.get("checkinDate") %></td>
			</tr>
		<% 
	
			}
		
			
		%>
	
	<% 
	}
	
	%>
			

	
	</table>
	</div>
	
	
	
	</div>
	
	
	
	
	


	
	
	
</body>
</html>