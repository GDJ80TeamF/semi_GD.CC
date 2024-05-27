<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%


	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 메인페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
	//세션에 저장되있는 회원 메일 가져오기 
	HashMap<String,Object>  loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
	String adminMail = (String)loginAdmin.get("adminMail");
	int adminGrade = (Integer)loginAdmin.get("adminGrade");
	System.out.println(adminMail);
	System.out.println(adminGrade);
%>
<%

	//페이징 -currentPage, rowPerPage, startRow, lastPage 구하기 
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int rowPerPage = 10;
	int startRow = (currentPage-1) * rowPerPage;
	//페이징 lastPage 구하는 dao 호출 
	int lastPage = AdminDAO.page();
	
	

	ArrayList<HashMap<String,Object>> list = AdminDAO.selectAdminList(adminMail,startRow, rowPerPage);



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
h2{
	text-align:center;
}
</style>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<h2>사원 리스트 </h2>
	
	<table class="table table-hover">
		<tr>
			<th>ACTIVE</th>
			<th>사원 프로필 </th>
			<th>사원 아이디  </th>
			<th>사원 이름</th>
		</tr>
		<tr>
		<%
			for(HashMap<String,Object> m:list){
				if(adminGrade == 1){
		%>
			<td>
			<a href="/Semi_F_GDCC/admin/action/updateStateAction.jsp?adminMail=<%=(String)m.get("adminMail")%>&active=<%=(String)m.get("adminActive")%>">
			<%=(String)m.get("adminActive")%></a>
			</td>
		
		<%
				}else{
		%>
		
			<td><%=(String)m.get("adminActive")%></td>
		<%
				}
		%>		
			
			<td><img src="/Semi_F_GDCC/admin/upload/<%=(String)m.get("adminProfile") %>" width="50" height="50" style="border-radius:50%;"></td>
			<td><%=(String)m.get("adminMail") %></td>
			<td><%=(String)m.get("adminName") %></td>
			</tr>
		<%		
			}
			
			
		%>
			
		
		
		
	
	</table>
	<!-- 페이징 버튼 -->
		<div style="text-align:center;">														
		<%
			if(currentPage > 1){			
		%>
			<a href="/Semi_F_GDCC/admin/adminList.jsp?currentPage=1">FIRST</a>
			<a href="/Semi_F_GDCC/admin/adminList.jsp?currentPage=<%=currentPage-1%>">PRE</a>										
		<%						
			}if(currentPage < lastPage){
		%>
			<a href="/Semi_F_GDCC/admin/adminList.jsp?currentPage=<%=currentPage+1%>">NEXT</a>
			<a href="/Semi_F_GDCC/admin/adminList.jsp?currentPage=<%=lastPage%>">LAST</a>
		<%
			}					
		%>		
		</div>
		</div>
	
</body>
</html>