<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	String cusMail = request.getParameter("cusMail"); 
	String cusContact = request.getParameter("cusContact");
	String cusName = request.getParameter("cusName");
			System.out.println(cusMail + "<==findPwACtion.cusMail");
			System.out.println(cusContact + "<==findPwACtion.cusContact");
			System.out.println(cusName + "<==findPwACtion.cusName");
			
	//회원 비밀번호 가져오기
	
	HashMap<String,Object> findMail = CustomerDAO.selectFindPw(cusMail, cusName, cusContact);
		System.out.println(findMail + "<==findPwAction.mail");
		
 		String mail = (String) findMail.get("mail");
		
		if(mail == null || findMail.isEmpty()){
			System.out.println("찾기 실패");
			response.sendRedirect("/Semi_F_GDCC/customer/GDCC/findPwForm.jsp?msg=F");
		}else{
			
			System.out.println("찾기 성공");
			response.sendRedirect("/Semi_F_GDCC/customer/GDCC/findPwForm.jsp?msg=T&mail="+mail);
		}
%>