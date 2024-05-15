<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	//고객mail과 새로운 비밀번호 불러오기
	
	String mail = request.getParameter("mail");
	String newPw = request.getParameter("newPw");
	
		System.out.println(mail + "<==resetPwAction.mail");
		System.out.println(newPw + "<==resetPwAction.pw");
		
		
		//history테이블에 추가 
		
		int update = CustomerDAO.updatePw(mail, newPw);
		
			System.out.println(update + "<==update");
			
		int update2 = CustomerDAO.updatePw2(mail);
			
	if(update2 == 1){
		
		System.out.println("변경성공!");
		response.sendRedirect("/Semi_F_GDCC/customer/findPwForm.jsp?msg=G");
	}
%>