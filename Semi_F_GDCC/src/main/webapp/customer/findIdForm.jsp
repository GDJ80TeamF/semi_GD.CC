<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mail = request.getParameter("mail");

	String msg = request.getParameter("msg");
	
	if(msg == null){
		msg = "";
	}else if(msg.equals("F")){
		msg = "다시 입력해주세요";
	}
	if(msg.equals("T")){
		msg = "고객님의 email은" + mail + "입니다";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>아이디찾기</h1>
			<form method="post" action="/Semi_F_GDCC/customer/action/findIdAction.jsp">
				<table>
					<tr>
						<th>
							<label for="name">
								성함 : 
							</label>
						</th>
						<td>
							<input type="text" id ="name" name ="cusName">
						</td>
					</tr>
					<tr>
						<th>
							<label for="birth">
								생년월일 : 
							</label>
						</th>
						<td>
							<input type="date" id ="birth" name ="cusBirth">
						</td>
					</tr>
					<tr>
						<th>
							<label for="contact">
								전화번호 : 
							</label>
						</th>
						<td>
							<input type="text" id ="contact" name ="cusContact" placeholder="01012345678(-없이 입력)">
						</td>
					</tr>
				</table>
				<button type="submit">찾기</button>
				<%=msg %>
			</form>
	</div>
</body>
</html>