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
<head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300&display=swap" rel="stylesheet">

<link rel="stylesheet" href="./style.css">
<div class="sidebar">
        <div class="sidebar-header">
            <img src="/Semi_F_GDCC/css/img/logoadmin2.png" width="150" height="100">
        </div>
        <ul class="sidebar-menu">
            <li class="active"><a href="/Semi_F_GDCC/admin/mainBoard.jsp">메인페이지</a></li>
            <li><a href="/Semi_F_GDCC/admin/myPage.jsp?adminMail=<%=adminMail%>">마이 페이지</a></li>
            <li><a href="/Semi_F_GDCC/admin/adminList.jsp">사원 관리 </a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">HOTEL</a>
                <ul class="dropdown-menu bg-success">
                    <li><a href="/Semi_F_GDCC/admin/adroomList.jsp">호텔 시설</a></li>
                    <li><a href="/Semi_F_GDCC/admin/rsvHotelList.jsp">예약</a></li>
                    <li><a href="/Semi_F_GDCC/admin/hotelReviewList.jsp">리뷰</a></li>
                </ul>
            </li>
            
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">GOlF</a>
                <ul class="dropdown-menu bg-success">
                   <li><a href="/Semi_F_GDCC/admin/courseList.jsp">코스 관리</a></li>
                    <li><a href="/Semi_F_GDCC/admin/rsvGolfList.jsp">예약</a></li>
                    
                    <li><a href="/Semi_F_GDCC/admin/golfReviewList.jsp">리뷰</a></li>
                </ul>
            </li>
            <li><a href="/Semi_F_GDCC/admin/noticeList.jsp">공지 관리 </a></li>
            <li><a href="/Semi_F_GDCC/admin/QnAList.jsp">Q&A</a></li>
        </ul>
    </div>