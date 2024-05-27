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
<title>메인보드 </title>

<link rel="stylesheet" href="./style.css">

<style>
/* 기본 페이지 스타일 */
body {
	font-family: "Gowun Dodum", sans-serif;
  font-weight: 400;
  font-style: normal;
  background-color: #f8f9fa;
  margin: 0;
  padding: 0;
}

/* 메인 컨테이너 스타일 */
.main-container {
  margin: 0 auto;
  padding: 20px;
  background-color: #ffffff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
  width: 90%;
}

/* 헤더 스타일 */
h2 {
  text-align: center;
  color: #2c3e50;
  font-weight: bold;
}

h3{
  margin-left: 20px;
  color: #34495e;
  background: #FDFD96;
  padding:10px;
  border-radius:10px;
  border:1px solid black;
  
}
h4,h5{
	margin-left: 20px;
	color: #34495e;

}


/* 테이블 스타일 */
table {
  width: 80%;
  border-collapse: collapse;
  margin: 0 auto;
  margin-bottom: 20px;
}

.tableNotice {
  width: 90%;
  border-collapse: collapse;
  margin: 0 auto;
}

th {
  background-color: #ff7675;
  color: #ffffff;
  font-weight: bold;
  padding: 12px;
  text-align: left;
  border-bottom: 2px solid #fab1a0;
}

td {
  padding: 10px;
  border-bottom: 1px solid #fab1a0;
}



tr:hover {
  background-color: #ffeaa7;
}

/* 링크 스타일 */
a {
  text-decoration: none;
  color: #00cec9;
}

a:hover {
  text-decoration: underline;
  color: #0984e3;
}

.title {
  text-decoration: none;
  color: #2d3436;
}

.title:hover {
  text-decoration: none;
  color: #0984e3;
}

/* 날씨 섹션 스타일 */
.weather {
  margin-top: 5px;
  text-align: left;
  padding-left: 10px;
}

.SeoulIcon {
  vertical-align: middle;
}

.SeoulNowtemp, .SeoulLowtemp, .SeoulWindSpeed {
  font-family: "Gowun Dodum", sans-serif;
  font-weight: 400;
  font-style: normal;
  font-size: 20px;
  color: #2d3436;
  margin-right: 10px;
}

.weather span {
  display: inline-block;
  margin-right: 15px;
}

/* 추가 스타일링 */
hr {
  border: 0;
  height: 1px;
  background: #ff7675;
  margin: 20px 0;
}

.button-link {
  display: inline-block;
  padding: 10px 15px;
  background-color: #00cec9;
  color: #fff;
  border-radius: 5px;
  text-align: center;
  margin-bottom: 20px;
}

.button-link:hover {
  background-color: #0984e3;
}

/* 플로팅 스타일 */
.float-left {
  float: left;
  width: 50%;
}

.float-right {
  float: right;
  width: 50%;
}

.clearfix::after {
  content: "";
  display: table;
  clear: both;
}
</style>

</head>
<body>
	<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<h2 style="text-align:center;">MAIN</h2>
	<hr>
	<!-- 날씨 api -->
	<h4><b>골프 필드 현재 날씨 >> </b></h4>
	
	<div class="weather">
		 <!-- 아이콘 -->
		<span class="SeoulIcon"></span>&nbsp;
		<!-- 현재기온 -->
		<span class="SeoulNowtemp"></span>&nbsp;
		<!-- 풍속 -->
		<span class="SeoulWindSpeed"></span>&nbsp;
		<!-- 최저기온 -->
		<span class="SeoulLowtemp"></span>
	</div>
	<div>
	<div style="float:left;width:50%;">
	<h3><b>예약 현황 >> </b></h3>
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