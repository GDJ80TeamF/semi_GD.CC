<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션이null이 아니라면 로그인이 이미 되어있으므로 바로 메인 페이지로 이동한다.
	if(session.getAttribute("loginAdmin") != null){
		response.sendRedirect("/Semi_F_GDCC/admin/mainBoard.jsp");
		return;
	}

	//에러메세지 출력
	String error = request.getParameter("error");
	if(error == null){
		error = " ";
	}


%>
 <%
 
 	String ck = request.getParameter("ck");
 	if(ck == null){
 		ck = "";
 	}
 	
 	String checkId = request.getParameter("checkId");
 	if(checkId == null){
 		checkId = "";
 	}
 	
 	
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원계정 비번 찾기 </title>
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

.form-container {
    background-color: #fff;
    padding: 40px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    width: 100%;
    text-align: center;
}

h2 {
    margin-bottom: 24px;
    color: #333;
    font-size: 24px;
}

.input-group {
    margin-bottom: 20px;
    text-align: left;
}

.input-group label {
    display: block;
    margin-bottom: 8px;
    color: #333;
    font-size: 14px;
}

.input-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
}

button {
    width: 100%;
    padding: 12px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #0056b3;
}

.error-message {
    color: red;
    margin-top: 20px;
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300&display=swap" rel="stylesheet">
</head>
<body>
    <div class="form-container">
        <%
            if(ck.equals("") || ck.equals("F")){
        %>
        <form method="post" action="/Semi_F_GDCC/admin/action/adminCheckAction.jsp">
            <div class="input-group">
                <label for="adminMail">아이디 메일:</label>
                <input type="email" id="adminMail" name="adminMail" required>
            </div>
            <div class="input-group">
                <label for="adminBirth">생년월일:</label>
                <input type="date" id="adminBirth" name="adminBirth" required>
            </div>
            <div class="input-group">
                <label for="adminContact">전화번호:</label>
                <input type="text" id="adminContact" name="adminContact" required>
            </div>
            <button type="submit">사원 인증하기</button>
        </form>
        <%
                if(ck.equals("F")){			
        %>
        <div class="error-message">정보가 입력되지 않았거나 해당하는 사원이 없습니다. 다시 한번 시도해 주세요.</div>
        <%
                }
        %>
        <%
            } else if(ck.equals("T")){
        %>
        <div>새로운 비밀번호를 입력해주세요.</div>
        <form method="post" action="/Semi_F_GDCC/admin/action/adminResetPwAction.jsp">
            <div class="input-group">
                <label for="checkedId">아이디:</label>
                <input type="text" id="checkedId" name="checkedId" value="<%=checkId%>" readonly>
            </div>
            <div class="input-group">
                <label for="newPw">비밀번호:</label>
                <input type="password" id="newPw" name="newPw" required>
            </div>
            <button type="submit">변경하기</button>
        </form>
        <%
                if(!error.equals(" ")){
        %>
        <div class="error-message"><%=error%></div>
        <%
                }
        %>
        <%
            }
        %>
    </div>
</body>

</html>