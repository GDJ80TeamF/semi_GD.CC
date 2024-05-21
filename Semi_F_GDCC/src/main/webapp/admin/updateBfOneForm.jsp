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
	<form method="post" action="/Semi_F_GDCC/admin/action/updateBfOneAction.jsp" enctype="multipart/form-data">
	<table>
		<tr>
			<td>메뉴 번호</td>
			<td><input type="text" name="menuNo" value="<%=(Integer)m.get("menuNo")%>" readonly></td>
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
			<td><input type="text" name="menuMain" value="<%=(String)m.get("menuMain") %>"></td>
		</tr>
		<tr>
			<td>설명 </td>
			<td><input type="text" name="menuInfo" value="<%=(String)m.get("menuInfo") %>"></td>
		</tr>
		<tr>
			<td>이미지  </td>
			<td><input type="file" name="menuImg" value="<%=(String)m.get("menuImg") %>" required></td>
		</tr>
	
	
	</table>
		<button type="submit">수정하기</button>
	</form>
	</div>
</body>
</html>