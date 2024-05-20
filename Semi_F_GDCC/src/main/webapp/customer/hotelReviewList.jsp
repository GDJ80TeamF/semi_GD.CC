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
	int lastPage = ReviewDAO.hotelReviewPage();
	System.out.println(lastPage + "<--lastPage hotelReviewList param");
	
	//호텔리뷰 출력하는 메서드
	//ArrayList<HashMap<String, Object>> hotelReviewList = ReviewDAO.selectHotelReviewList(startRow, rowPerPage);
	
	// 선택한 별점에 대한 처리 추가
    int score = 0;
    if(request.getParameter("score") != null) {
        score = Integer.parseInt(request.getParameter("score"));
    }

 	// 별점이 선택되었으면 별점별 호텔 리뷰 출력하는 메서드, 그렇지 않으면 전체 리뷰 출력하는 메서드
    ArrayList<HashMap<String, Object>> hotelReviewList;
    if (score > 0) {
    	hotelReviewList = ReviewDAO.hotelReviewPerScore(score, startRow, rowPerPage);
    } else {
    	hotelReviewList = ReviewDAO.selectHotelReviewList(startRow, rowPerPage);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
		background-color: #f0f0f0;
        }
        
	.container {
		width: 80%;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
	h1 {
		text-align: center;
		margin-bottom: 20px;
        }
        
	table {
		width: 100%;
		border-collapse: collapse;
        }
        
	th, td {
		border: 1px solid #ddd;
		padding: 8px;
		text-align: left;
        }
        
	th {
		background-color: #f2f2f2;
        }
        
	tr:nth-child(even) {
		background-color: #f2f2f2;
        }
        
	tr:hover {
		background-color: #ddd;
        }
        
	.pagination {
		margin-top: 20px;
		text-align: center;
        }
        
	.pagination a {
	color: black;
	float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
        }
        
	.pagination a.active {
		background-color: #007bff;
		color: white;
        }
        
	.pagination a:hover:not(.active) {
		background-color: #ddd;
        }
	.rate{
		width: 121px;height: 20px;position: relative;
		}
	
	.rate span{
		position: absolute;
		background: url(https://aldo814.github.io/jobcloud/html/images/user/star02.png);
		width: auto;height: 20px;
		}
	a {
		text-decoration: none;
	}
</style>
<body>

<div class="container">
    <h1>Hotel Review List</h1>
    점수 : <select onchange="location = this.value;">
			<option value="/Semi_F_GDCC/customer/hotelReviewList.jsp" selected="selected">선택</option>
		<%
			for(int i=1; i<=10; i++){
		%>
			
			<option value="/Semi_F_GDCC/customer/hotelReviewList.jsp?score=<%=i%>"><%=i%>점</option>
		<%
			}
		%>
   		 </select>
    <table>
        <tr>
            <th>rsvNo</th>
            <th>reviewScore</th>
            <th>reviewTitle</th>
            <th>게시 날짜</th>
        </tr>
        <% for(HashMap m : hotelReviewList) { %>
        <tr>
            <td>
                <a href="/Semi_F_GDCC/customer/hotelReviewOne.jsp?rsvNo=<%=(Integer)(m.get("rsvNo"))%>">
                    <%=(Integer)(m.get("rsvNo"))%></a>
            </td>
            <td>
           		<div class="rate">
                    <% 
	                    int reviewScore = (Integer)(m.get("reviewScore"));
	                    int widthPercentage = reviewScore * 10;
                    %>
                    <span style="width: <%= widthPercentage %>%"></span>
                </div>
            </td>
            <td>
                <a href="/Semi_F_GDCC/customer/hotelReviewOne.jsp?rsvNo=<%=(Integer)(m.get("rsvNo"))%>">
                    <%=(String)(m.get("reviewTitle"))%></a>
            </td>
            <td>
            	<%=(String)(m.get("createDate"))%>
            </td>            
        </tr>
        <% } %>
    </table>
    
    <!-- Pagination -->
    <div class="pagination">
        <%
        	if(currentPage > 1) { 
        %>
        <a href="/Semi_F_GDCC/customer/hotelReviewList.jsp?currentPage=1">First</a>
        <a href="/Semi_F_GDCC/customer/hotelReviewList.jsp?currentPage=<%=currentPage-1%>">&laquo; Prev</a>
        <%
        	} 
        %>
        
        <%
        	if(currentPage < lastPage) { 
        %>
        <a href="/Semi_F_GDCC/customer/hotelReviewList.jsp?currentPage=<%=currentPage+1%>">Next &raquo;</a>
        <a href="/Semi_F_GDCC/customer/hotelReviewList.jsp?currentPage=<%=lastPage%>">Last</a>
        <%
        	} 
        %>
    </div>
</div>
</body>
</html>