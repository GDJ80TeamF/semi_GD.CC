<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 메인페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
	HashMap<String,Object> loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
	String adminMail = (String)loginAdmin.get("adminMail");
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
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<-- qnaNo deleteQnAForm.jsp param ");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
/* 입력 필드 스타일 */
input[type=text],input[type=password] {
  width: 20%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
</style>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
<div class="text-center">
<h3>정말 삭제하시겠습니까?</h3>
<h4>패스워드를 입력하세요</h4>
<form method="post" action="/Semi_F_GDCC/admin/action/deleteCkQnAAction.jsp">
	<div>아이디 <input type="text" name="checkId" value="<%=adminMail%>" readonly>
	
	<input type="hidden" name="qnaNo" value="<%=qnaNo%>">
	</div>
	<div>비밀번호 <input type="password" name="checkPw">
	<br>
	<button type="submit" class="btn btn-primary">입력</button>

	</div>
</form>	
	<div>
		<h1><%=msg%></h1>
	</div>
	<div>
		 <%
			if(ck.equals("T")) {
		 %>
				<a href="/Semi_F_GDCC/admin/action/deleteQnAAction.jsp?qnaNo=<%=qnaNo%>">삭제</a>
		 <%
			} 
		 %>
	</div>	
</div>
</div>
</body>
</html>