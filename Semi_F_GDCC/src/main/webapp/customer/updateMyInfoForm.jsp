<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.util.*" %>
<%
	//인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%

	//1.세션에서 고객 mail,pw가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 
	 
	 String cusMail = (String)(login.get("cusMail"));

	//고객정보 가져오기
	HashMap<String,Object> info 
		=	CustomerDAO.selectCustomerInfo(cusMail);

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보수정</title>
</head>
<body>
	<h1>고객정보 수정하기</h1>
		<form method="post" action="/Semi_F_GDCC/customer/action/updateMyInfoAction.jsp" enctype="multipart/form-data">
			<div>
				<!-- 원래 기본 사진자리 -->
				사진 변경하기
			</div>
				<div>
				    <!-- 새로운 프로필 사진 업로드 필드 -->
				    <label for="filename">프로필 사진 변경:</label>
				    <input type="file" id="filename" name="cusProfile" value="<%=info.get("cusProfile")%>">
				</div>
					<table>
						<tr>
							<th>
								<label for="mail">
									고객메일
								</label>
							</th>
							<td>
								<input type="text" id="mail" name="cusMail"  value="<%=info.get("cusMail") %>" readonly>
							</td>
						</tr>
						<tr>
							<th>
								<label for="name">
									성함
								</label>
							</th>
							<td>
								<input type="text" id="name" name="cusName" value="<%=info.get("cusName") %>">
							</td>
						</tr>
						<!-- 비밀번호 변경은 myPage.jsp에서 따로 해야함 -->
						<tr>
							<th>
								<label for="contact">
									연락처
								</label>
							</th>
							<td>
								<input type="text" id="contact" name="cusContact" value="<%=info.get("cusContact") %>">
							</td>
						</tr>
						<tr>
							<th>
								<label for="gender">
									성별
								</label>
							</th>
							<td>
								<select name="cusGender">
								    <option value="남" <%= info.get("cusGender").equals("남") ? "selected" : "" %>>남성</option>
								    <option value="여" <%= info.get("cusGender").equals("여") ? "selected" : "" %>>여성</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								<label for="birth">
									생년월일
								</label>
							</th>
							<td>
								<input type="date" id="birth" name="cusBirth" value="<%=info.get("cusBirth") %>" readonly>
							</td>
						</tr>
					</table>
				<button type="submit">변경하기</button>
		</form>
		
</body>
</html>