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

	System.out.println(menuNo + " <-- menuNo 디버깅 bfOne.jsp");
	
	HashMap <String,Object> m = BfDAO.selectbfOne(menuNo);




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조식 메뉴 상세보기</title>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<!--  Map에서 정보 뿌리기 -->
	<table>
		<tr>
			<td>메뉴 번호</td>
			<td><%=(Integer)m.get("menuNo")%></td>
		</tr>
		<tr>
			<td>시즌</td>
			<td><%=(String)m.get("menuSeason") %></td>
		</tr>
		<tr>
			<td>메인 메뉴</td>
			<td><%=(String)m.get("menuMain") %></td>
		</tr>
		<tr>
			<td>설명 </td>
			<td><%=(String)m.get("menuInfo") %></td>
		</tr>
		<tr>
			<td>이미지 </td>
			<td>
			<img src="/Semi_F_GDCC/admin/upload/<%=(String)m.get("menuImg") %>" width="300" height="200">
			
			
			</td>
		</tr>
		<tr>
			<td>생성 날짜</td>
			<td><%=(String)m.get("createDate") %></td>
		</tr>
		<tr>
			<td>업데이트 날짜</td>
			<td><%=(String)m.get("updateDate") %></td>
		</tr>
	
	
	</table>
	<div><a href="/Semi_F_GDCC/admin/updateBfOneForm.jsp?menuNo=<%=menuNo%>">수정하기</a></div>
	<br>
	<div><a href="/Semi_F_GDCC/admin/bfMenuList.jsp">돌아가기 </a></div>
	</div>
</body>
</html>