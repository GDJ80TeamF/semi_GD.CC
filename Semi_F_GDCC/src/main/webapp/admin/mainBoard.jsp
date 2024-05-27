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
	ArrayList<HashMap<String,Object>> list3 = NoticeDAO.noticeListForMain();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./style.css">

<style>
h3,h5{
	margin-left:20px;
}
table {
  width: 80%;
  border-collapse: collapse;
  margin: 0 auto;
}
.tableNotice{
	width: 90%;
  border-collapse: collapse;
  margin: 0 auto;

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
.title{
	text-decoration:none;
	color:black;
}
.title:hover{
	text-decoration:none;
	color: #0056b3;
}
/*  현재날씨 추가 */
.weather{
		margin-top: 5px;
		text-align:center;
	}
	.SeoulNowtemp{
		font-family: "Dongle", sans-serif;
		font-size: 15px;
		color : black;
	}
	.SeoulLowtemp{
		font-family: "Dongle", sans-serif;
		font-size: 15px;
		color : black;
	}
	.SeoulWindSpeed{
		font-family: "Dongle", sans-serif;
		font-size: 15px;
		color : black;
	}
	
</style>

</head>
<body>
	<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<h2 style="text-align:center;">MAIN</h2>
	
	<!-- 날씨 api -->
	<div class="weather">
		 <!-- 아이콘 -->
		<h5 class="SeoulIcon"></h5>
		<!-- 현재기온 -->
		<h5 class="SeoulNowtemp"></h5>
		<!-- 풍속 -->
		<h5 class="SeoulWindSpeed"></h5>
		<!-- 최저기온 -->
		<h5 class="SeoulLowtemp"></h5>
	</div>
	<div>
	<div style="float:left;width:50%;">
	<h3><b>현재 예약 현황 >> </b></h3>
	<br>
	<h5>오늘 체크인 하시는 손님</h5>
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
	<h5>오늘 체크아웃 하시는 손님</h5>
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
	<div style="float:right;width:50%">
	<h3><b>현재 공지 >> </b></h3>
	
	<div>
	<br>
	<div style="margin-left:25px;"><a href="/Semi_F_GDCC/admin/noticeList.jsp">전체 공지 확인 >> </a></div>
	<br>
	<%
	if(list3.size() == 0){
	%>
			<div>작성된 공지가 없습니다.</div>
	<% 
	}else{
	%>
	<table class="tableNotice">
		<tr>
			<th>공지번호 </th>
			<th>게시자</th>
			<th>제목</th>
			
		
		</tr>
		<tr>
		<%
			for(HashMap m :list3){
		%>
			<td><%=(Integer)m.get("noticeNo") %></td>
			<td><%=(String)m.get("adminMail") %></td>
			<td>
			<a href="/Semi_F_GDCC/admin/noticeOne.jsp?noticeNo=<%=(Integer)m.get("noticeNo")%>" class="title"> 
			<%=(String)m.get("noticeTitle")%>
			</a>
			</td>
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
	</div>
	
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 날씨 api -->

<script>
		    $(document).ready(function(){
		        // 서울 날씨 정보 가져오기
		        $.getJSON("http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=e5c25df9f0f40f8923682bd43dfc75d2&units=metric", function(data){
		            var temperature = data.main.temp;
		            var minTemperature = data.main.temp_min;
		            var weatherIcon = data.weather[0].icon;
		            var windSpeed = data.wind.speed;
		
		         
		            $(".SeoulNowtemp").text("기온: " + temperature + "°C");
		            $(".SeoulLowtemp").text("최저 기온: " + minTemperature + "°C");
		            $(".SeoulWindSpeed").text("풍속: " + windSpeed + " m/s");
		            $(".SeoulIcon").html("<img src='http://openweathermap.org/img/w/" + weatherIcon + ".png'>");
		        });
		    });
</script>

	

</body>
</html>