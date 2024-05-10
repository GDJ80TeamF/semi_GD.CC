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
</head>
<body>
	<h1>골프예약하기</h1>
		원하는 코스를 선택해주세요!
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
		<!-- <form method="post" action="/Semi_F_GDCC/customer/action/insertNewRsvAction.jsp"> -->
			<%
				if(courseName == null){//코스 선택 안한경우
					
			%>
				<%
					}else if(courseName.equals("IN")){//선택한 코스가 IN코스인 경우	
				%>
					<!-- 중복확인하는 부분 -->
					<div class="checkRsv">
						<form method="post" action="/Semi_F_GDCC/customer/action/checkDateCourseAction.jsp">
							<label for="date">
								라운딩 날짜
							</label>
							<input type="date" id="date" name="rsvDateCheck">
						<br>
							<label for="course">
								시작코스
							</label>
							<input type="radio" id="course" name="rsvCourseCheck" value="IN" checked="checked"> IN코스
						<br>
							<button type="submit">T-TIME확인하기</button>
						</form>
					</div>
				<%
					}else{//선택한 코스가 OUT코스인 경우
						
				%>
					<div class="checkRsv">
						<!-- 중복확인하는 부분 -->
					<div class="checkRsv">
						<form method="post" action="/Semi_F_GDCC/customer/action/checkDateCourseAction.jsp">
								<label for="date">
									라운딩 날짜
								</label>
								<input type="date" id="date" name="rsvDateCheck">
							<br>
								<label for="course">
									시작코스
								</label>
								<input type="radio" id="course" name="rsvCourseCheck" value="OUT" checked="checked"> OUT코스
							<br>
								<button type="submit">예약하기</button>
							</form>
						</div>
					<%
						}
					%>
						<div class="checkRsv">
							<form method="post" action="/Semi_F_GDCC/customer/action/insertNewRsvAction.jsp">
								<%
									if(checkSession != null && checkSession.equals("T")){
										//checkSession이 null이라는 것은 date랑 course를 체크했다는 것! 
								%>
										<label for="date">
								                라운딩 날짜
									        </label>
								            <input type="date" id="date" name="rsvDate" value="<%= checkDate%>">
							          <br>
								            <label for="course">
								                시작코스
								            </label>
								            <input type="radio" id="course" name="rsvCourse" value="<%= checkCourse %>" checked="checked">
								            	<%=checkCourse %>코스
								      <br>
								      		<label>
								      			T-TIME체크하기
								      		</label>
								      <br>
								         <% 
								         	HashSet<Integer> set = new HashSet<Integer>();
								            set.add(1);
						            		set.add(2);
						            		set.add(3);
						            		set.add(4);
						            		set.add(5);
						            		set.add(6);
						            		set.add(7);
						            		set.add(8);
						            		set.add(9);
		
								         
								         
								         	for (HashMap<String,Object> m : tableRsvTime) { 
								         		
								         		set.remove(Integer.parseInt((String)(m.get("rsvTtime"))));
			
								        	}
								         	
								         	
								         	for(Integer i : set) {
								        %>
								        		<input type="radio" name="rsvTtime" value="<%=i%>">
											        <%	
											        	switch (i) {
														    case 1:
														        out.print("11:00");
														        break;
														    case 2:
														        out.print("11:15");
														        break;
														    case 3:
														        out.print("11:30");
														        break;
														    case 4 :
														    	out.print("11:45");
														    	break;
														    case 5 :
														    	out.print("12:00");
														    	break;
														    case 6 :
														    	out.print("12:15");
														    	break;
														    case 7 :
														    	out.print("12:30");
														    	break;
														    case 8 :
														    	out.print("12:45");
														    	break;
														    case 9 :
														    	out.print("13:00");
														    	break;
													    	
														}
								     				%>
								        <% 		
								         	}
								        %>
							        <br>
								        <label for="mail">
								       	 	고객 mail
								        </label>
								        <input type="text" id = "mail" name="rsvMail" value="<%=cusMail%>">
							        <br>
								        <label for = "member">
								        	동반인원
								        </label>
								        <select id = "member" name ="rsvMember">
								        	<option value="3">3명</option>
								        	<option value="4">4명</option>
								        	<option value="5">5명</option>
								        </select>
							        <br>
								        <label for="request">
								     		요청사항
								        </label>
								        <textarea rows="3" cols="20"></textarea>
									<br>
									<button type="submit">예약하기</button>
								<%
									}
								%>
							
						</form>		
					</div>
</body>
</html>