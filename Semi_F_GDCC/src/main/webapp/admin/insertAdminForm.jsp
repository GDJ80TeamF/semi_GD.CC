<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//세션이null이 아니라면 로그인이 이미 되어있으므로 바로 메인 페이지로 이동한다.
	if(session.getAttribute("loginAdmin") != null){
		response.sendRedirect("/Semi_F_GDCC/admin/mainBoard.jsp");
		return;
	}


%>
<%

	String checkId = request.getParameter("checkId");
	System.out.println(checkId);
	if(checkId == null){
		checkId= "";
	}
	//insertCheckIdAction.jsp 에서 넘어온 ck 값 분기 
	String ck = request.getParameter("ck");
	if(ck == null){
		ck="";
	}
	
	String msg = null;
	if(ck.equals("T")){
		msg = "사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요. ";
	}else if(ck.equals("")){
		msg="중복 아이디 확인을 해주세요.";
	}


 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 가입 </title>
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
    min-height: 100vh;
   background: linear-gradient(135deg, #00f260 0%, #0575e6 100%);
}

.main-container {
    width: 100%;
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.form-container {
    background-color: #fff;
    padding: 40px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    margin: 0 auto;
    text-align: center;
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

.input-group input[type="email"],
.input-group input[type="password"],
.input-group input[type="text"],
.input-group input[type="date"],
.input-group input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
}

.radio-group {
    display: flex;
    align-items: center;
}

.radio-group input[type="radio"] {
    margin: 0 5px 0 0;
}

.radio-group label {
    margin-right: 15px;
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

.message, .error-message {
    margin-top: 20px;
    color: red;
}

hr {
    margin: 20px 0;
}
div a{
	text-decoration:none;

}
.back{
	text-align:center;
	color:blue;
}


</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300&display=swap" rel="stylesheet">
</head>
<body>
    <jsp:include page="/admin/sidebar.jsp"></jsp:include>
    <div class="main-container">
        <jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
        <hr>
        <%
            if(ck.equals("") || ck.equals("T")){
        %>
        <!--  아이디 중복 체크 폼 -->
        <form method="post" action="/Semi_F_GDCC/admin/action/insertCheckIdAction.jsp" class="form-container">
            <div class="input-group">
                <label for="checkId">아이디(메일):</label>
                <input type="email" id="checkId" name="checkId" required>
            </div>
            <button type="submit">아이디 중복 확인</button>
        </form>
        <div class="message"><%=msg%></div>
       	<div class="back"><a href="/Semi_F_GDCC/admin/adminLoginForm.jsp">돌아가기</a></div> 
        <%
            } else if(ck.equals("F")){
        %>
        <form method="post" action="/Semi_F_GDCC/admin/action/insertAdminAction.jsp" enctype="multipart/form-data" class="form-container">
            <div class="input-group">
                <label for="adminMail">아이디(메일):</label>
                <input type="email" id="adminMail" name="adminMail" value="<%=checkId%>" readonly required>
            </div>
            <div class="input-group">
                <label for="adminPw">비밀번호:</label>
                <input type="password" id="adminPw" name="adminPw" required>
            </div>
            <div class="input-group">
                <label for="adminName">이름:</label>
                <input type="text" id="adminName" name="adminName" required>
            </div>
            <div class="input-group">
                <label>성별:</label>
                <div class="radio-group">
                    <input type="radio" id="male" name="adminGender" value="남" required>
                    <label for="male">남</label>
                    <input type="radio" id="female" name="adminGender" value="여" required>
                    <label for="female">여</label>
                </div>
            </div>
            <div class="input-group">
                <label for="adminBirth">생년월일:</label>
                <input type="date" id="adminBirth" name="adminBirth" required>
            </div>
            <div class="input-group">
                <label for="adminContact">연락처:</label>
                <input type="text" id="adminContact" name="adminContact" required>
            </div>
            <div class="input-group">
                <label for="adminProfile">프로필 사진:</label>
                <input type="file" id="adminProfile" name="adminProfile" required>
            </div>
            <button type="submit">가입하기!</button>
        </form>
        <%
            }
        %> 
    </div>
</body>
</html>