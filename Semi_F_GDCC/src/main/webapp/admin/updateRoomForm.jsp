<%@page import="java.util.HashMap"%>
<%@page import="gdcc.dao.RoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int roomNo = Integer.parseInt(request.getParameter("roomNo"));
	System.out.println("roomNo: " + roomNo);

%>
<%
	HashMap<String, Object> m = RoomDAO.selectRoom(roomNo);
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
	<h1>룸 정보 수정하기</h1>
	<form method="post" action="/Semi_F_GDCC/admin/action/updateRoomAction.jsp?roomNo=<%=roomNo%>" enctype="multipart/form-data">
	<table>
		<tr>
			<td>룸 no:</td>
			<td><%=(Integer)(m.get("roomNo"))%></td>
		</tr>
		<tr>
			<td>룸 등급:</td>
			<td><input type="text" name="roomGrade" value="<%=(String)(m.get("roomGrade"))%>"></td>
		</tr>
		<tr>
			<td>룸 가격:</td>
			<td><input type="text" name="roomPrice" value="<%=(Integer)(m.get("roomPrice"))%>"></td>
		</tr>
		<tr>
			<td>룸 정보:</td>
			<td><textarea rows="5" cols="50" name="roomInfo"><%=(String)(m.get("roomInfo"))%></textarea></td>
		</tr>
		<tr>
			<td>룸 최대 인원수:</td>
			<td><input type="text" name="roomMax" value="<%=(Integer)(m.get("roomMax"))%>"></td>
		</tr>
		<tr>
			<td>룸 상태:</td>
			<td>
			<select name="roomState">
				<%
					if(m.get("roomState").equals("공사중")){
				%>
					<option value="공사중" selected="selected">공사중</option>	
					<option value="투숙가능">투숙가능</option>
				<%
					}else{
				%>
					<option value="공사중">공사중</option>	
					<option value="투숙가능" selected="selected">투숙가능</option>
				<%
					}
				%>
				
			</select>
			
			</td>
		</tr>
		<tr>
			<td>룸 이미지:</td>
			<td><img src="/Semi_F_GDCC/upload/<%=(String)(m.get("roomImg"))%>" width="300" height="300"><input type="file" name="roomImg"></td>
		</tr>
	
	</table>
		<div style="text-align:center;">
			<button type="submit">룸 수정</button>
			<a href="/Semi_F_GDCC/admin/adroomOne.jsp?roomNo=<%=roomNo%>">취소</a>
		</div>
		
	</form>
	</div>
</body>
</html>