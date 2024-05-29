<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import="java.net.URLEncoder" %>
<%
	//form 페이지에서 받아오기
	String mail = request.getParameter("mail");
	String oldPw = request.getParameter("oldPw");
	String newPw = request.getParameter("newPw");
	
	//디버깅 => 값 들어오는거 확인
		System.out.println(mail + "<==updatePwACtion.mail");
		System.out.println(oldPw + "<==updatePwACtion.oldPw");
		System.out.println(newPw + "<==updatePwACtion.newPw");
	//에러메세지 출력하기 
	String msg = "최근 변경하신 비밀번호이거나 현재 비밀번호가 일치하지 않습니다. 다시 시도해 주세요.";
		
	//newPw를 history_pw 테이블에 insert하기
	
	int historyPw = CustomerDAO.insertPw(mail,oldPw, newPw);
		//디버깅해서 1 나오는지 확인=>1나옴
		
		System.out.println(historyPw + "<==updatePwAction.historyPw");
		
		
	//history_pw테이블과 customer테이블을 연결시키기
	
	if(historyPw == 1){
		int changepw = CustomerDAO.updatePw2(mail);
			if( changepw != 0){
				//변경성공
				System.out.println("추가성공");
				response.sendRedirect("/Semi_F_GDCC/customer/GDCC/myPage.jsp?mail="+mail);
			}
	}else{
		//변경실패
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/myPage.jsp?mail="+mail+"&error="+URLEncoder.encode(msg,"UTF-8"));
	}
%>