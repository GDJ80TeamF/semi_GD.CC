<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*"%>
<%
	//카테고리 만들 리스트 출력
	//1. 숙박, 2.부대시설, 3.조식을 get방식으로 table 분기
	
	String table= request.getParameter("table");
	
	//=====숙박
	HashMap<String,Object>hotelCnt =
		RsvHotelDAO.rsvHotelCnt();

	int hotelCount = (int)hotelCnt.get("hotelCnt");
		System.out.println(hotelCount + "<==호텔예약갯수");
		
	//숙박 table
	ArrayList<HashMap<String,Object>> hotelList = new ArrayList<HashMap<String,Object>>();
	//숙박리스트목록
	if(table != null && table.equals("rsv_hotel")){
 		hotelList = RsvHotelDAO.rsvList();
			System.out.println(hotelList + "<==호텔예약리스트");	
	}
	
	//=====부대시설
	HashMap<String,Object>comCnt =
		RsvComplexDAO.rsvComplexCnt();

	int comCount = (int)comCnt.get("comCnt");
		System.out.println(comCount + "<===부대시설예약갯수");
	
	//부대시설 table

	ArrayList<HashMap<String,Object>> comList = new ArrayList<HashMap<String,Object>>();

	//부대시설 리스트목록
	if(table !=null && table.equals("rsv_complex")){
 		comList = RsvComplexDAO.rsvList();
			System.out.println(comList + "<==부대시설예약리스트");
	}
	
	
/* 	//부대시설 카테고리
	ArrayList<HashMap<String,Object>> category = RsvComplexDAO.comCategory();
		System.out.println(category + "<==부대시설 카테고리"); */
	//======조식
	


	
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
				호텔 (총 <%=hotelCount %>)
			</a>
			<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?table=rsv_complex">		
				부대시설(총 <%=comCount%>)
			</a>
			<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?table=rsv_bf">
				조식 
			</a>
		</div>
	
		<div class="complex">
			<%
			if(table != null && table.equals("rsv_complex")){
			%>	
				<a>
					수영장
				</a>
				<a>
					헬스장
				</a>
				<table>
					  <tr>
		                  <th>예약번호</th>
		                  <th>시설</th>
		                  <th>날짜</th>
		                  <th>시간</th>
		              </tr>
		              <%
		              	for(HashMap<String,Object> m : comList) {
		              %>
		              	<tr>
		                    <td>
		                        <%=m.get("rsvComNo") %>
		                    </td>
		                    <td>
		                    	<%
									int rsvComNo = (int) m.get("rsvComNo");
									
									switch(rsvComNo){
										case 1 : 
											out.print("수영장");
											break;
										
										case 2 :
											out.print("헬스장");
											break;
									}
								%>
		                    </td>
		                    <td>
		                    	<%=m.get("rsvDate") %>
		                    </td>
		                    <td>
		                    	<%=m.get("rsvTime") %>
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
	</div><!-- class = hotel -->
</body>
</html>