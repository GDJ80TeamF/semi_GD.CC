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
</head>
<body>
<%
	if(ck.equals("")||ck.equals("T")){
%>

<!--  아이디 중복 체크 폼 -->
<form method="post" action="/Semi_F_GDCC/admin/action/insertCheckIdAction.jsp">
	

	<div>아이디(메일):</div>
	<div><input type="email" name="checkId" required></div>
	<button type="submit">아이디 중복 확인 </button>

</form>
<div><%=msg%></div>


<%
	}else if(ck.equals("F")){
%>

<form method="post" action="/Semi_F_GDCC/admin/action/insertAdminAction.jsp" enctype="multipart/form-data">
<table>
	<tr>
	<td>아이디(메일 )</td>
	<td><input type="email" name="adminMail" value="<%=checkId%>" readonly required></td>
	</tr>
	<tr>
	<td>비밀번호 </td>
	<td><input type="password" name="adminPw" required></td>
	</tr>
	<tr>
	<td>이름 </td>
	<td><input type="text" name="adminName" required></td>
	</tr>
	<tr>
	<td>성별 </td>
	<td>
	<input type="radio" name="adminGender" value="남" id="남" required>
	<label for="남">남</label>
	<input type="radio" name="adminGender" value="여" id="여" required>
	<label for="여">여</label>
	</td>
	</tr>
	<tr>
	<td>생년월일 </td>
	<td><input type="date" name="adminBirth" required></td>
	</tr>
	<tr>
	<td>연락처 </td>
	<td><input type="text" name="adminContact" required></td>
	</tr>
	<tr>
	<td>프로필 사진 </td>
	<td><input type="file" name="adminProfile"></td>
	</tr>
		
	
	
</table>
	<button type="submit">가입하기! </button>
</form>



<%
	}




%> 


</body>
</html>