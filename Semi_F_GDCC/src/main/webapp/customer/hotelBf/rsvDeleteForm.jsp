<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%

	String checkId = request.getParameter("checkId");
	if(checkId == null) {
		checkId = "";
	}
	String ck = request.getParameter("ck");
	if(ck == null) {
		ck = "";
	}
	
	String msg = "";
	if(ck.equals("T")) {
		msg = "인증 되셨습니다";
	} else if(ck.equals("F")) {
		msg = "아이디 또는 비밀번호를 확인하세요";
	}
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<-- rsvNo rsvDeleteForm.jsp param ");
	
	int rsvBfno = Integer.parseInt(request.getParameter("rsvBfno"));
	System.out.println(rsvBfno + "<-- rsvBfno rsvDeleteForm.jsp param ");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<h1>정말 취소하시겠습니까?</h1>
<h3>아이디와 패스워드를 입력하세요</h3>
<form method="post" action="/Semi_F_GDCC/customer/hotelBf/action/rsvDeleteCkAction.jsp">
	<div>ID :<input type="text" name="checkId">
					<input type="hidden" name="rsvNo" value="<%=rsvNo%>">
					<input type="hidden" name="rsvBfno" value="<%=rsvBfno%>">
	</div>
	<div>PW :<input type="password" name="checkPw">
					<button type="submit">입력</button>

	</div>
</form>	
	<div>
		<h1><%=msg%></h1>
	</div>
	<div>
		 <%
			if(ck.equals("T")) {
		 %>
			<a href="/Semi_F_GDCC/customer/hotelBf/action/rsvDeleteAction.jsp?rsvNo=<%=rsvNo%>&
						rsvBfno=<%=rsvBfno%>">취소</a>
		 <%
			} 
		 %>
	</div>	
</div>
</body>
</html>