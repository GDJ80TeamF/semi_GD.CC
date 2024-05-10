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
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프 예약하기</title>
</head>
<body>
	<h1>골프예약하기</h1>
		<div>
			<%
				for(HashMap<String,Object> m : golfCourse){
			%>
					<a href="/Semi_F_GDCC/customer/golf/insertNewRsvForm.jsp?courseName=<%=m.get("courseName")%>">
						<%=m.get("courseName") %>
					</a>
			<%
				}
			%>
		</div>
		<div>
			<!-- 달력 API 넣을 곳 -->
		</div>		
		<form method="post" action="/Semi_F_GDCC/customer/action/insertNewRsvAction.jsp">
			<%
				if(courseName == null){//코스 선택 안한경우
					
			%>
				코스를 선택하세요
				<%
					}else if(courseName.equals("IN")){//선택한 코스가 IN코스인 경우
						
				%>
					<div class="rsv">
								<label for="mail">
									e-mail
								</label>
								<input type="text" id="mail" name="rsvMail" value="<%=cusMail%>">
							<br>
								<label for="date">
									라운딩 날짜
								</label>
								<input type="date" id="date" name="rsvDate">
							<br>
								<label for="course">
									시작코스
								</label>
								<input type="radio" id="course" name="rsvCourse" value="IN"> IN코스
							<br>
								<label for="member">
									라운딩 인원
								</label>
								<select name="rsvMember">
									<option value="3">3명</option>
									<option value="4" selected>4명</option>
									<option value="5">5명</option>
								</select>
								<label>
									T-TIME
								</label>
								<select name="rsvTtime">
									<option value="1"> 11:00</option>
									<option value="2"> 11:15</option>
									<option value="3"> 11:30</option>
									<option value="4"> 11:45</option>
									<option value="5"> 12:00</option>
									<option value="6"> 12:15</option>
									<option value="7"> 12:30</option>
									<option value="8"> 12:45</option>
									<option value="9"> 13:00</option>
								</select>
							<br>
								<label for="request">
									요청사항
								</label>
									<textarea id="request" name="rsvRequest" rows="3" cols="40">
									</textarea>
							<button type="submit">예약하기</button>
						</div>
				<%
					}else{//선택한 코스가 OUT코스인 경우
						
				%>
					<div class="rsv">
								<label for="mail">
									e-mail
								</label>
								<input type="text" id="mail" name="rsvMail" value="<%=cusMail%>">
							<br>
								<label for="date">
									라운딩 날짜
								</label>
								<input type="date" id="date" name="rsvDate">
							<br>
								<label for="course">
									시작코스
								</label>
								<input type="radio" id="course" name="rsvCourse" value="OUT">OUT코스
							<br>
								<label for="member">
									라운딩 인원
								</label>
								<select name="rsvMember">
									<option value="3">3명</option>
									<option value="4" selected>4명</option>
									<option value="5">5명</option>
								</select>
								<label>
									T-TIME
								</label>
								<select name="rsvTtime">
									<option value="1"> 11:00</option>
									<option value="2"> 11:15</option>
									<option value="3"> 11:30</option>
									<option value="4"> 11:45</option>
									<option value="5"> 12:00</option>
									<option value="6"> 12:15</option>
									<option value="7"> 12:30</option>
									<option value="8"> 12:45</option>
									<option value="9"> 13:00</option>
								</select>
							<br>
								<label for="request">
									요청사항
								</label>
									<textarea id="request" name="rsvRequest" rows="3" cols="40">
									</textarea>
							<button type="submit">예약하기</button>
						</div>
				<%
					}
				%>
		</form>
</body>
</html>