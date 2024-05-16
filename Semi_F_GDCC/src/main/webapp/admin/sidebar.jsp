<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 메인페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}

	
	HashMap<String,Object> loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
	String adminName = (String) loginAdmin.get("adminName");
	String adminMail = (String) loginAdmin.get("adminMail");
	
	//프로필  부르기 
	HashMap<String,Object> m = AdminDAO.selectMyPage(adminMail);
	
	
%>
<link rel="stylesheet" href="./style.css">
<div class="sidebar">
        <div class="sidebar-header">
            <h2 style="background-color:#FFD700;color:black;padding:10px;border-radius:10px;">GDCC</h2>
        </div>
        <ul class="sidebar-menu">
            <li class="active"><a href="/Semi_F_GDCC/admin/mainBoard.jsp">메인페이지</a></li>
            <li><a href="/Semi_F_GDCC/admin/myPage.jsp?adminMail=<%=adminMail%>">마이 페이지</a></li>
            <li><a href="/Semi_F_GDCC/admin/adminList.jsp">사원 리스트 </a></li>
            <li><a href="/Semi_F_GDCC/admin/bfMenuList.jsp">호텔 조식 관리 </a></li>
            <li><a href="/Semi_F_GDCC/admin/adroomList.jsp">룸 리스트</a></li>
            <li><a href="/Semi_F_GDCC/admin/hotelReviewList.jsp">호텔리뷰 리스트</a></li>
            <li><a href="/Semi_F_GDCC/admin/golfReviewList.jsp">골프리뷰 리스트</a></li>
            <li><a href="/Semi_F_GDCC/admin/bfMenuList.jsp">호텔 조식 관리 </a></li>
        </ul>
    </div>