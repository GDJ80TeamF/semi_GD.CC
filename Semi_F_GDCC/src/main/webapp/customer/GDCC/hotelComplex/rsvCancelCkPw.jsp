<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@ page import="gdcc.dao.*" %>
 <%
 

	//인증 분기 세션 변수 이름 : loginCustomer
		if(session.getAttribute("loginCustomer") == null){
			response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
			return;
	}
	HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
	
	String cusMail = (String)(login.get("cusMail"));
 	String ckPw = request.getParameter("checkPw");
 	int rsvComNo = Integer.parseInt(request.getParameter("rsvComNo"));
 	
 	System.out.println(cusMail);
 	System.out.println(ckPw);
 
 %>
<%
	//ck값분기
	boolean result = CustomerDAO.selectCustomePwCk(cusMail, ckPw);
	if(result == true){ //삭제가능ck =T
		System.out.println("비밀번호 확인 완료 ");
		response.sendRedirect("/Semi_F_GDCC/customer/hotelComplex/cancelRsvForm.jsp?rsvComNo="+rsvComNo+"&ck=T");
	}else{
		System.out.println("비밀번호 확인 실패  ");
		response.sendRedirect("/Semi_F_GDCC/customer/hotelComplex/cancelRsvForm.jsp?rsvComNo="+rsvComNo+"&ck=F");
	}
%>