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
	//세션에 저장되있는 회원 메일 가져오기 
	HashMap<String,Object>  loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
	String adminMail = (String)loginAdmin.get("adminMail");
	int adminGrade = (Integer)loginAdmin.get("adminGrade");
	System.out.println(adminMail);
	System.out.println(adminGrade);
	
	
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int rowPerPage = 10;
	int startRow = (currentPage-1) * rowPerPage;
	//페이징 lastPage 구하는 dao 호출 
	int lastPage = QnaDAO.page();
	System.out.println(lastPage + "<--lastPage QnAList param");
	
	//QnA리스트 출력하는 메서드
	ArrayList<HashMap<String, Object>> list = QnaDAO.selectQnAList(startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
}

/* 테이블 헤더 스타일 */
th {
  background-color: #f2f2f2;
  color: black;
  font-weight: bold;
  padding: 15px;
  text-align: left;
  border-bottom: 2px solid #007bff;
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

td button {
  display: inline-block; /* 블록 요소에서 인라인-블록 요소로 변경 */
  vertical-align: middle; /* 버튼을 select 요소와 수직 정렬 */
  margin-left: 5px; /* select 요소와 버튼 사이의 간격 조정 */
  padding: 10px 20px;
  text-align: center;
  border: none;
  background-color: #007bff;
  color: white;
  border-radius: 5px;
}

td button:hover {
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

/* 선택 박스 스타일 */
select {
  width: 40%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  background-color: #f8f8f8;
}

</style>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
<div>
<h1>QnA 게시판관리</h1>
	<table>
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
					<a href="/Semi_F_GDCC/admin/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
						<%=(Integer)(m.get("qnaNo"))%></a>
				</td>
				<td>
					<a href="/Semi_F_GDCC/admin/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
						<%=(String)(m.get("qnaTitle"))%></a>
				</td>
				<td>
					<a href="/Semi_F_GDCC/admin/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
						<%=(String)(m.get("cusMail"))%></a>
				</td>
			</tr>
		<%
			}
		%>
			
	</table>
	<!-- 페이징 버튼 -->
	<div style="display: table;margin-left: auto; margin-right: auto;">														
		<%
			if(currentPage > 1){			
		%>
			<a href="/Semi_F_GDCC/admin/QnAList.jsp?currentPage=1"> << 처음 페이지&nbsp; </a></li>
			<a href="/Semi_F_GDCC/admin/QnAList.jsp?currentPage=<%=currentPage-1%>">&nbsp; < 이전 </a></li>											
		<%						
			}if(currentPage < lastPage){
		%>
			<a href="/Semi_F_GDCC/admin/QnAList.jsp?currentPage=<%=currentPage+1%>">&nbsp;&nbsp; 다음 > </a></li>
			<a href="/Semi_F_GDCC/admin/QnAList.jsp?currentPage=<%=lastPage%>"> &nbsp;마지막 페이지 >></a></li>
		<%
			}					
		%>		
	</div>
	
</div>
</div>
</body>
</html>