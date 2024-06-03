<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.util.*" %>
<%


	//인증 분기 세션 변수 이름 : loginCustomer
		if(session.getAttribute("loginCustomer") == null){
			response.sendRedirect("/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp");
			return;
	}
	HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
	
	String cusMail = (String)(login.get("cusMail"));
	
	int rsvComNo = Integer.parseInt(request.getParameter("rsvComNo"));

	int row = RsvComplexDAO.deleteRsv(rsvComNo);
	
	if(row != 0){
		System.out.println("예약 취소 완료");
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/rsvComplexList.jsp?cusMail="+cusMail);
	}else{
		System.out.println("예약 취소 실패 ");
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/rsvComplexList.jsp?cusMail="+cusMail);
	}


%>