<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%
	//form 페이지에서 받아오기
	String mail = request.getParameter("mail");
	String oldPw = request.getParameter("oldPw");
	String newPw = request.getParameter("newPw");
	
	//디버깅 => 값 들어오는거 확인
		System.out.println(mail + "<==updatePwACtion.mail");
		System.out.println(oldPw + "<==updatePwACtion.oldPw");
		System.out.println(newPw + "<==updatePwACtion.newPw");
		
	//newPw를 history_pw 테이블에 insert하기
	
	int historyPw = CustomerDAO.updatePw(mail, newPw);
		//디버깅해서 1 나오는지 확인=>1나옴
		
		System.out.println(historyPw + "<==updatePwAction.historyPw");
		
		
	//history_pw테이블과 customer테이블을 연결시키기
	int changepw = CustomerDAO.updatePw2(mail);
	
		
		if( changepw == 1){
			//변경성공
			System.out.println("추가성공");
			response.sendRedirect("/Semi_F_GDCC/customer/myPage.jsp");
			
		}else{
			//변경실패
			response.sendRedirect("/Semi_F_GDCC/customer/updateMyInfoForm.jsp");
		}
	
%>