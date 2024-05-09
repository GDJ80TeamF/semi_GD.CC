<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.util.*" %>
<%
	//회원탈퇴를 위해서 고객이 작성한 pw와 데이터에 있는 customerPw가 일치하는지 확인
	String cusMail = request.getParameter("cusMail");
	String pw = request.getParameter("pw"); //고객작성 pw가져오기
		System.out.println(cusMail + "<==deleteCustomerAction.cusMail");
		System.out.println(pw + "<==deleteCustomerACtion.고객작성pw");
	
	//개인정보 일치하는지 확인
	
	int delete = CustomerDAO.deleteCus(cusMail, pw);
	
	//delete가 0이 아니면 성공, 0 이면 실패
	if(delete != 0){
		//성공
		System.out.println("삭제성공");
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		
	}else{
		//실패
		System.out.println("삭제실패");
		response.sendRedirect("/Semi_F_GDCC/customer/deleteCustomerForm.jsp");
		
	}

%>