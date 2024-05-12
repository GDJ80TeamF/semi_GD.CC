<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*"%>
<%
	//예약카테고리 출력
	
	ArrayList<HashMap<String,Object>>allCategory 
		= RsvHotelDAO.selectRsvHotelList();

	System.out.println(allCategory + "<==rsvHotelList");
	
	//전체예약리스트 출력
	ArrayList<HashMap<String,Object>>allRsv 
		= RsvHotelDAO.allRsvList();
	
	System.out.println(allRsv + "<==allRSV");
	
	
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
		
		<!-- 카테고리 먼저 출력 -->
			<%
				for(HashMap<String,Object> m : allCategory){
			%>
				<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?hotel=<%=m.get("hotel")%>">
					숙박(<%=m.get("hotel")%>)
				</a>
				<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?bf=<%=m.get("bf")%>">
					조식(<%=m.get("bf")%>)
				</a>
				<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?complex=<%=m.get("complex")%>">
					부대시설(<%=m.get("complex")%>)
				</a>
				<a href="/Semi_F_GDCC/admin/rsvHotelList.jsp?cnt=<%=m.get("cnt")%>">
					전체(<%=m.get("cnt") %>)
				</a>
			<%
				}
			%>
	</div>

</body>
</html>