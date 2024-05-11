<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.util.*" %>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
	
	
	
	String adminMail = request.getParameter("adminMail");
	System.out.println(adminMail);
	//사원 개인정보 DAO
	HashMap<String,Object> m = AdminDAO.selectMyPage(adminMail);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 수정</title>
</head>
<body>
	<form method="post" action="/Semi_F_GDCC/admin/action/updateMyPageAction.jsp" enctype="multipart/form-data">
		<table>
		
		<tr>
			<td>아이디(메일)</td>
			<td><input name="adminMail" value="<%=(String)m.get("adminMail") %>" readonly></td>
		</tr>
		<tr>
			<td>사원 이름</td>
			<td><input name="adminName" value="<%=(String)m.get("adminName") %>"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<%
					if(((String)m.get("adminGender")).equals("남")){
				%>
				
				<input type="radio" name="adminGender" value="남" id="남" checked>
				<label for="남">남</label>
				<input type="radio" name="adminGender" value="여" id="여">
				<label for="여">여</label>
				
				
				
				<%	
					}else{
				%>
				<input type="radio" name="adminGender" value="남" id="남">
				<label for="남">남</label>
				<input type="radio" name="adminGender" value="여" id="여" checked>
				<label for="여">여</label>
				
				
				
				<% 
					}
				%>
			
			</td>
		</tr>
		<tr>
			<td>사원 생년월일</td>
			<td><input name="adminBirth" value="<%=(String)m.get("adminBirth") %>" readonly></td>
		</tr>
		<tr>
			<td>사원 연락처</td>
			<td><input name="adminContact" value="<%=(String)m.get("adminContact") %>"></td>
		</tr>
		<tr>
			<td>사원 프로필 사진</td>
			<td>
			<input name="adminProfile" type="file" required>
			</td>
		</tr>
		
	
	
	</table>
	
		<button type="submit">수정하기! </button>
	</form>
	<a href="/Semi_F_GDCC/admin/myPage.jsp?adminMail=<%=adminMail%>">취소 </a>
</body>
</html>