<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
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
<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/qnaOne.css">
</head>

<body>
<div class="container">
    <h1>QnA 상세보기</h1>
    <table>
        <tr>
            <th style="width: 2%;">No.</th>
            <td><%=(Integer)(map.get("qnaNo"))%></td>
        </tr>
        <tr>
        	<th style="width: 2%;">작성자</th>
        	<td><%=(String)(map.get("cusMail"))%></td>
        </tr>
        <tr>
        	<th>제목</th>
        	<td><%=(String)(map.get("qnaTitle"))%></td>
        </tr>
        <tr>
        	<th class="content-column" colspan="2">내용</th>
        </tr>
        <tr>
        	<td colspan="2" style="width: 35%; height: 200px;">
        		<%=(String)(map.get("qnaContent"))%></td>
        </tr>      		
        <tr>
        	<th>작성일</th>
        	<td><%=(String)(map.get("createDate"))%></td>
        </tr>
        <tr>                                              
            <th>수정일</th>
            <td><%=(String)(map.get("updateDate"))%></td>
        </tr>
    </table>
</div>

<div class="container">
    <h1>QnA 댓글</h1>
    <table>
        <tr>
            <th>No.</th>
            <th>댓글 내용</th>
            <th>작성일</th>
        </tr>
        <%
            for(HashMap m : list) { 
        %>
        <tr>
            <td style="width: 5%;"><%=(Integer)(m.get("commentNo"))%></td>
            <td><%=(String)(m.get("commentContent"))%></td>
            <td style="width: 15%;"> <%=(String)(m.get("createDate"))%> </td>
        </tr>
        <%
            }
        %>
    </table>
</div>

</body>
</html>