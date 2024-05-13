<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="gdcc.dao.NoticeDAO"%>
<%@page import="java.util.HashMap"%>
<%
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>  

<%
	/* 아아디, 비밀번호 체크 */
	String checkId = request.getParameter("checkId");
	
	if(checkId == null) {
		checkId = "";
	}
	String ck = request.getParameter("ck");
	System.out.println("ck: " + ck);
	if(ck == null) {
		ck = "";
	}
	String msg = "";
	if(ck.equals("T")){
		msg = "삭제할 수 있는 비밀번호입니다.";
	} else if(ck.equals("F")){		
		msg = "삭제할 수 없는 비밀번호 입니다. 확인 후 다시 입력해주세요.";
	}
	System.out.println("checkId: " + checkId);
	
	 int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	System.out.println("noticeNo: " + noticeNo); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/Semi_F_GDCC/admin/action/deleteCkNoticeAction.jsp">
		<!-- 공지번호 -->
		공지를 삭제하시겠습니까? 삭제하려면 아이디와 비번을 비교해야 됩니다.<br>
		아이디: <input type="text" name="checkId"><br>
		비번: <input type="password" name="checkPw">
	 	<input type="text" name="noticeNo" value=<%=noticeNo%> style="display:none;">   
		<button type="submit">비교</button>
	</form>
		<!-- 비번 비교후 메세지 출력 -->
		<%
			if(ck.equals("T")){
		%>
			<%=msg%>
			<form method="post" action="/Semi_F_GDCC/admin/action/deleteNoticeAction.jsp?noticeNo=<%=noticeNo%>">
				<button type="submit">삭제하기</button>
			</form>
		<%
			}
		%>
	<a href="/Semi_F_GDCC/admin/noticeList.jsp">취소</a>
</body>
</html>