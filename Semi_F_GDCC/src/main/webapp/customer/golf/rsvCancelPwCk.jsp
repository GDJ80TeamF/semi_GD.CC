<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%

	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	String cusMail = request.getParameter("cusMail");
	String ckPw = request.getParameter("ckPw");
	
		System.out.println(cusMail + "<==rsvCancelPwCk.cusMail");
		System.out.println(ckPw + "<==rsvCancelPwCk.ckPw");
		
		boolean pw = CustomerDAO.selectCustomePwCk(cusMail, ckPw);
		
			System.out.println(pw + "<==비밀번호결과");
			
			
		if(pw == true){//비밀번호값이 일치하면
			response.sendRedirect("/Semi_F_GDCC/customer/golf/action/rsvCancelAction.jsp?rsvNo=" + rsvNo);
		}else{
			//비밀번호가 일치하지 않으면?
			response.sendRedirect("/Semi_F_GDCC/customer/golf/rsvCancelForm.jsp?msg=F&rsvNo=" + rsvNo);
		}
			
	
%>