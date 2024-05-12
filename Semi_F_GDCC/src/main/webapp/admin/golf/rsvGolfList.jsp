<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*"%>
<%

	//페이징 하기
	int currentPage = 1; 

	int rowPerPage = 10;
	int startRow = (currentPage-1) * rowPerPage;
	
	int totalRow = RsvGolfDAO.allGolfList();
	
	System.out.println(totalRow + "<==rsvGolfList.totalRow 총 갯수");
	
	int lastPage = totalRow / rowPerPage; 
	
	//마지막 페이지가 안떨어질때를 위해서 분기
	if(totalRow % rowPerPage != 0) {
		lastPage = lastPage + 1;
	   }
	
	//예약 리스트 불러오기
	
	ArrayList<HashMap<String,Object>> golfList
		= RsvGolfDAO.selectRsvgolf(startRow, rowPerPage);
	
		System.out.println(golfList + "<==rsvGolfList.golfList");
	
	//state변경 실패
	String msg = request.getParameter("msg");
	
	if(msg == null){
		msg ="";
	}else if(msg.equals("F")){
		msg = "변경 실패하였습니다";
	}else{
		msg="변경성공";
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
		<h1>고객 예약 리스트</h1>
		
			<table>
				<tr>
					<th>
						예약NO
					</th>
					<th>
						고객성함
					</th>
					<th>
						라운딩날
					</th>
					<th>
						T-TIME
					</th>
					<th>
						예약상태
					</th>
					<th>
						
					</th>
					
				</tr>
				<tr>
					<%
						for(HashMap<String,Object> m : golfList){
					%>
							<td>
								<%=m.get("rsvNo") %>
							</td>
							<td>
								<%=m.get("cusName") %>
							</td>
							<td>
								<%=m.get("rsvDate") %>
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
							<td>
								<%=m.get("rsvState") %><br>
								<form action="/Semi_F_GDCC/admin/action/rsvGolfStateAction.jsp">
									<input type="hidden" name="rsvNo" value="<%=m.get("rsvNo") %>">
										<select name="rsvState">
											<option>==상태변경==</option>
											<option value="예약신청완료">예약신청완료</option>
											<option value="예약완료">예약완료</option>
											<option value="예약취소">예약취소</option>
											<option value="변경요청">변경요청</option>
											<option value="예약만료">예약만료</option>
											<option value="예약부도">예약부도</option>
										</select>
									<button type="submit">변경</button>
									<%=msg %>
								</form>
							</td>
							<td>
								<a href="/Semi_F_GDCC/admin/golf/rsvGolfOne.jsp?rsvNo=<%=m.get("rsvNo") %>">
									상세보기
								</a>							
							</td>
						<%
							}
						%>
				</tr>
			</table>
	</div>
	<div>														
		<%
			if(currentPage > 1){			
		%>
			<a href="/Semi_F_GDCC/admin/golf/rsvGolfList.jsp?currentPage=1">FIRST</a>
			<a href="/Semi_F_GDCC/admin/golf/rsvGolfList.jsp?currentPage=<%=currentPage-1%>">PRE</a>										
		<%						
			}if(currentPage < lastPage){
		%>
			<a href="/Semi_F_GDCC/admin/golf/rsvGolfList.jsp?currentPage=<%=currentPage+1%>">NEXT</a>
			<a href="/Semi_F_GDCC/admin/golf/rsvGolfList.jsp?currentPage=<%=lastPage%>">LAST</a>
		<%
			}					
		%>		
	</div>
		
</body>
</html>