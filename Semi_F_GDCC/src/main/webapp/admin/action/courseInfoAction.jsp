<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%
	//코스 불러오기
	String courseName = request.getParameter("courseName");
		System.out.println(courseName + "<==courseInfoAction.courseName");
		
	//바뀐 내용가져오기
	String courseInfo = request.getParameter("courseInfo");
		System.out.println(courseInfo + "<==courseInfoAction.courseInfo");
		
	//내용 업데이트 해주기
	int update = CourseDAO.updateCourseInfo(courseInfo, courseName);
	
	
	if(update == 1){
		//성공
		response.sendRedirect("/Semi_F_GDCC/admin/courseOne.jsp");
	}else{
		response.sendRedirect("/Semi_F_GDCC/admin/courseInfoForm.jsp");
	}
%>