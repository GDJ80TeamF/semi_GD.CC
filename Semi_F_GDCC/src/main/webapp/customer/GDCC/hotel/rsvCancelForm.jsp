<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%

	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
	HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
	
	String cusMail = (String)(login.get("cusMail"));
%>
<%
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println("rsvNo: "+ rsvNo);
%>
<%
	/* 아아디, 비밀번호 체크 */
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
		msg = "취소할 수 있는 비밀번호입니다.";
	} else if(ck.equals("F")){		
		msg = "취소할 수 없는 비밀번호 입니다. 확인 후 다시 입력해주세요.";
	}
	System.out.println("checkId: " + checkId);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 취소</title>
</head>
<body>
	<form method="post" action="/Semi_F_GDCC/customer/hotel/rsvCancelIdPwCk.jsp">	
		<div>예약을 취소하려면 쓰신 아이디와 비밀번호가 본인의 아이디와 비밀번호와 일치해야합니다.</div>
		아이디: <input type="text" name="checkId" value=<%=cusMail%>> <br>
		비밀번호: <input type="password" name="checkPw"> 
		<input type="text" name="rsvNo" value=<%=rsvNo%> style="display:none;">
		<button type="submit">비교하기</button>
	</form>
		<%
			if(ck.equals("T")){
		%>
			<%=msg%>
			<form method="post" action="/Semi_F_GDCC/customer/hotel/rsvCancelAction.jsp?rsvNo=<%=rsvNo%>">
				<button type="submit">취소하기</button>
			</form>
		<%
			}
		%>
	<a href="/Semi_F_GDCC/customer/hotel/cusRsvHotelOne.jsp?rsvNo=<%=rsvNo%>">취소</a>
</body>
</html>