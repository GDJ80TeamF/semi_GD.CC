<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	
	//form에서 입력한 아이디 비번 값 가져오기
	String checkId = request.getParameter("checkId");
	System.out.println(checkId+"<-- checkId deleteCkGolfReviewAction.jsp param");
	
	int checkPw = Integer.parseInt(request.getParameter("checkPw"));
	System.out.println(checkPw+"<-- checkPw deleteCkGolfReviewAction.jsp param");
	
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	System.out.println(reviewNo + "<-- reviewNo deleteCkGolfReviewAction.jsp param ");
				
	boolean ck = AdminDAO.selectIdPwCk(checkId, checkPw);
	if(ck == false){
		System.out.println("인증 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/deleteGolfReviewForm.jsp?reviewNo="+reviewNo+"&checkId="+checkId+"&ck=F");
	}else{
		System.out.println("인증 성공 ");
		response.sendRedirect("/Semi_F_GDCC/admin/deleteGolfReviewForm.jsp?reviewNo="+reviewNo+"&checkId="+checkId+"&ck=T");
								
	}

%>