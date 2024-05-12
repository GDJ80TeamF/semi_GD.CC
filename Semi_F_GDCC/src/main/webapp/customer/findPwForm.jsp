<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pw = request.getParameter("pw");
	
	String msg = request.getParameter("msg");
	
	if(msg == null){
		msg = "";
	}else if(msg.equals("F")){
		msg = "비밀번호찾기를 실패하였습니다";
	}
	if(msg.equals("T")){
		msg = "고객님의 비밀번호는" + pw + "입니다";
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
		<form method="post" action="/Semi_F_GDCC/customer/action/findPwAction.jsp">
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
			<button type="submit">비밀번호 찾기</button>
			<%=msg %>
		</form>
</body>
</html>