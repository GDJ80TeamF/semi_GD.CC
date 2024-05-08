<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@page import="java.net.*"%>

<%
	// 인증 분기 세션 변수 이름 : loginEmp
	if(session.getAttribute("loginCustomer") != null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	/* 아이디 중복 체크 */
	String checkId = request.getParameter("checkId");
	
	if(checkId == null) {
		checkId = "";
	}
	String ck = request.getParameter("ck");
	System.out.println("ck: " + ck);
	if(ck == null) {
		ck = "";
	}
	String msg = "";
	if(ck.equals("T")){
		msg = "사용할수 있는 아이디 입니다.";
	} else if(ck.equals("F")){		
		msg = "사용할수 없는 아이디 입니다. 다른 아이디를 써주세요.";
	}
	System.out.println("checkId: " + checkId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객정보 추가</title>
</head>
<body>
	<h1>회원가입</h1>
	<form method="post" action="/Semi_F_GDCC/customer/action/customerCheckIdAction.jsp" enctype="multipart/form-data" >
		아이디:
		<input type="text" name="checkId" value=<%=checkId%>>
		<button type="submit">아이디 중복 체크</button>
		<br><span><%=msg%></span>
	</form>
		
		<form method="post" action="/Semi_F_GDCC/customer/action/insertCustomerAction.jsp">
			<div>
				<!-- T일때만 사용 가능 -->
				<%
					if(ck.equals("T")){
				%>
				<input type="text" name="cusMail" readonly="readonly" value="<%=checkId%>" style="display:none">
				<%
					}else if(ck.equals("F")){
				%>
				<input type="text" name="cusMail" readonly="readonly" style="display:none">
				<%
					}
				%>
			</div>
		<div>
			이름:
			<input type="text" name="cusName">
		</div>
		<div>
			비밀번호:
			<input type="text" name="cusPw">
		</div>
		<div>
			성별:
			<input type="text" name="cusGender">
		</div>
		<div>
			생년월일:
			<input type="date" name="cusBirth">
		</div>
		<div>
			전화번호:
			<input type="text" name="cusContact">
		</div>
		<div>
			프로필:
			<input type="file" name="cusProfile">
		</div>
		<div>
			<button type="submit">회원가입 완료</button>
		</div>
	</form>
</body>
</html>