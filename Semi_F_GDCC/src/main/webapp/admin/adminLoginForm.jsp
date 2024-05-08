<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	if(session.getAttribute("loginAdmin") != null){
		response.sendRedirect("/Semi_F_GDCC/admin/mainBoard.jsp");
		return;
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/Semi_F_GDCC/admin/action/adminLoginAction.jsp">
		아이디: <input type="text" name="adminMail">
		비밀번호 : <input type="text" name="adminPw">
		<button type="submit">로그인하기 </button>
</form>
</body>
</html>