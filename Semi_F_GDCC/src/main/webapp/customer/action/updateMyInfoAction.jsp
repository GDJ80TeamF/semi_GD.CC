<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.*"%>
<%@ page import="gdcc.dao.*"%>
<%
	//바뀐 정보들 가져오기 ->이름, 연락처, 성별 프로필 사진만 변경
	
	String cusName = request.getParameter("cusName");
	String cusGender = request.getParameter("cusGender");
	String cusContact = request.getParameter("cusContact");
	String cusProfile = request.getParameter("cuspProfile");
	String cusMail = request.getParameter("cusMail");
	
	//디버깅자리
	System.out.println(cusProfile + "<==updateMyInfoAction.cusProfile");
	
	
	//update된 CustomerDAO랑 연결
	
	int update = CustomerDAO.updateCustomerInfo(cusName, cusGender, cusContact, cusProfile, cusMail);
		System.out.println(update + "<==updateMyInfoAction.update");
	
		//update 확인
		if(update == 1){
			//update성공 -> myPage로 보내기
			response.sendRedirect("/Semi_F_GDCC/customer/myPage.jsp");
		}else{
			//update실패 -> updateMyInfoForm.jsp로 보내기
			//오류 메세지
			String errMsg = URLEncoder.encode("회원정보 수정에 실패했습니다." ,"utf-8");
			response.sendRedirect("/Semi_F_GDCC/customer/updateMyInfoForm.jsp?errMsg=" + errMsg);
		}
	
%>
