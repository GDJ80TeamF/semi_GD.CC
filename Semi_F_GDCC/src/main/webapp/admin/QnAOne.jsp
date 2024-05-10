<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 메인페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>
<%
	//세션에 저장되있는 회원 메일 가져오기 
	HashMap<String,Object>  loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
	String adminMail = (String)loginAdmin.get("adminMail");
	int adminGrade = (Integer)loginAdmin.get("adminGrade");
	System.out.println(adminMail);
	System.out.println(adminGrade);
%>
<%
	
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<-- qnaNo QnAOne.jsp param ");

	// qnaNo에 따라QnA 출력하는 메서드 / 상세보기
	HashMap<String, Object> map = QnaDAO.selectQnAOne(qnaNo);
	
	//comment리스트 출력하는 메서드
	ArrayList<HashMap<String, Object>> list = CommentDAO.selectComment(qnaNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div style="display: table;margin-left: auto; margin-right: auto;">
<h1>QnA 상세보기</h1>
	<table border="1">
		<tr>
			<th>qnaNo</th>
			<th>cusMail</th>
			<th>qnaTitle</th>
			<th>qnaContent</th>
			<th>createDate</th>
			<th>updateDate</th>
		</tr>
		<tr>
			<td><%=(Integer)(map.get("qnaNo"))%></td>	
			<td><%=(String)(map.get("cusMail"))%></td>	
			<td><%=(String)(map.get("qnaTitle"))%></td>	
			<td><%=(String)(map.get("qnaContent"))%></td>	
			<td><%=(String)(map.get("createDate"))%></td>
			<td><%=(String)(map.get("updateDate"))%></td>
		</tr>	
	</table>
	<a href="/Semi_F_GDCC/admin/deleteQnAForm.jsp?qnaNo=<%=qnaNo%>">글 삭제</a>
</div>
<div style="display: table;margin-left: auto; margin-right: auto;">
<h1>QnA 댓글</h1>
	<table border="1">
		<tr>
			<th>commentNo</th>
			<th>commentContent</th>
			<th>createDate</th>
		</tr>
		<%
			for(HashMap m : list) { 
		%>
			<tr>
				<th><%=(Integer)(m.get("commentNo"))%></th>
				<th><%=(String)(m.get("commentContent"))%></th>
				<th>
					<%=(String)(m.get("createDate"))%>
					<button>
						<a href="/Semi_F_GDCC/admin/action/deleteCommentAction.jsp?qnaNo=<%=qnaNo%>&
								commentNo=<%=(Integer)(m.get("commentNo"))%>">삭제</a>
					</button>											
				</th>	
			</tr>
		<%
			}
		%>
	</table>
</div>
<form method="post" action="/Semi_F_GDCC/admin/action/insertCommentAction.jsp">
	<div style="display: table;margin-left: auto; margin-right: auto;">
	<h1>댓글입력</h1>
		
		<table border="1">
			<tr>
				<th>qnaNo</th>
				<th><input type="text" value="<%=qnaNo%>" name="qnaNo"></th>
			</tr>
			<tr>
				<th>adminNo</th>
				<th><input type="text" value="<%=(Integer)loginAdmin.get("adminNo")%>" name="adminNo"></th>
			</tr>
			<tr>
				<th>commentContent</th>
				<th><textarea style="width: 400px; height:100px;"name="commentContent"></textarea></th>
				<th><button type="submit">입력</button></th>
			</tr>										
		</table>
	</div>
</form>
</body>
</html>