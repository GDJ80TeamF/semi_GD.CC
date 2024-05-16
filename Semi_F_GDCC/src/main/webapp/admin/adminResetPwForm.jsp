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
</head>
<body>
<%
	if(ck.equals("")|| ck.equals("F")){
%>
	<form method="post" action="/Semi_F_GDCC/admin/action/adminCheckAction.jsp">
			아이디 메일: <input type="email" name="adminMail">
			생년월일 : <input type="date" name="adminBirth">
			전화번호: <input type="text" name="adminContact">
			
			<button type="submit">사원 인증하기 </button>
		</form>

<%
			}if(ck.equals("F")){			
	
%>
		<div>정보가 입력되지않았거나 해당하는 사원이 없습니다. 다시 한번 시도해 주세요.</div>


<%	
	
	}else if(ck.equals("T")){
		
		
%>
<div>새로운 비밀번호를 입력해주세요. </div>
<form method="post" action="/Semi_F_GDCC/admin/action/adminResetPwAction.jsp">
	아이디 : <input type="text" name="checkedId" value="<%=checkId%>" readonly>
	비밀번호 : <input type="password" name="newPw" required>

	<button type="submit">변경하기 </button>
</form>



<%
		if(!error.equals(" ")){
%>
	<div><%=error%></div>
<% 
		}
	}


%>
	

</body>
</html>