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
	String adminMail = (String) loginAdmin.get("adminMail");
	System.out.println(rsvNo + "<-- rsvNo deleteGolfReviewForm.jsp param ");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{
	text-align:center;
}
/* 테이블 전체 스타일 */
table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  background-color: #ffffff;
  margin-bottom: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  text-align:center;
}


/* 테이블 셀 스타일 */
td {
  padding: 15px;
  text-align: left;
  border-bottom: 1px solid #f2f2f2;
}

/* 짝수 행 배경색 지정 */
tr:nth-child(even) {
  background-color: #f2f2f2;
}

/* 링크 스타일 */
a {
  color: #007bff;
  text-decoration: none;
}

a:hover {
  color: #0056b3;
  text-decoration: underline;
}

div button {
  display: inline-block; /* 블록 요소에서 인라인-블록 요소로 변경 */
  vertical-align: middle; /* 버튼을 select 요소와 수직 정렬 */
  margin-left: 5px; /* select 요소와 버튼 사이의 간격 조정 */
  padding: 10px 20px;
  text-align: center;
  border: none;
  background-color: #007bff;
  color: white;
  border-radius: 5px;
  margin-bottom:10px;
}

div button:hover {
  background-color: #0056b3;
}


/* 입력 필드 스타일 */
input, select {
  width: 40%;
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
<div>
<h1>정말 삭제하시겠습니까?</h1>
<h3>아이디와 패스워드를 입력하세요</h3>
<form method="post" action="/Semi_F_GDCC/admin/action/deleteCkGolfReviewAction.jsp">
<table>
	<tr>
		<td>아이디 :</td>
		<td><input type="text" name="checkId" value="<%=adminMail%>" readonly></td>
	</tr>
	<tr style="display:none">
		<td></td>
		<td><input type="text" name="rsvNo" value="<%=rsvNo%>"></td>
	</tr>
	<tr>
		<td>비밀번호: </td>
		<td><input type="password" name="checkPw"></td>
	</tr>
</table>
	<div style="text-align:center;">
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
		 <div style="text-align:center;">
				<a href="/Semi_F_GDCC/admin/action/deleteGolfReviewAction.jsp?rsvNo=<%=rsvNo%>">삭제</a>
		</div>	
		 <%
			} 
		 %>
	</div>	
</div>
</div>
</body>
</html>