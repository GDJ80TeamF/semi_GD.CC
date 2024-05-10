<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%	
	 //rsvNo넘어오나 확인->디버깅확인완료
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
		System.out.println(rsvNo + "<==rsvGolfOne.rsvNo");
		
	//rsvNo로 예약상세 불러오기->확인
	
	HashMap<String,Object> rsvList = RsvGolfDAO.selectRsvOne(rsvNo);
		System.out.println(rsvList + "<==rsvGolfOne.rsvList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프예약</title>
</head>
<body>
	<div>
		<h1>예약상세보기</h1>
			<table>
				<tr>
					<th>예약하신 e-mail</th>
					<td><%=rsvList.get("rsvMail") %></td>
				</tr>
				<tr>
					<th>라운딩 날짜</th>
					<td><%=rsvList.get("rsvDate") %></td>
				</tr>
				<tr>
					<th>시작코스</th>
					<td><%=rsvList.get("rsvCourse") %></td>
				</tr>
				<tr>
					<th>T-TIME</th>
					<td>
						<%
							// rsvTtime을 정수로 바꿔주기
							int rsvTtime = Integer.parseInt((String) rsvList.get("rsvTtime"));
							
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
				<tr>
					<th>요청사항</th>
					<td>
						<%
							if(rsvList.get("rsvRequest") == null){	
						%>
								요청사항이 없습니다
						<%
							}else{
						%>
								<%=rsvList.get("rsvRequest") %>
						<%
							}
						%>	
					</td>
				</tr>
				<tr>
					<th>라운딩 인원</th>
					<td><%=rsvList.get("rsvMember") %></td>
				</tr>
				<tr>
					<th>예약상태</th>
					<td><%=rsvList.get("rsvState") %></td>
				</tr>
			</table>
		<a href="/Semi_F_GDCC/customer/golf/updateRsvForm.jsp?rsvNo=<%=rsvNo%>">
			예약변경신청
		</a>
		<a href="/Semi_F_GDCC/customer/golf/rsvCancelForm.jsp?rsvNo=<%=rsvNo%>"">
			예약취소
		</a>
	</div>
	
		
	
</body>
</html>