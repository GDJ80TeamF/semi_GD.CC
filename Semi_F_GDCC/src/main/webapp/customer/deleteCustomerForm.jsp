<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	//1.세션에서 고객 mail가져오기
	HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
	
	String cusMail = (String)(login.get("cusMail"));
		System.out.println(cusMail + "myPage.cusMail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴하기</title>
</head>
<body>
	<h1>회원탈퇴</h1>
		<form method="post" action="/Semi_F_GDCC/customer/action/deleteCustomerAction.jsp">
			<label for ="delete">
				회원탈퇴를 위해 비밀번호를 입력해주세요
			</label>
				<input type="password" id ="delete" name = "pw">
				<input type="hidden" name ="cusMail" value="<%=cusMail%>">
				<button type="submit">탈퇴</button>
		</form>
	
</body>
</html>