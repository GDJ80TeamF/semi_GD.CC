<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 메인페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
	
	HashMap<String,Object>  loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>로그인 성공 </div>
	<div><a href="/Semi_F_GDCC/admin/action/adminLogoutAction.jsp">로그아웃</a></div>
	<div><a href="/Semi_F_GDCC/admin/insertNoticeForm.jsp?adminNo=<%=(Integer)loginAdmin.get("adminNo")%>">공지 폼 </a></div>

</body>
</html>