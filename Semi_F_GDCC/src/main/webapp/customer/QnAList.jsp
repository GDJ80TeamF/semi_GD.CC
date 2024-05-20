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
<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/qnaList.css">
</head>
<body>
<div class="container">
    <h1>QnA 게시판</h1>
    <a href="/Semi_F_GDCC/customer/insertQnAForm.jsp" class="write-button">글 쓰기</a>
    <hr>
    <table>
        <thead>
        <tr>
            <th>NO.</th>
            <th>제목</th>
            <th>작성자</th>
        </tr>
        </thead>
        <tbody>
        <%
        	for(HashMap m : list) { 
        %>
            <tr>
                <td>
                    <a href="/Semi_F_GDCC/customer/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
                        <%=(Integer)(m.get("qnaNo"))%>
                    </a>
                </td>
                <td>
                    <a href="/Semi_F_GDCC/customer/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
                        <%=(String)(m.get("qnaTitle"))%>
                    </a>
                </td>
                <td>
                    <a href="/Semi_F_GDCC/customer/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
                        <%=(String)(m.get("cusMail"))%>
                    </a>
                </td>
            </tr>
        <%
        	}
        %>
        </tbody>
    </table>
    <hr style="margin-top: 20px;">
    <!-- 페이징 버튼 -->
    <div class="pagination">
        <%
        	if(currentPage > 1){ 
        %>
            <a href="/Semi_F_GDCC/customer/QnAList.jsp?currentPage=1"> &nbsp;<< 처음 페이지 </a>
            <a href="/Semi_F_GDCC/customer/QnAList.jsp?currentPage=<%=currentPage-1%>">&nbsp; < 이전 </a>                   
        <%
        	}
        %>
        <%
        	if(currentPage < lastPage){ 
        %>   
            <a href="/Semi_F_GDCC/customer/QnAList.jsp?currentPage=<%=currentPage+1%>"> 다음 >&nbsp; </a>
            <a href="/Semi_F_GDCC/customer/QnAList.jsp?currentPage=<%=lastPage%>"> 마지막 페이지 >>&nbsp;</a>
        <%
        	}
        %>
    </div>
</div>
</body>
</html>