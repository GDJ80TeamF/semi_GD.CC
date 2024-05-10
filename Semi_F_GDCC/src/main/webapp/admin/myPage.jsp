<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.util.*" %>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 메인페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
	
	
	
	int adminNo = Integer.parseInt(request.getParameter("adminNo"));
	System.out.println(adminNo);
	//사원 개인정보 DAO
	HashMap<String,Object> m = AdminDAO.selectMyPage(adminNo);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>사원 번호 </td>
			<td><%=(Integer)m.get("adminNo") %></td>
		</tr>
		<tr>
			<td>아이디(메일)</td>
			<td><%=(String)m.get("adminMail") %></td>
		</tr>
		<tr>
			<td>사원 이름</td>
			<td><%=(String)m.get("adminName") %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=(String)m.get("adminGender") %></td>
		</tr>
		<tr>
			<td>사원 생년월일</td>
			<td><%=(String)m.get("adminBirth") %></td>
		</tr>
		<tr>
			<td>사원 연락처</td>
			<td><%=(String)m.get("adminContact") %></td>
		</tr>
		<tr>
			<td>사원 프로필 사진</td>
			<td><img src="/Semi_F_GDCC/admin/upload/<%=(String)m.get("adminProfile") %>" width="100" height="100"></td>
		</tr>
		<tr>
			<td>마지막 업데이트 날짜</td>
			<td><%=(String)m.get("updateDate") %></td>
		</tr>
	
	
	</table>
	<a href="/Semi_F_GDCC/admin/mainBoard.jsp">돌아가기</a>
	<div><a href="/Semi_F_GDCC/admin/updateMyPageForm.jsp?adminNo=<%=adminNo%>">사원 정보 수정하기 </a></div>
</body>
</html>