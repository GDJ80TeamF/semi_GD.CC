<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="gdcc.dao.*"%>
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
<!-- Latest compiled JavaScript -->	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.comment {
    margin-bottom: 20px;
    padding: 10px;
    background: white;
    border-radius: 5px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);}
.comment-button {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 8px 16px;
  border-radius: 4px;
  cursor: pointer;
}

.comment-button:hover {
  background-color: #0056b3;
}
</style>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
<div style="display: table;margin-left: auto; margin-right: auto;width:800px;">
<h1>QnA 상세보기</h1>
	<table class="table">
		<tr>
			<th>qnaNo</th>
			<td><%=(Integer)(map.get("qnaNo"))%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=(String)(map.get("cusMail"))%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=(String)(map.get("qnaTitle"))%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=(String)(map.get("qnaContent"))%></td>
		</tr>
		<tr>
			<th>createDate</th>
			<td><%=(String)(map.get("createDate"))%></td>
		</tr>
		<tr>
			<th>updateDate</th>
			<td><%=(String)(map.get("updateDate"))%></td>
		</tr>
			
	</table>
	<div class="text-center"><a href="/Semi_F_GDCC/admin/deleteQnAForm.jsp?qnaNo=<%=qnaNo%>" type="button" class="btn btn-danger">글 삭제</a></div>
	
</div>

<form method="post" action="/Semi_F_GDCC/admin/action/insertCommentAction.jsp">
	<div style="display: table;margin-left: auto; margin-right: auto;width:800px;">
	<h3>댓글입력</h3>
		
		<table class="table table-striped">
			<tr>
				<th>qnaNo</th>
				<th><input type="text" value="<%=qnaNo%>" name="qnaNo"></th>
				<th></th>
			</tr>
			<tr>
				<th>adminMail</th>
				<th><input type="text" value="<%=adminMail%>" name="adminMail"></th>
				<th></th>
			</tr>
			<tr>
				<th>commentContent</th>
				<th><textarea style="width: 400px; height:100px;"name="commentContent"></textarea></th>
				<th><button type="submit" class="comment-button">입력</button></th>
			</tr>										
		</table>
	</div>
</form>
<div style="display: table;margin-left: auto; margin-right: auto;width:800px; ">
<h3>QnA 댓글</h3>
	
	
		<%
			for(HashMap m : list) { 
				
					
				
		%>
		<div><b>CommentNo : <%=(Integer)(m.get("commentNo"))%> || 작성일 : <%=(String)(m.get("createDate"))%></b> </div>
		
		<div><%=(String)(m.get("commentContent"))%></div>
		<div><a href="/Semi_F_GDCC/admin/action/deleteCommentAction.jsp?qnaNo=<%=qnaNo%>&
								commentNo=<%=(Integer)(m.get("commentNo"))%>">삭제</a></div>
		<hr style="background:black; height:1px;border:0;">
		<%

				
			}
		%>

</div>
</div>
</body>
</html>			
