<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 이 페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
	
	String adminMail = request.getParameter("adminMail");
	System.out.println(adminMail);
	
	//에러메세지 출력
	String error = request.getParameter("error");
	if(error == null){
		error = " ";
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<form method="post" action="/Semi_F_GDCC/admin/action/updatePwAction.jsp">
		<table>
			<tr>
				<td>아이디: </td>
				<td><input type="text"  name="adminMail" readonly value="<%=adminMail%>"></td>
			</tr>
			<tr>
				<td>현재 비밀번호 : </td>
				<td><input type="password"  name="oldPw"></td>
			</tr>
			<tr>
				<td>새 비밀번호 : </td>
				<td><input type="password"  name="newPw"></td>
			</tr>
		</table>
		<button type="submit">비밀번호 변경하기</button>
	</form>
	<%
		if(!error.equals(" ")){
	%>
		<div><%=error%></div>
	
	<% 
		}
	
	%>
	</div>
</body>
</html>