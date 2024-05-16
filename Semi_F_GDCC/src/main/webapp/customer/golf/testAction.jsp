<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%
//값 가져오기
	String checkDate = request.getParameter("rsvDateCheck");
	String checkCourse = request.getParameter("rsvCourseCheck");
		System.out.println(checkDate + "<==테스트용 날짜");
		System.out.println(checkCourse + "<==테스트용 코스");
	
	//예약가능한 시간대 불러오기
	ArrayList<HashMap<String,Object>> tableRsvTime 	
		= RsvGolfDAO.selectRsvTtime(checkCourse, checkDate);
	
		System.out.println(tableRsvTime + "<==이미 예약된 time");
		
		// 세션에 저장
	    session.setAttribute("tableRsvTime", tableRsvTime);
		/* 
	response.sendRedirect("/Semi_F_GDCC/customer/golf/test.jsp?checkDate="+checkDate+"&checkCourse="+checkCourse+"&checkSession=T"); */

%>