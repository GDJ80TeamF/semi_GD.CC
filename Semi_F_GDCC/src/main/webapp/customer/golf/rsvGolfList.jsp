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
	//세션 가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 

	 String cusMail = (String)(login.get("cusMail"));
	 	System.out.println(cusMail + "rsvGolfList.cusMail");
	
	//회원 골프예약 상세보기 rsvGolfDAO와 연결
	
	ArrayList<HashMap<String,Object>>rsvList = RsvGolfDAO.selectRsvList(cusMail);
		System.out.println(rsvList + "<==rsvGolfList.rsvList");

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원의 골프예약 리스트</title>
</head>
<body>
	<h1>예약리스트</h1>
	<div>
		<table>
			<tr>
				<th></th>
				<th>예약번호</th>
				<th>성함</th>
				<th>예약날짜</th>
				<th>코스</th>
				<th>T-TIME</th>
			</tr>
			<%
				for(HashMap<String,Object> m : rsvList){
					
			%>
				<tr>
					<td>
						<a href="/Semi_F_GDCC/customer/golf/rsvGolfOne.jsp?rsvNo=<%=m.get("rsvNo")%>">
							상세보기
						</a>
					</td>
					<td>
						<%=m.get("rsvNo") %>
					</td>
					<td>
						<%=m.get("cusName") %>님
					</td>
					<td>
						<%=m.get("rsvDate") %>
					</td>
					<td>
						<%=m.get("rsvCourse") %>
					</td>
					<td>
						<%
							// rsvTtime을 정수로 바꿔주기
							int rsvTtime = Integer.parseInt((String) m.get("rsvTtime"));
							
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
			<%
				}
			%>	
		</table>
	</div>
</body>
</html>