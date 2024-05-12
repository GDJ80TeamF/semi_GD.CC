<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") != null){
		response.sendRedirect("/Semi_F_GDCC/customer/main.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
		<div class="col"></div>
		<div class="mt-5 col-7 bg-white border shadow-sm p-3 mb-5 bg-body-tertiary rounded">
				<form method="post" action="/Semi_F_GDCC/customer/action/customerLoginAction.jsp">
				  <div class="mb-3 mt-3">
				    <label for="email" class="form-label">Email:</label>
				    <input type="text" class="form-control" placeholder="Enter email" name="cusMail">
				  </div>
				  <div class="mb-3">
				    <label for="pwd" class="form-label">Password:</label>
				    <input type="password" class="form-control" placeholder="Enter password" name="cusPw">
				  </div>
				  <button type="submit" class="btn btn-primary">로그인</button>
				</form>
			<a href="/Semi_F_GDCC/customer/findIdForm.jsp">
				ID찾기
			</a>
			<a href="/Semi_F_GDCC/customer/findPwForm.jsp">
				비밀번호 찾기
			</a>
		</div>
		<div class="col"></div>
	</div>
</div>
</body>
</html>