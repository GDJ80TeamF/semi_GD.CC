<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.util.*" %>
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
	<table class="table table-hover">
		<tr>
			<th>메뉴 번호</th>
			<th>시즌 </th>
			<th>메인 메뉴 </th>
			<th>설명</th>
			<th>업데이트 날짜</th>
		
		</tr>
		<tr>
		<%
		for(HashMap <String , Object> m :list){
		%>
			<td><%=(Integer)m.get("menuNo") %></td>
			<td><%=(String)m.get("menuSeason") %></td>
			<td><%=(String)m.get("menuMain") %></td>
			<td><%=(String)m.get("menuInfo") %></td>
			<td><%=(String)m.get("updateDate") %></td>
		
		
		</tr>
		
		<%
		}
		
		
		
		
		%>
			
		
		
	
	
	</table>
</body>
</html>