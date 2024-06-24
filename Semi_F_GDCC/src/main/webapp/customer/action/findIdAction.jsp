<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	//아이디 찾기위한 정보 가져오기
	String cusName = request.getParameter("cusName");
	String cusBirth	= request.getParameter("cusBirth");
	String cusContact = request.getParameter("cusContact");
		System.out.println(cusName + "<==findIdAction.cusName");
		System.out.println(cusBirth + "<==findIdAction.cusBirth");
		System.out.println(cusContact + "<==findIdAction.cusContact");
		
		
	HashMap<String ,Object> cusMail = CustomerDAO.selectFindId(cusName, cusBirth, cusContact);
		System.out.println(cusMail + "<==findIdAction.cusMail");
		
		String mail = (String)cusMail.get("cusMail");
		 
		//메일값 들어오는거 확인
		
		if(cusMail == null || cusMail.isEmpty()){
			System.out.println("메일찾기 실패");
			response.sendRedirect("/Semi_F_GDCC/customer/GDCC/findIdForm.jsp?msg=F");
		}else{
			
			System.out.println("메일찾기 성공");
			response.sendRedirect("/Semi_F_GDCC/customer/GDCC/findIdForm.jsp?msg=T&mail="+mail);
		}
%>