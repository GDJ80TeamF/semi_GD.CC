<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*"%>
<%
	//페이징하기

	int currentPage = 1; 

	int rowPerPage = 10;
	int startRow = (currentPage-1) * rowPerPage;
	
	//메세지
	String msg = request.getParameter("msg");
	
	if(msg == null){
		msg = "";
	}else if(msg.equals("T")){
		msg = "변경성공";
	}else{
		msg = "변경실패";
	}


	//카테고리 만들 리스트 출력
	//1. 숙박, 2.부대시설, 3.조식을 get방식으로 table 분기
	
	String table= request.getParameter("table");
	//=====숙박
		HashMap<String,Object>hotelCnt =
			RsvHotelDAO.rsvHotelCnt();

		int hotelTotalRow = (int)hotelCnt.get("hotelCnt");
			System.out.println(hotelTotalRow + "<==호텔예약갯수");
			
			//페이징
			int hotelLastPage = hotelTotalRow / rowPerPage; 
			
			//마지막 페이지가 안떨어질때를 위해서 분기
			if(hotelTotalRow % rowPerPage != 0) {
				hotelLastPage = hotelLastPage + 1;
			   }
		
		//숙박 table
		ArrayList<HashMap<String,Object>> hotelList = new ArrayList<HashMap<String,Object>>();
		
		
		//숙박리스트목록
		if(table != null && table.equals("rsv_hotel")){
	 		hotelList = RsvHotelDAO.rsvList(startRow, rowPerPage);
				System.out.println(hotelList + "<==호텔예약리스트");	
		}
	
	//=====부대시설
		HashMap<String,Object>comCnt =
			RsvComplexDAO.rsvComplexCnt();
	
			int comTotalRow = (int)comCnt.get("comCnt");
			System.out.println(comTotalRow + "<===부대시설예약갯수");
			
			//페이징
			int comLastPage = comTotalRow / rowPerPage; 
			
			//마지막 페이지가 안떨어질때를 위해서 분기
			if(comTotalRow % rowPerPage != 0) {
				comLastPage = comLastPage + 1;
			   }
		
		//부대시설 table
			ArrayList<HashMap<String,Object>> comList = new ArrayList<HashMap<String,Object>>();
	
		if(table !=null && table.equals("rsv_complex")){
			comList = RsvComplexDAO.rsvList(startRow, rowPerPage);
				System.out.println(comList + "<==부대시설 예약 리스트");
		}
	//======조식
		HashMap<String,Object>bfCnt =
			RsvBfDAO.rsvBfCnt();
			
		int bfTotalRow = (int)bfCnt.get("bfCnt");
			System.out.println(bfTotalRow + "<===조식예약갯수");
			
			//페이징
			int bfLastPage = bfTotalRow / rowPerPage; 
			
			//마지막 페이지가 안떨어질때를 위해서 분기
			if(bfTotalRow % rowPerPage != 0) {
				bfLastPage = bfLastPage + 1;
			   }
		
		//조식 table
		
		ArrayList<HashMap<String,Object>> bfList = new ArrayList<HashMap<String,Object>>();
			
		//조식 리스트 목록
		if(table !=null && table.equals("rsv_bf")){
			bfList = RsvBfDAO.rsvList();
				System.out.println(bfList + "<==조식예약리스트");
		}
			


	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelList</title>
</head>
<body>
	<h1>호텔관련 예약리스트</h1>
		<div>
			
			<!-- 숙박 부대시설 조식 순으로 총 예약갯수 출력 -->
			
			<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?table=rsv_hotel">
				호텔 (총 <%=hotelTotalRow %>)
			</a>
			<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?table=rsv_complex">		
				부대시설(총 <%=comTotalRow%>)
			</a>
			<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?table=rsv_bf">
				조식 (총<%=bfTotalRow %>)
			</a>
		</div>
		
		<div class="page">
		
		</div>
	
	<div class="hotel">
			<%
				if(table != null && table.equals("rsv_hotel")){
			%>
				<table>
					<tr>
						<th>성함</th>
						<th>연락처</th>
						<th>예약번호</th>
						<th>룸</th>
						<th>상세</th>
						<th>예약상태</th>
					</tr>
					
					<%
						for(HashMap<String,Object> m : hotelList){
					%>
						<tr>
							<td>
								<%=m.get("name") %>
							</td>
							<td>
								<%=m.get("contact") %>
							</td>
							<td>
								<%=m.get("rsvNo") %>	
							</td>
							<td>
								<%
									int roomNo = (int) m.get("roomNo");
									
									switch(roomNo){
										case 1 : 
											out.print("디럭스");
											break;
										
										case 2 :
											out.print("디럭스(마운틴뷰)");
											break;
											
										case 3 :
											out.print("디럭스(오션뷰)");
											break;
										
										case 4 :
											out.print("패밀리(마운틴뷰)");
											break;
										
										case 5 :
											out.print("패밀리(오션뷰)");
											break;
									
									}
								
								%>
							</td>
							<td>
								<a href="/Semi_F_GDCC/admin/rsvHotelOne.jsp?rsvNo=<%=m.get("rsvNo") %>">
									상세보기
								</a>
							</td>
							<td>
								<%=m.get("rsvState") %>♥️<%=msg %>♥️
								<form action="/Semi_F_GDCC/admin/action/rsvHotelStateAction.jsp">
									<input type="hidden" name ="rsvNo" value="<%=m.get("rsvNo") %>">
									<select name ="rsvState">
										<option>==상태변경==</option>
										<option value="예약완료">예약완료</option>
										<option value="예약취소">예약취소</option>
										<option value="변경요청">변경요청</option>
										<option value="예약만료">예약만료</option>
										<option value="예약부도">예약부도</option>
									</select>
									<button type="submit">변경</button>
								</form>
							</td>
						</tr>
					<%
						}
					%>
				</table>
				<div>														
					<%
						if(currentPage > 1){			
					%>
						<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?currentPage=1">FIRST</a>
						<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?currentPage=<%=currentPage-1%>">PRE</a>										
					<%						
						}if(currentPage > hotelLastPage){
					%>
						<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?currentPage=<%=currentPage+1%>">NEXT</a>
						<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?currentPage=<%=hotelLastPage%>">LAST</a>
					<%
						}					
					%>		
				</div>
				
			<%
				}
			%>
	</div><!-- class = hotel -->
		<div class="complex">
			<%
			if(table != null && table.equals("rsv_complex")){
			%>	
				<table>
					<tr>
						<th>예약No</th>
						<th>RoomNo</th>
						<th>이용시설</th>
						<th>날짜</th>
						<th>예약상태</th>
					</tr>
					<%
						for(HashMap<String,Object> m : comList){
					%>
						<tr>
							<td>
								<%=m.get("comNo") %>
							</td>
							<td>
								<%=m.get("roomNo") %>
							</td>
							<td>
								<%=m.get("complexName") %>
							</td>
							<td>
								<%=m.get("rsvDate") %>
							</td>
							<td>
								<%=m.get("rsvState") %>
							</td>
						</tr>
					<%
						}
					%>
				</table>
			<%
			}
			%>
	</div><!-- class = complex -->
	
	<div class="bf">
		<%
			if(table !=null && table.equals("rsv_bf"))	{	
		%>
			<table>
				<tr>
					<th>예약번호</th>
					<th>RoomNo</th>
					<th>예약날짜</th>
					<th>예약시간</th>
					<th>상세</th>
					<th>예약상태</th>
				</tr>
				<%
					for(HashMap<String,Object> m : bfList){
				%>
					<tr>
						<td>
							<%=m.get("rsvBfNo") %>
						</td>
						<td>
							<%=m.get("roomNo") %>
						</td>
						<td>
							<%=m.get("rsvDate") %>
						</td>
						<td>
							<%=m.get("rsvTime") %>
						</td>
						<td>
							<a href="/Semi_F_GDCC/admin/rsvBfOne.jsp?rsvBfNo=<%=m.get("rsvBfNo") %>">
								상세보기
							</a>
						</td>
						<td>
							<%=m.get("rsvState") %>
						</td>
					</tr>
				<%
					}
				%>
			</table>
			<div>														
				<%
					if(currentPage > 1){			
				%>
					<a href="/Semi_F_GDCC/admin/golf/rsvGolfList.jsp?currentPage=1">FIRST</a>
					<a href="/Semi_F_GDCC/admin/golf/rsvGolfList.jsp?currentPage=<%=currentPage-1%>">PRE</a>										
				<%						
					}if(currentPage > bfLastPage){
				%>
					<a href="/Semi_F_GDCC/admin/golf/rsvGolfList.jsp?currentPage=<%=currentPage+1%>">NEXT</a>
					<a href="/Semi_F_GDCC/admin/golf/rsvGolfList.jsp?currentPage=<%=bfLastPage%>">LAST</a>
				<%
					}					
				%>		
			</div>
		<%
			}
		%>
	</div><!--  class = bf -->
</body>
</html>