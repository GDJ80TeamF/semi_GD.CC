<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
	HashMap<String,Object> loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
%>  

<%
	/* 아아디, 비밀번호 체크 */
	String checkId = request.getParameter("checkId");
	
	if(checkId == null) {
		checkId = "";
	}
	String ck = request.getParameter("ck");
	System.out.println("ck: " + ck);
	if(ck == null) {
		ck = "";
	}
	String msg = "";
	if(ck.equals("T")){
		msg = "삭제할 수 있는 비밀번호입니다.";
	} else if(ck.equals("F")){		
		msg = "삭제할 수 없는 비밀번호 입니다. 확인 후 다시 입력해주세요.";
	}
	System.out.println("checkId: " + checkId);
	
	 int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	System.out.println("noticeNo: " + noticeNo); 
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

button {
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

button:hover {
  background-color: #0056b3;
}


/* 입력 필드 스타일 */
input[type=text], select {
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
	<form method="post" action="/Semi_F_GDCC/admin/action/deleteCkNoticeAction.jsp">
	<div style="text-align:center;">공지를 삭제하시겠습니까? 삭제하려면 아이디와 비번을 비교해야 됩니다.</div>
	<table>
		<!-- 공지번호 -->
		<tr>
			<td>아이디:</td>
			<td><input type="text" name="checkId" value="<%=(String)(loginAdmin.get("adminMail"))%>"></td>
		</tr>
		<tr>
			<td>비번: </td>
			<td><input type="password" name="checkPw"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="text" name="noticeNo" value=<%=noticeNo%> style="display:none;">  </td>
		</tr>
	
	 </table> 
	 <div style="text-align:center;">
		<button type="submit">비밀번호 확인</button>
	</div>
	</form>
		<!-- 비번 비교후 메세지 출력 -->
		<%
			if(ck.equals("T")){
		%>
			<%=msg%>
			<form method="post" action="/Semi_F_GDCC/admin/action/deleteNoticeAction.jsp?noticeNo=<%=noticeNo%>">
			<div style="text-align:center;">
				<button type="submit" >삭제하기</button>
			</div>
			</form>
		<%
			}
		%>
	<div style="text-aligin:center;">
	<a href="/Semi_F_GDCC/admin/noticeList.jsp">취소</a>
	</div>
	</div>
</body>
</html>