<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%

	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	//1.세션에서 고객 mail가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 

	 String cusMail = (String)(login.get("cusMail"));
	 	System.out.println(cusMail + "myPage.cusMail");
	
	
	//2.DAO랑 연결시켜서 고객정보 select쿼리 가져오기
	HashMap<String, Object> profile = CustomerDAO.selectCustomerInfo(cusMail);
		
		System.out.println(profile + "<==myPage.profile");

	
%>
<%
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	// 공지 5개씩
	int rowPerPage = 5;
	int startRow = (currentPage-1) * rowPerPage;	
%>
<%
	ArrayList<HashMap<String, Object>> List = RsvHotelDAO.rsvList(startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
</head>
<body>
	<h1> my Page</h1>
			<div>
				<%-- <%=profile.get("cusProfile") %> --%>
			</div>
				<table>
					<tr>
						<th>
							고객mail
						</th>
						<td>
							<%=profile.get("cusMail") %>
						</td>
					</tr>
					<tr>
						<th>
							성함
						</th>
						<td>
							<%=profile.get("cusName") %>
						</td>
					</tr>
					<tr>
						<th>
							연락처
						</th>
						<td>
							<%=profile.get("cusContact") %>
						</td>
					</tr>
					<tr>
						<th>
							성별
						</th>
						<td>
							<%=profile.get("cusGender") %>
						</td>
					</tr>
					<tr>
						<th>
							생년월일
						</th>
						<td>
							<%=profile.get("cusBirth") %>
						</td>
					</tr>
				</table>
				
				<div>
					<a href="/Semi_F_GDCC/customer/updateMyInfoForm.jsp"> 
						프로필 변경하기
					</a>
					<a href="/Semi_F_GDCC/customer/updatePwForm.jsp">
						비밀번호 변경하기
					</a>
					<a href="/Semi_F_GDCC/customer/deleteCustomerForm.jsp">
						회원탈퇴하기
					</a>
					<a href="/Semi_F_GDCC/customer/reviewListPerCustomer.jsp">
						my후기
					</a>
					<a href="/Semi_F_GDCC/customer/QnAListPerCustomer.jsp">
						MyQnA
					</a>
				</div>
				<br>
				<div>
					<table border="1">
						<tr>
							<th>예약 번호</th>
							<th>룸 번호</th>
							<th>예약자 아이디 </th>
						</tr>
						<tr>
							<%
								for(HashMap<String, Object> m : List){
							%>
								<td><a href="/Semi_F_GDCC/customer/hotel/cusRsvHotelOne.jsp?rsvNo=<%=m.get("rsvNo")%>"><%=m.get("rsvNo")%></a></td>
								<td><%=(Integer)m.get("roomNo")%></td>
								<td><%=cusMail%></td>
							<%
								}
							%>
						</tr>
					</table>
				</div>
			
</body>
</html>