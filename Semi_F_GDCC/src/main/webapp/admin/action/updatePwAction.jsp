<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.net.URLEncoder" %>
<%

	String adminMail = request.getParameter("adminMail");
	String oldPw = request.getParameter("oldPw");
	String newPw = request.getParameter("newPw");
	
	//디버깅 
	System.out.println("=== updatePwAction.jsp 디버깅 ===");
	System.out.println(adminMail);
	System.out.println(oldPw);
	System.out.println(newPw);
	//변경실패시 출력될 에러 메세지
	String msg = "최근 이력에 존재하는 비밀번호이거나 현재 비밀번호가 일치하지 않습니다. 다른 비밀번호를 시도해 주세요.";
	
	int row = AdminDAO.insertNewPwHistory(adminMail, oldPw, newPw);
	if(row != 0){
		//추가된 이력테이블의 비번으로 admin 테이블 업데이트 
		int row2 = AdminDAO.updateResetPw(adminMail, newPw);
		if(row2 != 0){
			System.out.println("admin table admin_pw 업데이트 완료");
		}
		System.out.println("비밀번호 업데이트 완료 ");
		response.sendRedirect("/Semi_F_GDCC/admin/myPage.jsp?adminMail="+adminMail);
	}else{
		System.out.println("비밀번호 업데이트 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/updatePwForm.jsp?adminMail="+adminMail+"&error="+URLEncoder.encode(msg,"UTF-8"));
	}
	






%>