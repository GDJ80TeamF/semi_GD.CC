<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%
	//인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	//세션 가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 

	 String cusMail = (String)(login.get("cusMail"));
	 	System.out.println(cusMail + "rsvGolfList.cusMail");

	//golf_course테이블에서 코스 정보 가져옴/디버깅확인
	ArrayList<HashMap<String,Object>> golfCourse = RsvGolfDAO.courseList();
		System.out.println(golfCourse + "<==insertNewRsvForm.golfCourse");
		
		
	String courseName = request.getParameter("courseName");
		System.out.println(courseName + "<==insertNewRsvForm.courseName");
	
	//날짜와 코스를 체크하고 그 날짜&코스의 T-TIME가져오기
	String checkSession = request.getParameter("checkSession");
		System.out.println(checkSession + "checkSession");
	
	String checkDate = request.getParameter("checkDate");
	String checkCourse = request.getParameter("checkCourse");
		System.out.println(checkDate + "<==checkDateCourse.checkDate");
		System.out.println(checkCourse + "<==checkDateCourse.checkCourse");
		
	 ArrayList<HashMap<String,Object>> tableRsvTime = (ArrayList<HashMap<String,Object>>) session.getAttribute("tableRsvTime");
		System.out.println(tableRsvTime + "<===tableRsvTime예약된 시간 담겨져있음");			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프 예약하기</title>
<style>

	#calendar {
	  width: 400px; /* 부모 요소인 .container에 맞게 캘린더의 너비를 조절합니다. */
	  height: 400px; /* 원하는 높이로 조절합니다. */
	}
	::-webkit-scrollbar {
	    display: none; /* Safari 및 Chrome 등 Webkit 기반 브라우저 */
	}
</style>
</head>
	<!-- 캘린더 API가져오기 -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
	<script>

	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	        initialView: 'dayGridMonth',
	        selectable: true,
	        dateClick: function(info) {
	            // 캘린더에서 날짜를 클릭했을 때 해당 날짜를 선택한 날짜 input 요소에 자동으로 설정
	            document.getElementById('date').value = info.dateStr;
	            console.log("Clicked event occurs : date =" + info.dateStr);
	        }
	    });
	    calendar.render();
	});


    </script>
<body>
	<h1>골프예약하기</h1>
		원하시는 날을 선택해주세요

	<div class="container">
	  <div id='calendar'> </div>
	</div>
		<div class="checkRsv">
		
			<form method="post" action="/Semi_F_GDCC/customer/golf/testAction.jsp">
				<label for="date">
					라운딩 날짜
				</label>
				<input type="date" id="date" name="rsvDateCheck">
			<br>
				<label for="course">
					시작코스
				</label>
				<input type="radio" id="course" name="rsvCourseCheck" value="IN"> IN코스
				<input type="radio" id="course" name="rsvCourseCheck" value="OUT"> OUT코스
			<br>
				<button type="submit">T-TIME확인하기</button>
			</form>
		</div>
</body>
</html>