<%@page import="gdcc.dao.ComplexDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
	// 로그린
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
</head>
<body>
	정말 삭제하시겠습니까? 삭제하려면 아이디와 비번을 비교해야 됩니다.<br>
	<form method="post" action="/Semi_F_GDCC/admin/action/deleteCkComplexAction.jsp">
		아이디: <input type="text" name="checkId" value="<%=(String)(loginAdmin.get("adminMail"))%>"> <br>
		비밀번호: <input type="password" name="checkPw">
		<input type="text" name="complexNo" value=<%=complexNo%> style="display:none;">
		<button type="submit">비교</button>
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
</body>
</html>