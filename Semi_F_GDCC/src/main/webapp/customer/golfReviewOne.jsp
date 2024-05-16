<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<-- rsvNo hotelReviewOne.jsp param ");

	// reviewNo에 따라 review 출력하는 메서드 / 상세보기
	HashMap<String, Object> m = ReviewDAO.selectGolfReviewOne(rsvNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
	.rate{
	width: 121px;height: 20px;position: relative;}
	
	.rate span{
	position: absolute;
	background: url(https://aldo814.github.io/jobcloud/html/images/user/star02.png);
	width: auto;height: 20px;}
</style>
<body>

<div>
	<h1>golfReview 상세보기</h1>
		<table border="1">
			<tr>	
				<th>rsvNo</th>
				<th>reviewTitle</th>
				<th>reviewContent</th>
				<th>reviewScore</th>
				<th>createDate</th>
				<th>updateDate</th>	
			</tr>
			<tr>
				<td><%=(Integer)(m.get("rsvNo"))%></td>	
				<td><%=(String)(m.get("reviewTitle"))%></td>	
				<td><%=(String)(m.get("reviewContent"))%></td>	
				<td>
					<div class="rate">
					<%
						switch((Integer)(m.get("reviewScore"))){
						case 1:
					%>							
	        			<span style="width: 10%"></span>	    					
	    			<% 
	    				break;
						case 2:
					%>					
	        			<span style="width: 20%"></span>	    				
					<% 
						break;
						case 3:
					%>							
	        			<span style="width: 30%"></span>	    					
					<% 
						break;
						case 4:
					%>					
	        			<span style="width: 40%"></span>	    				
					<% 	
						break;
						case 5:
					%>							
	        			<span style="width: 50%"></span>	    					
					<% 
						break;
						case 6:
					%>					
	        			<span style="width: 60%"></span>	    				
					<% 
						break;
						case 7:
					%>					
	        			<span style="width: 70%"></span>	    				
					<% 
						break;
						case 8:
					%>					
	        			<span style="width: 80%"></span>	    			
					<% 
						break;
						case 9:
					%>					
	        			<span style="width: 90%"></span>	    				
					<% 
						break;
						case 10:
					%>					
	        			<span style="width: 100%"></span>
	    			</div>
					<% 
					break;
						}		
					%>	
				</td>	
				<td><%=(String)(m.get("createDate"))%></td>
				<td><%=(String)(m.get("updateDate"))%></td>
			</tr>
		</table>
</div>

</body>
</html>