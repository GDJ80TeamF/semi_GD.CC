<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*"%>
<%
	//카테고리 만들 리스트 출력
	//1. 숙박, 2.조식, 3.부대시설
	
	//부대시설
	HashMap<String,Object>comCnt =
		RsvComplexDAO.rsvComplexCnt();

	int comCount = (int)comCnt.get("comCnt");

	System.out.println(comCount + "<===부대시설예약갯수");
	
	String table= request.getParameter("table");
	
	ArrayList<HashMap<String,Object>> comList = new ArrayList<HashMap<String,Object>>();

	//리스트목록
	if(table !=null && table.equals("rsv_complex")){
		
 		comList = RsvComplexDAO.rsvList(comCount);
	}
	
	System.out.println(comList + "<==부대시설예약리스트");


	
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
				호텔 (총)
			</a>
			<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?table=rsv_complex">		
				부대시설(총 <%=comCount%>)
			</a>
			<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?table=rsv_bf">
				조식 (총)
			</a>
		</div>
	
		<div>
			<%
			if(table != null && table.equals("rsv_complex")){
			%>
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
		                    	<%=m.get("rsvPlace") %>
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
	</div>
</body>
</html>