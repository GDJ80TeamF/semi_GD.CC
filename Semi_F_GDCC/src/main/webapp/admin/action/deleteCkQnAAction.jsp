<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	// <- 커밋
	//form에서 입력한 아이디 비번 값 가져오기
	String checkId = request.getParameter("checkId");
	System.out.println(checkId+"<-- checkId deleteCkQnAAction.jsp param");
	
	int checkPw = Integer.parseInt(request.getParameter("checkPw"));
	System.out.println(checkPw+"<-- checkPw deleteCkQnAAction.jsp param");
	
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<-- qnaNo deleteQnAForm.jsp param ");
				
	boolean ck = QnaDAO.selectIdPwCk(checkId, checkPw);
	if(ck == false){
		System.out.println("인증 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/deleteQnAForm.jsp?qnaNo="+qnaNo+"&checkId="+checkId+"&ck=F");
	}else{
		System.out.println("인증 성공 ");
		response.sendRedirect("/Semi_F_GDCC/admin/deleteQnAForm.jsp?qnaNo="+qnaNo+"&checkId="+checkId+"&ck=T");
								
	}

%>