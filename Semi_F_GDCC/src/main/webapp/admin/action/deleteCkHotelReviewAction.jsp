<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	
	//form에서 입력한 아이디 비번 값 가져오기
	String checkId = request.getParameter("checkId");
	System.out.println(checkId+"<-- checkId deleteCkHotelReviewAction.jsp param");
	
	int checkPw = Integer.parseInt(request.getParameter("checkPw"));
	System.out.println(checkPw+"<-- checkPw deleteCkHotelReviewAction.jsp param");
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<-- rsvNo deleteCkHotelReviewAction.jsp param ");
				
	boolean ck = AdminDAO.selectIdPwCk(checkId, checkPw);
	if(ck == false){
		System.out.println("인증 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/deleteHotelReviewForm.jsp?rsvNo="+rsvNo+"&checkId="+checkId+"&ck=F");
	}else{
		System.out.println("인증 성공 ");
		response.sendRedirect("/Semi_F_GDCC/admin/deleteHotelReviewForm.jsp?rsvNo="+rsvNo+"&checkId="+checkId+"&ck=T");
								
	}

%>