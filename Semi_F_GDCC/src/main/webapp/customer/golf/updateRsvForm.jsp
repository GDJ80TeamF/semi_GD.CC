<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import="java.util.*" %>
<%

	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	//세션에서 메일 가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 

	 String rsvMail = (String)(login.get("cusMail"));
	 	System.out.println(rsvMail + "updateRsvForm.rsvMail");
	 	
	 	
	//예약번호 불러오기
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
		System.out.println(rsvNo + "<==updateRsvForm.rsvNo");
		
	//예약번호에 맞춰서 가져오기
	HashMap<String,Object>updateRsv = RsvGolfDAO.selectRsvOne(rsvNo);
		System.out.println(updateRsv + "<==updateRsvForm.updateRsv");
		
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
<title>Insert title here</title>
</head>
<body>
	<h1>예약변경요청하기</h1>
		<%
			if(checkSession == null){
		%>
				<form method="post" action="/Semi_F_GDCC/customer/action/checkUpdateAction.jsp">
				<input type="hidden" name="rsvNo" value="<%=rsvNo%>">
				<label for="date">
					예약 날짜
				</label>
				<input type ="date" id="date" name="rsvDateCheck" value="<%=updateRsv.get("rsvDate")%>">
			<br>
				<label for="course">
					시작 Course
				</label>
			<br>
					<%
						if(updateRsv.get("rsvCourse").equals("IN")){//선택했던 코스가 IN코스였던 경우
					%>
						<input type="radio" id ="course" name="rsvCourseCheck" value="IN" checked="checked">IN코스
						<input type="radio" id ="course" name="rsvCourseCheck" value="OUT" >OUT코스
					<%							
						}else{//선택했던 코스가 OUT코스인 경우
					%>
						<input type="radio" id ="course" name="rsvCourseCheck" value="IN">IN코스
						<input type="radio" id ="course" name="rsvCourseCheck" value="OUT" checked="checked">OUT코스
					<%
						}
					%>
				<button type="submit">T-TIME확인하기</button>
			</form>
		<%
			}
		%>
			<br>
			<!-- 여기서 부터 다시 action페이지로 넘길 값을 넣어줘야함 위의 코스랑, 날짜는 숨겨서 -->
			<form method="post" action="/Semi_F_GDCC/customer/action/updateRsvAction.jsp">
				<%
					if(checkSession != null && checkSession.equals("T")){
				%>
						<input type="hidden" name="rsvNo" value="<%=rsvNo%>">
						<input type="hidden" name="rsvMail" value="<%=rsvMail%>">
						
						<label for="date">
							예약 날짜
						</label>
						<input type ="date" id="date" name="rsvDate" value="<%=checkDate%>">
					<br>
						<label for="course">
							시작 Course
						</label>
					<br>
							<%
								if(checkCourse.equals("IN")){//선택했던 코스가 IN코스였던 경우
							%>
								<input type="radio" id ="course" name="rsvCourse" value="IN" checked="checked">IN코스
								<input type="radio" id ="course" name="rsvCourse" value="OUT" >OUT코스
							<%							
								}else{//선택했던 코스가 OUT코스인 경우
							%>
								<input type="radio" id ="course" name="rsvCourse" value="IN">IN코스
								<input type="radio" id ="course" name="rsvCourse" value="OUT" checked="checked">OUT코스
							<%
								}
							%>
					<br>
						<label>
							T-TIME선택
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
						<label>
							동반인원
						</label>
						<select name="rsvMember" value="<%=updateRsv.get("member")%>">
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					<br>
						<label>
							요청사항
						</label>
					<br>
						<textarea rows="3" cols="20" name="rsvRequest"></textarea>
					<button type="submit">변경요청</button>
					<%
						}
					%>
				</form>
				

		
		
<!-- String course
String date
int member
String request
String Ttime
 -->
</body>
</html>