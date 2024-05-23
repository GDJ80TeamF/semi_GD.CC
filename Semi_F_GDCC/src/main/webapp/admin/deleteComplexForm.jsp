<%@page import="gdcc.dao.ComplexDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
	// 로그인 
	HashMap<String,Object> loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
%>  
<%
	// 아이디 비밀번호 체크하고 삭제
	String checkId = request.getParameter("checkId");
	if(checkId == null){
		checkId = "no";
	}
	System.out.println("checkId: " + checkId);
	String ck = request.getParameter("ck");
	if(ck == null){
		ck = "no";
	}
	System.out.println("ck: " + ck);
	String msg = "";
	if(ck.equals("true")){
		msg = "삭제 할수 있는 비밀번호입니다.";
	}else if(ck.equals("false")){
		msg = "아이디와 비밀번호를 다시 확인해주세요.";
	}
	System.out.println("checkId: " + checkId);
	int complexNo = Integer.parseInt(request.getParameter("complexNo"));
	System.out.println("complexNo: " + complexNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>complex 삭제 폼</title>
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
	정말 삭제하시겠습니까? 삭제하려면 아이디와 비번을 확인해야 됩니다.<br>
	<form method="post" action="/Semi_F_GDCC/admin/action/deleteCkComplexAction.jsp">
		아이디: <input type="text" name="checkId" value="<%=(String)(loginAdmin.get("adminMail"))%>"> 
		<br>
		비밀번호: <input type="password" name="checkPw">
		<input type="text" name="complexNo" value=<%=complexNo%> style="display:none;">
		<br>
		<div class="text-center">
		<button type="submit" class="btn btn-primary">확인</button></div>
	</form>
	<%
		if(ck.equals("true")){
	%>
		<%=msg%>
		<form method="post" action="/Semi_F_GDCC/admin/action/deleteComplexAction.jsp?complexNo=<%=complexNo%>">
			<button type="submit">삭제</button>
		</form>
	<%
		}else{
	%>
		<%=msg%>
	<%
		}
	%>
	</div>
	</div>
</body>
</html>