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
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<h1>룸 정보 수정하기</h1>
	<form method="post" action="/Semi_F_GDCC/admin/action/updateRoomAction.jsp?roomNo=<%=roomNo%>" enctype="multipart/form-data">
		<div>
			룸 no:
			<%=(Integer)(m.get("roomNo"))%>
		</div>
		<div>
			룸 등급:
			<input type="text" name="roomGrade" value="<%=(String)(m.get("roomGrade"))%>">
		</div>
		<div>
			룸 가격:
			<input type="text" name="roomPrice" value="<%=(Integer)(m.get("roomPrice"))%>">
		</div>
		<div>
			룸 정보:<br>
			<textarea rows="5" cols="50" name="roomInfo"><%=(String)(m.get("roomInfo"))%></textarea>
		</div>
		<div>
			룸 최대 인원수:
			<input type="text" name="roomMax" value="<%=(Integer)(m.get("roomMax"))%>">
		</div>
		<div>
			룸 상태:
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
		</div>
		<div>
			룸 이미지:<br>
			<img src="/Semi_F_GDCC/upload/<%=(String)(m.get("roomImg"))%>"><br>
			<input type="file" name="roomImg">
		</div>
		<div>
			<button type="submit">룸 수정</button>
			<a href="/Semi_F_GDCC/admin/roomOne.jsp?roomNo=<%=roomNo%>">취소</a>
		</div>
		
	</form>
	</div>
</body>
</html>