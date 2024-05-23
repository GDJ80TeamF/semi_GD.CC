<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
	// 세션에서 고객 mail가져오기
	HashMap<String,Object> login = (HashMap<String,Object>)(session.getAttribute("loginCustomer"));
%>
<%
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<-- qnaNo updateQnAForm.jsp param");
	
	// qnaNo에 따라QnA 출력하는 메서드 / 상세보기
	HashMap<String, Object> m = QnaDAO.selectQnAOne(qnaNo);
	System.out.println(m + "<-- m updateQnAForm.jsp param");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/insertQnAForm.css">
</head>
<body>
<div class="container">
<h1>QnA 글 수정</h1>
<form method="post" action="/Semi_F_GDCC/customer/GDCC/updateQnAAction.jsp">
	<table>

		<tr>
			<th>아이디 :</th>
			<td><input style="width:30%" type="text" value="<%=(String)(m.get("cusMail"))%>" name="cusMail"></td>
		</tr>
		<tr>
			<th>qnaNo :</th>
			<td><input style="width:30%" type="text" value="<%=qnaNo%>" name="qnaNo"></td>
		</tr>
		<tr>
			<th style="width: 15%;">제목 :</th>
			<td><input type="text" value="<%=(String)(m.get("qnaTitle"))%>" name="qnaTitle"></td>
		</tr>
		<tr>
			<th colspan="2">내용 :</th>			
		</tr>
		<tr>
			<td colspan="2"><textarea  style="width: 100%; height: 300px;"
							 name="qnaContent"><%=(String)(m.get("qnaContent"))%></textarea>
			</td>
		</tr>
	</table>
	<button style="width:50%" type="submit">수정</button>	
</form>		
</div>
</body>
</html>