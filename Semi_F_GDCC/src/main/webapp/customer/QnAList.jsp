<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	HashMap<String,Object> loginMember 
	= (HashMap<String,Object>)(session.getAttribute("loginCustomer"));
	
	String cusMail = request.getParameter("cusMail");
	System.out.println(cusMail+ "<<==cusMail");
	
	
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
						<%=(String)(m.get("qnaTitle"))%></a>
				</td>
				<td>
					<a href="/Semi_F_GDCC/customer/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
						<%=(String)(m.get("cusMail"))%></a>
				</td>
			</tr>
		<%
			}
		%>
			<a href="/Semi_F_GDCC/customer/insertQnAForm.jsp">글 쓰기</a>
	</table>
	<!-- 페이징 버튼 -->
	<div style="display: table;margin-left: auto; margin-right: auto;">														
		<%
			if(currentPage > 1){			
		%>
			<a href="/Semi_F_GDCC/customer/QnAList.jsp?currentPage=1"> << 처음 페이지&nbsp; </a></li>
			<a href="/Semi_F_GDCC/customer/QnAList.jsp?currentPage=<%=currentPage-1%>">&nbsp; < 이전 </a></li>											
		<%						
			}if(currentPage < lastPage){
		%>
			<a href="/Semi_F_GDCC/customer/QnAList.jsp?currentPage=<%=currentPage+1%>">&nbsp;&nbsp; 다음 > </a></li>
			<a href="/Semi_F_GDCC/customer/QnAList.jsp?currentPage=<%=lastPage%>"> &nbsp;마지막 페이지 >></a></li>
		<%
			}					
		%>		
	</div>
	

</div>
</body>
</html>