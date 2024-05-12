<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%

	//form에서 입력한 아이디 비번 값 가져오기
	String adminMail = request.getParameter("adminMail");
	String adminPw = request.getParameter("adminPw");
	//디버깅 
	System.out.println(adminMail);
	System.out.println(adminPw);
	
	HashMap<String,Object> loginAdmin = AdminDAO.selectAdminLogin(adminMail, adminPw);
	if(loginAdmin == null){
		System.out.println("로그인 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
	}else{
		System.out.println("로그인 성공 ");
		session.setAttribute("loginAdmin",loginAdmin);
		response.sendRedirect("/Semi_F_GDCC/admin/mainBoard.jsp");
	}



%>