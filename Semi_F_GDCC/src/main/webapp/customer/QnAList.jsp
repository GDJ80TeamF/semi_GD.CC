<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	String cusMail = "rlqja"; //request.getParameter("cusMail");
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

	int rowPerPage = 10;
	int startRow = (currentPage-1) * rowPerPage;
	
	//int totalRow = 0;
	//int lastPage = 0;
	
	//QnA리스트 출력하는 메서드
	ArrayList<HashMap<String, Object>> list = QnaDAO.selectQnAList(startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div>
<h1>QnA 게시판</h1>
	<table border="1">
		<tr>
			<th>qnaNo</th>
			<th>qnaTitle</th>
			<th>cusMail</th>
		</tr>
		<%
			for(HashMap m : list) {
		%>
			<tr>
				<td>
					<a href="/Semi_F_GDCC/customer/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
						<%=(Integer)(m.get("qnaNo"))%></a>
				</td>
				<td>
					<a href="/Semi_F_GDCC/customer/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
						<%=(String)(m.get("qnaTitle"))%>
				</td>
				<td>
					<a href="/Semi_F_GDCC/customer/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
						<%=(String)(m.get("cusMail"))%>
				</td>
			</tr>
		<%
			}
		%>
			<a href="/Semi_F_GDCC/customer/insertQnAForm.jsp">글 쓰기</a>
	</table>

</div>
</body>
</html>