<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*"%>
<%
	//인증분기 
	
%>
<%
	
	//예약번호
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
		System.out.println(rsvNo + "<==rsvGolfOne.rsvNo");
		
	//예약 상세보기 가져오기
	HashMap<String,Object> rsvGolfOne = RsvGolfDAO.selectRsvGolfOne();
		System.out.println(rsvGolfOne + "<==rsvGolfOne.rsvGolfOne");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>회원예약 상세보기</h1>
			<a href="/Semi_F_GDCC/admin/golf/rsvGolfList.jsp">
				리스트로돌아가기
			</a>
			<table>
				<tr>
					<th>
						예약번호
					</th>
					<td>
						<%=rsvGolfOne.get("rsvNo") %>
					</td>
				</tr>
				<tr>
					<th>
						고객성함
					</th>
					<td>
						<%=rsvGolfOne.get("cusName") %>
					</td>
				</tr>
				<tr>
					<th>
						e-mail
					</th>
					<td>
						<%=rsvGolfOne.get("rsvMail") %>
					</td>
				</tr>
				<tr>
					<th>
						연락처
					</th>
					<td>
						<%=rsvGolfOne.get("cusContact") %>
					</td>
				</tr>
				<tr>
					<th>
						날짜
					</th>
					<td>
						<%=rsvGolfOne.get("rsvDate") %>
					</td>
				</tr>
				<tr>
					<th>
						시작코스
					</th>
					<td>
						<%=rsvGolfOne.get("rsvCourse") %>
					</td>
				</tr>
				<tr>
					<th>
						T-TIME
					</th>
					<td>
						<%
							// rsvTtime을 정수로 바꿔주기
							int rsvTtime = Integer.parseInt((String)rsvGolfOne.get("rsvTtime"));
							
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
					<th>
						동반인원
					</th>
					<td>
						<%=rsvGolfOne.get("rsvMember") %>
					</td>
				</tr>
				<tr>
					<th>
						요청사항
					</th>
					<td>
						<%
							if(rsvGolfOne.get("rsvRequest") == null){
						%>
							<span>고객의 요청사항이 없습니다</span>
						<%
							}else{
						%>
								<%=rsvGolfOne.get("rsvRequest") %>
						<%
							}
						%>
				
					</td>
				</tr>
			</table>
	</div>
</body>
</html>