<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%

//1.세션에서 고객 mail,pw가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 

	 String cusMail = (String)(login.get("cusMail"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePw</title>
</head>
<body>
	<h1>비밀번호 변경</h1>
		<form method ="post" action="/Semi_F_GDCC/customer/action/updatePwAction.jsp">
			<label>
				고객 email 입력
			</label>
				<input type="text" name="mail" value="<%=cusMail%>">
		<br>
			<label>	
				현재 비밀번호 입력
			</label>
				<input type="password" name="oldPw">
		<br>
			<label>
				변경할 비밀번호 입력
			</label>
				<input type="password" name="newPw">
				
			<button type="submit"> 변경하기 </button>
		</form>
</body>
</html>