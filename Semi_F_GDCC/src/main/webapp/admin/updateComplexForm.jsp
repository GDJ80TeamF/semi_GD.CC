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
input, select, textarea {
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
	<div class="text-center">
	<h1>complex 수정 폼</h1>
	<form method="post" action="/Semi_F_GDCC/admin/action/updateComplexAction.jsp?complexNo=<%=(Integer)(m.get("complexNo"))%>">
		<div>		
			시설 번호
			<input type="text" name="complexNo" value="<%=(Integer)(m.get("complexNo"))%>" readonly="readonly">
		</div>
		<br>
		<div>
			시설 이름
			<input type="text" name="complexName" value="<%=(String)(m.get("complexName"))%>" readonly="readonly">
		</div>
		<br>
		<div>
		상태&nbsp;&nbsp;
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
		<br>
		<div>		
			정보
			<br>
			<textarea rows="5" cols="50" name="complexInfo"><%=(String)(m.get("complexInfo"))%></textarea>
		</div>
		<br>
		<button type="submit">수정하기</button>
		
	</form>
	</div>
	<a href="/Semi_F_GDCC/admin/complexOne.jsp?complexNo=<%=(Integer)(m.get("complexNo"))%>" class="text-center">취소</a>
	</div>
</body>
</html>