<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.ParseException"%>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<-- rsvNo rsvOne.jsp param ");

	// rsvNo에 따라 조식예약정보 출력하는 메서드 / 상세보기
	ArrayList<HashMap<String, Object>> list = RsvBfDAO.selectRsvOne(rsvNo);
	
	// 현재 날짜 구하기
	Date currentDate = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // SimpleDateFormat을 사용하여 날짜 형식 지정
    Date rsvDate = null; // 예약 날짜를 Date 객체로 변환할 변수 초기화
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=|Roboto+Sans:400,700|Playfair+Display:400,700">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">
    <link rel="stylesheet" href="css/fancybox.min.css">
    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="css/style.css">
   	<!-- css -->
   	<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/qnaListPerCustomer.css">
<title></title>
</head>
<body>
<header class="site-header js-site-header">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col-6 col-lg-4 site-logo" data-aos="fade"><a href="/Semi_F_GDCC/customer/GDCC/main.jsp"><img src="/Semi_F_GDCC/customer/GDCC/images/GDCC_main.png" width="150"></a></div>
          <div class="col-6 col-lg-8">

            <div class="site-menu-toggle js-site-menu-toggle"  data-aos="fade">
              <span></span>
              <span></span>
              <span></span>
            </div>
            <!-- END menu-toggle -->

            <div class="site-navbar js-site-navbar">
              <nav role="navigation">
                <div class="container">
                  <div class="row full-height align-items-center">
                    <div class="col-md-6 mx-auto">
                    <!-- ë©ë´ë° -->
                      <ul class="list-unstyled menu">
                        <li class="active"><a href="/Semi_F_GDCC/customer/GDCC/main.jsp">Home</a></li>
                        <%
							if(session.getAttribute("loginCustomer") == null){
						%>
                        	<li><a href="/Semi_F_GDCC/customer/customerLoginForm.jsp">Login</a></li>
                        	<li><a href="/Semi_F_GDCC/customer/insertCustomerForm.jsp">Join MemeberShip</a></li>
                        <%
							}else{
						%>
							 <li><a href="/Semi_F_GDCC/customer/GDCC/myPage.jsp">My page</a></li>
							 <li><a href="/Semi_F_GDCC/customer/action/customerLogoutAction.jsp">LogOut</a></li>
							 
						<%
							  	}
						%>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/main.jsp">Hotel Main</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/golfMain.jsp">Golf Main</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/about.jsp">About</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/direction.jsp">Direction</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/QnAList.jsp">QnA</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
</header>
<!-- END head -->
<section class="site-hero overlay" style="background-image: url(/Semi_F_GDCC/customer/GDCC/images/hotel_background.png)" data-stellar-background-ratio="0.5">
	<br>
	<div class="container">
		<div class="row site-hero-inner justify-content-center align-items-center">
		<div class="col-md-10 text-center" data-aos="fade-up">
		<span class="custom-caption text-uppercase text-white d-block  mb-3">RSV BREAK FAST LIST</span>
            <br>
	        <!--  <div style="background-color:white; padding:100px; border-radius:10px;"> -->
			<div class="mb-3 mt-6;">
			<div class="container2">
			<a href="/Semi_F_GDCC/customer/GDCC/bfInfo.jsp">R E S E R V A T I O N</a>
			<table border="1">
				<tr>
					<th style="width:5%">NO.</th>
					<th style="width:10%">예약날짜</th>
					<th style="width:5%">예약시간</th>
					<th style="width:5%">동반인원</th>
					<th style="width:8%">예약상태</th>
					<th style="width:5%">메뉴</th>
					<th style="width:15%">메뉴 소개</th>
					<th style="width:10%">이미지</th>
					<th style="width:5%">&nbsp;</th>					
					<th style="width:5%">&nbsp;</th>
				</tr>
				<%	
					for(HashMap m : list) {
				        // 예약 날짜 가져오기
				        String rsvDateStr = (String) m.get("rsvDate");
				        try { // 날짜 문자열을 Date 객체로 변환
				            rsvDate = sdf.parse(rsvDateStr);
				        } catch (ParseException e) {
				            e.printStackTrace(); // 예외 처리
				        }
				%>
				<tr>
					<td><%=(Integer)(m.get("rsvNo"))%></td>	
					<td><%=(String)(m.get("rsvDate"))%></td>	
					<td><%=(String)(m.get("rsvTime"))%></td>
					<td><%=(Integer)(m.get("rsvMember"))%>명</td>	
					<td><%=(String)(m.get("rsvState"))%></td>	
					<td><%=(String)(m.get("menuMain"))%></td>
					<td><%=(String)(m.get("menuInfo"))%></td>
					<td><img src="/Semi_F_GDCC/admin/upload/<%=(String)(m.get("menuImg"))%>" width="100%" height="100%"></td>
					
				<%
				        // 현재 날짜와 예약 날짜 비교
				        if (currentDate.compareTo(rsvDate) <= 0) { // 현재 날짜가 예약 날짜 이후인 경우
				%>
					<td>
						<a href="/Semi_F_GDCC/customer/GDCC/rsvUpdateForm.jsp?rsvNo=<%=rsvNo%>&
									rsvBfno=<%=(Integer)(m.get("rsvBfno"))%>">변경</a>
					</td>
					<td>		
					<a href="/Semi_F_GDCC/customer/GDCC/rsvDeleteForm.jsp?rsvNo=<%=rsvNo%>&
									rsvBfno=<%=(Integer)(m.get("rsvBfno"))%>">취소</a>
					</td>
				<%
				        } else {
				            // 현재 날짜가 예약 날짜 이전인 경우 버튼 숨김
				%>
				            <td>만료</td>
				            <td>&nbsp;</td>			      
				<%
				        }
				%>
				</tr>
				<%
					}
				%>
			</table>
			</div>
	    	</div>
		</div>
	</div>	
	</div>
</section>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/jquery.fancybox.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/bootstrap-datepicker.js"></script> 
<script src="js/jquery.timepicker.min.js"></script> 
<script src="js/main.js"></script>

</body>
</html>