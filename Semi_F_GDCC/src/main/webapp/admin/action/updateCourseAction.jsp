<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%
	String courseName = request.getParameter("courseName");
	//변경할 상태값 가져오기
	String courseState = request.getParameter("courseState");
		System.out.println(courseState + "<==updateCourseAction.courseState");
		
	//변경하기
	
	int updateState = CourseDAO.updateCourseState(courseState, courseName);
		System.out.println(updateState + "<==updateCourse.updateState");
		
		if(updateState == 1){
			//새로고침 성공!
			response.sendRedirect("/Semi_F_GDCC/admin/courseList.jsp?");
		}else{
			//새로고침 실패
			response.sendRedirect("/Semi_F_GDCC/admin/courseList.jsp?msg=F");
		}
%>