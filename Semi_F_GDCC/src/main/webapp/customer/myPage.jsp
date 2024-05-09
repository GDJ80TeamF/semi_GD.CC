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
	//1.세션에서 고객 mail,pw가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 

	 String cusMail = (String)(login.get("cusMail"));
	 	System.out.println(cusMail + "myPage.cusMail");
	
	
	//2.DAO랑 연결시켜서 고객정보 select쿼리 가져오기
	HashMap<String, Object> profile = CustomerDAO.selectCustomerInfo(cusMail);
		
		System.out.println(profile + "<==myPage.profile");

	
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
							비밀번호
						</th>
						<td>
							<%=profile.get("cusPw") %>
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
				</div>
			
</body>
</html>