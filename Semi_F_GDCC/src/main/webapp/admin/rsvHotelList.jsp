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

	System.out.println(comCount + "<===부대시설갯수");
	
	//리스트목록
	
	ArrayList<HashMap<String,Object>> comList 
		= RsvComplexDAO.rsvList(comCount);

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelList</title>
</head>
<body>
	<div>
		<h1>호텔관련 예약리스트</h1>
		
		<!-- 숙박 조식 부대시설 순으로 총 예약갯수 출력 -->
		
		<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?cnt=<%=comCount%>">		
			부대시설(<%=comCount%>)
		</a>
	</div>
	
	<div>
		<%
		
			for(HashMap<String,Object>m : comList){
		%>
				<table>
					<tr>
						<th>예약번호 </th>
						<th>시설</th>
						<th>날짜</th>
						<th>시간</th>
					</tr>
					<tr>
						<td>
							<%=m.get("rsvComNo") %>
						</td>
					</tr>
				</table>
		<%
			}
		%>
	</div>

</body>
</html>