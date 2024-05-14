<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*"%>
<%
	//로그인 인증분기
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>
<%
	//예약번호 가져오기
	int rsvComNo = Integer.parseInt(request.getParameter("rsvComNo"));
		System.out.println(rsvComNo + "<==rsvComOne.rsvComNo");
		
	//예약상세출력
	
	HashMap<String,Object> rsvOne = RsvComplexDAO.selectRsvComOne(rsvComNo);
	
		System.out.println(rsvOne + "<===rsvComOne.rsvOne");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>부대시설 이용 상세보기</h1>
			<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?table=rsv_complex">
				예약리스트 돌아가기
			</a>
			<table>
				<tr>
					<th>
						예약NO
					</th>
					<td>
						<%=rsvOne.get("rsvComno") %>
					</td>
				</tr>
				<tr>
					<th>
						예약자Mail
					</th>
					<td>
						<%=rsvOne.get("rsvMail") %>
					</td>
				</tr>
				<tr>
					<th>
						RoomNo
					</th>
					<td>
						<%=rsvOne.get("roomNo") %>
					</td>
				</tr>
				<tr>
					<th>
						날짜
					</th>
					<td>
						<%=rsvOne.get("rsvDate") %>
					</td>
				</tr>
				<tr>
					<th>
						시간
					</th>
					<td>
						<%=rsvOne.get("rsvTime") %>
					</td>
				</tr>
				<tr>
					<th>
						인원
					</th>
					<td>
						<%=rsvOne.get("rsvMember") %>
					</td>
				</tr>
				<tr>
					<th>
						예약시설
					</th>
					<td>
						<%=rsvOne.get("complexName") %>
					</td>
				</tr>
			</table>
	</div>

</body>
</html>