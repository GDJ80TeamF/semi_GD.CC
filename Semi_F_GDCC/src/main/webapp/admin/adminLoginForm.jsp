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
<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: "Gowun Dodum", sans-serif;
  	font-weight: 400;
  	font-style: normal;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: linear-gradient(135deg, #00f260 0%, #0575e6 100%);
}

.login-container {
    background-color: #fff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    width: 100%;
    text-align: center;
}

h2 {
    margin-bottom: 20px;
    color: #333;
}

.input-group {
    margin-bottom: 20px;
    text-align: left;
}

.input-group label {
    display: block;
    margin-bottom: 5px;
    color: #333;
}

.input-group input {
    width: calc(100% - 20px);
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #5cb85c;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

button:hover {
    background-color: #4cae4c;
}

.links {
    margin-top: 20px;
}

.links a {
    display: block;
    color: #007bff;
    text-decoration: none;
    margin-bottom: 10px;
}

.links a:hover {
    text-decoration: none;
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300&display=swap" rel="stylesheet">
</head>
<body>
<div class="login-container">
	<img src="/Semi_F_GDCC/css/img/logoadmin2.png" width="150" height="100">
    <h2>LOGIN</h2>
    <form method="post" action="/Semi_F_GDCC/admin/action/adminLoginAction.jsp">
        <div class="input-group">
            <label for="adminMail">아이디:</label>
            <input type="text" id="adminMail" name="adminMail" required>
        </div>
        <div class="input-group">
            <label for="adminPw">비밀번호:</label>
            <input type="password" id="adminPw" name="adminPw" required>
        </div>
        <button type="submit">로그인하기</button>
    </form>
    <div class="links">
        <a href="/Semi_F_GDCC/admin/adminResetPwForm.jsp">비밀번호 찾기</a>
        <a href="/Semi_F_GDCC/admin/insertAdminForm.jsp">회원가입</a>
    </div>
</div>
</body>
</html>