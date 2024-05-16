<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.net.URLEncoder" %>
<%

	
	String adminMail = request.getParameter("checkedId");
	String newPw = request.getParameter("newPw");
	
	System.out.println(adminMail);
	System.out.println(newPw);
	
	//변경실패시 출력될 에러 메세지
	String msg = "최근 이력에 존재하는 비밀번호입니다. 다른 비밀번호를 시도해 주세요.";
	
	//새 비번으로 이력에 먼저 넣기 
	
	int row = AdminDAO.insertPwHistory(adminMail, newPw);
	if(row != 0){
		int row2 = AdminDAO.updateResetPw(adminMail, newPw);
		//이력에 새 비번이 들어간 경우 (겹치는 이력이 없다 ) --> 해당 비번으로 admin table pw 업데이트 
			if(row2 != 0){
				System.out.println("admin table 비번 업데이트 완료");
			}
		System.out.println("비번 리셋 성공 ");
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
	}else{
		System.out.println("비번 리셋 실패 ");
		response.sendRedirect("/Semi_F_GDCC/admin/adminResetPwForm.jsp?checkId="+adminMail+"&ck=T&error="+URLEncoder.encode(msg,"UTF-8"));
	}
	



%>