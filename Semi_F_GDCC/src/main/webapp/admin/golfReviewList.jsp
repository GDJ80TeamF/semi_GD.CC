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

	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int rowPerPage = 10;
	int startRow = (currentPage-1) * rowPerPage;
	//페이징 lastPage 구하는 dao 호출 
	int lastPage = ReviewDAO.golfReviewPage();
	System.out.println(lastPage + "<--lastPage golfReviewList param");
	
	//골프리뷰 출력하는 메서드
	ArrayList<HashMap<String, Object>> golfReviewList = ReviewDAO.selectGolfReviewList(startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div>
<h1>GolfRiview리스트</h1>
	<table border="1">
		<tr>
			<th>rsvNo</th>
			<th>reviewTitle</th>
		</tr>
		<%
			for(HashMap m : golfReviewList) {
		%>
			<tr>
				<td>
					<a href="/Semi_F_GDCC/admin/golfReviewOne.jsp?rsvNo=<%=(Integer)(m.get("rsvNo"))%>">
						<%=(Integer)(m.get("rsvNo"))%></a>
				</td>
				<td>
					<a href="/Semi_F_GDCC/admin/golfReviewOne.jsp?rsvNo=<%=(Integer)(m.get("rsvNo"))%>">
						<%=(String)(m.get("reviewTitle"))%></a>
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
</body>
</html>