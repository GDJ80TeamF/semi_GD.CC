<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mail = request.getParameter("mail");
		System.out.println(mail + "<==정보확인 후 가져온 mail");
		if(mail == null){
			mail ="";
		}
	
	String msg = request.getParameter("msg");
		System.out.println(msg + "<===msg");
	
	if(msg == null){
		msg = "";
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호찾기</h1>
		<div>
			<form method="post" action="/Semi_F_GDCC/customer/action/customerCheckAction.jsp">
				<table>
					<tr>
						<th>
							<label for ="mail">
								mail
							</label>
						</th>
						<td>
							<input type="text" id="mail" name="cusMail">
						</td>
					</tr>
					<tr>
						<th>
							<label for ="contact">
								연락처
							</label>
						</th>
						<td>
							<input type="text" id="contact" name="cusContact">
						</td>
					</tr>
					<tr>
						<th>
							<label for ="name">
								성함
							</label>
						</th>
						<td>
							<input type="text" id="name" name="cusName">
						</td>
					</tr>
				</table>
				<button type="submit">고객정보 확인하기</button>
			</form>
		</div>
	<br>
			
		<div>
			<%
				if(msg.equals("T") && mail != null){
			%>
				<label for="pw">
					새로운 비밀번호를 입력하세요
				</label>
					<form method="post" action = "/Semi_F_GDCC/customer/action/customerResetPwAction.jsp">
							<input type="hidden" name = "mail" value="<%=mail%>">
							<input type="password" name = "newPw" id="pw">
						<button type="submit">변경</button>
					</form>
			<%
				}else if(msg.equals("F")){
					
			%>
				<div>
					정보를 정확히 입력해주세요
				</div>
			<%
				}
			%>		
		</div>
	<br>
		<div>
			<%
				if(msg.equals("G")){
			%>
				<div>
					<span>
						비밀번호가 변경됐습니다. 
					</span>
					<a href="/Semi_F_GDCC/customer/customerLoginForm.jsp">
						로그인하기
					</a>
				</div>
			<%
				}
			%>
		</div>
</body>
</html>