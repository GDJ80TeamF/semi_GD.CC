<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 메인페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
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
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	System.out.println(reviewNo + "<-- reviewNo deleteGolfReviewForm.jsp param ");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<h1>정말 삭제하시겠습니까?</h1>
<h3>아이디와 패스워드를 입력하세요</h3>
<form method="post" action="/Semi_F_GDCC/admin/action/deleteCkGolfReviewAction.jsp">
	<div>adminMail :<input type="text" name="checkId">
					<input type="hidden" name="reviewNo" value="<%=reviewNo%>">
	</div>
	<div>adminPw :<input type="password" name="checkPw">
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
				<a href="/Semi_F_GDCC/admin/action/deleteGolfReviewAction.jsp?reviewNo=<%=reviewNo%>">삭제</a>
		 <%
			} 
		 %>
	</div>	
</div>
</body>
</html>