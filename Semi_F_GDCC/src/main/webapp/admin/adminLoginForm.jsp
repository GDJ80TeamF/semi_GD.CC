<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션이null이 아니라면 로그인이 이미 되어있으므로 바로 메인 페이지로 이동한다.
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
<h2>로그인 폼 </h2>
<form method="post" action="/Semi_F_GDCC/admin/action/adminLoginAction.jsp">
		아이디: <input type="text" name="adminMail">
		비밀번호 : <input type="password" name="adminPw">
		<button type="submit">로그인하기 </button>
</form>
<div><a href="/Semi_F_GDCC/admin/adminResetPwForm.jsp">비밀번호 찾기</a></div>
<div><a href="/Semi_F_GDCC/admin/insertAdminForm.jsp">회원가입 </a></div>
</body>
</html>