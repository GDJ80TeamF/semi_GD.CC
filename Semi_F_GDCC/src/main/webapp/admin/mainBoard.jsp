<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 메인페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}

	
	HashMap<String,Object> loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
	String adminName = (String) loginAdmin.get("adminName");
	String adminMail = (String) loginAdmin.get("adminMail");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./style.css">
</head>
<body>
	<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<h2>@@페이지 </h2>
		안녕하세요 여기는 내용 올곳 
	
	
	
	</div>
	
	
	
	
	


	
	
	
</body>
</html>