<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.util.*" %>
<%

	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}


%>
<%

	//param으로 넘길 메뉴번호 가져오기
	int menuNo = Integer.parseInt(request.getParameter("menuNo"));

	System.out.println(menuNo + " <-- menuNo 디버깅 updatebfOneForm.jsp");
	
	HashMap <String,Object> m = BfDAO.selectbfOne(menuNo);




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/Semi_F_GDCC/admin/updateBfOneAction.jsp">
	<table>
		<tr>
			<td>메뉴 번호</td>
			<td><input name="menuNo" value="<%=(Integer)m.get("menuNo")%>" readonly></td>
		</tr>
		<tr>
			<td>시즌</td>
			<td>
				<%
					if(((String)m.get("menuSeason")).equals("SS")){
				%>
				
				<input type="radio" name="menuSeason" value="SS" id="SS" checked>
				<label for="SS">SS</label>
				<input type="radio" name="menuSeason" value="FW" id="FW">
				<label for="FW">FW</label>
				
				
				
				<%	
					}else{
				%>
				<input type="radio" name="menuSeason" value="SS" id="SS">
				<label for="SS">SS</label>
				<input type="radio" name="menuSeason" value="FW" id="FW" checked>
				<label for="FW">FW</label>
				
				
				
				<% 
					}
				%>
			
			</td>
		</tr>
		<tr>
			<td>메인 메뉴</td>
			<td><input name="menuMain" value="<%=(String)m.get("menuMain") %>"></td>
		</tr>
		<tr>
			<td>설명 </td>
			<td><input name="menuInfo" value="<%=(String)m.get("menuInfo") %>"></td>
		</tr>
		
	
	
	</table>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>