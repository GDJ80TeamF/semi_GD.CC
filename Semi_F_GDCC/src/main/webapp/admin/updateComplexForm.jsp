<%@page import="gdcc.dao.ComplexDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int complexNo = Integer.parseInt(request.getParameter("complexNo"));
	// 디버깅
	System.out.println("complexNo: " + complexNo);
	
	HashMap<String, Object> m = ComplexDAO.selectComplexOne(complexNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>complex 수정 폼</h1>
	<form method="post" action="/Semi_F_GDCC/admin/action/updateComplexAction.jsp?complexNo=<%=(Integer)(m.get("complexNo"))%>">
		<div>		
			complexNO
			<input type="text" name="complexNo" value="<%=(Integer)(m.get("complexNo"))%>" readonly="readonly">
		</div>
		<div>
			complexName
			<input type="text" name="complexName" value="<%=(String)(m.get("complexName"))%>" readonly="readonly">
		</div>
		<div>
			complexState
			<select name="complexState">
				<%
					if(m.get("complexState").equals("사용가능")){
				%>
					<option value="사용가능" selected="selected">사용가능</option>	
					<option value="수리중">수리중</option>
					<option value="휴장">휴장</option>
				<%
					}else if(m.get("complexState").equals("수리중")){
				%>
					<option value="사용가능">사용가능</option>	
					<option value="수리중" selected="selected">수리중</option>
					<option value="휴장">휴장</option>
				<%
					}else if(m.get("complexState").equals("휴장")){
				%>
					<option value="사용가능">사용가능</option>	
					<option value="수리중">수리중</option>
					<option value="휴장" selected="selected">휴장</option>
				<%
					}
				%>
			</select>
		</div>
		<div>		
			complexInfo
			<br>
			<textarea rows="5" cols="50" name="complexInfo"><%=(String)(m.get("complexInfo"))%></textarea>
		</div>
		<button type="submit">수정하기</button>
		<a href="/Semi_F_GDCC/admin/complexOne.jsp?complexNo=<%=(Integer)(m.get("complexNo"))%>">취소</a>
	</form>
</body>
</html>