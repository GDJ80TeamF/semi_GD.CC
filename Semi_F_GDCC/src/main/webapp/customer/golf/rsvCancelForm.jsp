<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%
	//인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	//예약 번호 출력
	String rsvNo1 = request.getParameter("rsvNo");
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	//세션 가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
		 String cusMail = (String)(login.get("cusMail"));
	
	//회원 골프예약 정보 가져오기
		HashMap<String,Object> rsvOne =
			RsvGolfDAO.selectRsvOne(rsvNo);
	//비밀번호가 일치하지 않을때 메세지
		String msg = request.getParameter("msg");
	
		if (msg == null) {
		    msg = "비밀번호를 입력해주세요"; 
		}
		if (msg.equals("F")) {
		    msg = "일치하지 않습니다";
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
		<h1>예약취소</h1>
				<table>
				
				
					<tr>
						<th>예약날짜</th>
						<th>시작코스</th>
						<th>T-TIME</th>
					</tr>
					<tr>
						<td><%=rsvOne.get("rsvDate") %></td>
						<td><%=rsvOne.get("rsvCourse") %></td>
						<td>
							<%
								// rsvTtime을 정수로 바꿔주기
								int rsvTtime = Integer.parseInt((String) rsvOne.get("rsvTtime"));
								
								// rsvTtime enum에 따라서 시간에 맞춰서 출력
								switch (rsvTtime) {
								    case 1:
								        out.print("11:00");
								        break;
								    case 2:
								        out.print("11:15");
								        break;
								    case 3:
								        out.print("11:30");
								        break;
								    case 4 :
								    	out.print("11:45");
								    	break;
								    case 5 :
								    	out.print("12:00");
								    	break;
								    case 6 :
								    	out.print("12:15");
								    	break;
								    case 7 :
								    	out.print("12:30");
								    	break;
								    case 8 :
								    	out.print("12:45");
								    	break;
								    case 9 :
								    	out.print("13:00");
								    	break;
								}
							%>					
						</td>
					</tr>
				</table>
				<h4>이 예약을 취소하시겠습니까?</h4>
						<%=msg %>
						<form method="post" action="/Semi_F_GDCC/customer/golf/rsvCancelPwCk.jsp">						
								<input type="password" name="ckPw">
								<input type="hidden" id="mail" name="cusMail" value="<%=cusMail %>">
								<input type="hidden" id="rsvNo" name="rsvNo" value="<%=rsvNo%>">
							<button type="submit"> 취소 </button>
						</form>
				
	</div>
</body>
</html>