<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<%
	//바뀐 정보들 가져오기 ->이름, 연락처, 성별 프로필 사진만 변경
	
	String cusName = request.getParameter("cusName");
	String cusGender = request.getParameter("cusGender");
	String cusContact = request.getParameter("cusContact");
	
	Part part = request.getPart("cusProfile");
	 String cusProfile2 = part != null ? part.getSubmittedFileName() : null;
		System.out.println(cusProfile2 + "<==updateMyInfo.cusProfile");
	
	String cusMail = request.getParameter("cusMail");

	//update된 CustomerDAO랑 연결
	
	// 원본이름에서 .확장자 추출
	String ext = cusProfile2.substring(cusProfile2.lastIndexOf("."));
	// 저장에 사용할 파일 이름 : 중복방지를 위해 UUID 유틸 클래스 사용
	String txt = (UUID.randomUUID().toString()).replace("-", "");
	String cusProfile = txt+ext; // 생성됨이름 뒤에 .확장자 추가
	System.out.println(cusProfile);
	
	
		//디버깅=>다들어가는거 확인했음.
		System.out.println(cusName + "<==updateMyInfo.cusName");
		System.out.println(cusGender + "<==updateMyInfo.cusGender");
		System.out.println(cusContact + "<==updateMyInfo.cusContact");
		System.out.println(cusProfile + "<==updateMyInfo.cusProfile");
		System.out.println(cusMail + "<==updateMyInfo.cusMail");
	
	int update = CustomerDAO.updateCustomerInfo(cusName, cusGender, cusContact, cusProfile, cusMail);
		System.out.println(update + "<==updateMyInfoAction.update");
	
		//update 확인
		if(update == 1){
			//update성공 -> myPage로 보내기
			String uploadPath = request.getServletContext().getRealPath("customer/upload");
			System.out.println(uploadPath);
			/// 저장될 위치를 현재 프로젝트(톰켓 컨텍스트)안으로 지정
			File file = new File(uploadPath, cusProfile);
			InputStream inputStream = part.getInputStream(); // part객체안에 파일(바이너리)을 메모로리 불러 옴
			OutputStream outputStream = Files.newOutputStream(file.toPath()); // 메모리로 불러온 파일(바이너리)을 빈파일에 저장
			inputStream.transferTo(outputStream);
			
			
			response.sendRedirect("/Semi_F_GDCC/customer/GDCC/myPage.jsp");
		}else{
			//update실패 -> updateMyInfoForm.jsp로 보내기
			//오류 메세지
			String errMsg = URLEncoder.encode("회원정보 수정에 실패했습니다." ,"utf-8");
			response.sendRedirect("/Semi_F_GDCC/customer/GDCC/updateMyInfoForm.jsp?errMsg=" + errMsg);
		}
	
%>
