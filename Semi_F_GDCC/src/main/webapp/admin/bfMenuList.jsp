<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.util.*" %>
<%

	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}

	//세션에 저장되있는 사원 번호 가져오기 
	HashMap<String,Object>  loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
	
	
%>
<%

	ArrayList<HashMap<String,Object>> list = BfDAO.selectBfMenu();




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<table class="table table-hover">
		<tr>
			<th>메뉴 번호</th>
			<th>시즌 </th>
			<th>메인 메뉴 </th>
			<th>업데이트 날짜</th>
			<th>상세보기 </th>
		
		</tr>
		<tr>
		<%
		for(HashMap <String , Object> m :list){
		%>
			<td><%=(Integer)m.get("menuNo") %></td>
			<td><%=(String)m.get("menuSeason") %></td>
			<td><%=(String)m.get("menuMain") %></td>
			<td><%=(String)m.get("updateDate") %></td>
			<td><a href="/Semi_F_GDCC/admin/bfOne.jsp?menuNo=<%=(Integer)m.get("menuNo")%>">상세보기 </a></td>
		
		</tr>
		
		<%
		}
		
		
		
		
		%>
			
		
		
	
	
	</table>
	<div class="text-center"><a href="/Semi_F_GDCC/admin/mainBoard.jsp" class="btn btn-primary">돌아가기 </a></div>
	</div>
</body>
</html>