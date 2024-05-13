<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
	HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
	
	String cusMail = (String)(login.get("cusMail"));
%>
<%
	int rsvComNo = Integer.parseInt(request.getParameter("rsvComNo"));

	HashMap<String,Object> m = RsvComplexDAO.selectRsvOne(rsvComNo);
	
	//비번체크후 ck값 받아오기
	String ck = request.getParameter("ck");
	if(ck == null){
		ck = " ";
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>예약정보 확인</h4>
	<table>
		<tr>
			<td>시설 예약번호 </td>
			<td><%=(Integer)m.get("comNo") %></td>
		</tr>
		<tr>
			<td>예약한 시설</td>
			<td><%=(String)m.get("rsvPlace") %></td>
		</tr>
		<tr>
			<td>예약 날짜 </td>
			<td><%=(String)m.get("rsvDate") %></td>
		</tr>
		<tr>
			<td>예약 시간 </td>
			<td><%=(String)m.get("rsvTime") %></td>
		</tr>
		<tr>
			<td>예약 인원수</td>
			<td><%=(Integer)m.get("rsvMember") %></td>
		</tr>
		
	
	</table>
	
	<%
		if(ck.equals("T")){
	%>	
		<a href="/Semi_F_GDCC/customer/hotelComplex/cancelRsvAction.jsp?rsvComNo=<%=(Integer)m.get("comNo") %>">예약 취소하기</a>
	
	<% 	
		}else if(ck.equals("F")){
	%>
		<div>비밀번호 확인에 실패했습니다.다시한번 시도해주세요. </div>
	<% 		
		}else{
	%>
		<div>원활한 예약취소를 위해 비밀번호를 한번 더 입력해주세요. 취소된 예약은 되돌리기가 불가능합니다.</div>
	<form  method="post" action="/Semi_F_GDCC/customer/hotelComplex/rsvCancelCkPw.jsp?rsvComNo=<%=(Integer)m.get("comNo") %>">
		비밀번호 확인 : <input name="checkPw" type="password">
		<button type="submit">비밀번호 확인</button>
	</form>
	<%	
		}
	%>
	
</body>
</html>