<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.util.*" %>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp");
		return;
	}
	// 세션에서 고객 mail가져오기
	HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
	
	String cusMail = (String)(login.get("cusMail"));
	System.out.println(cusMail + "<-- cusMail insertRsvForm.jsp param");
%>
<%
	// 이번 달에 따라 메뉴 값을 설정
	int rsvMenu = 1; // 기본값은 1
	java.time.LocalDate currentDate = java.time.LocalDate.now();
	int currentMonth = currentDate.getMonthValue();
	for(int i=1; i<=12; i++) {
		if (currentMonth == i) { // 이번달이 i월인 경우
		    rsvMenu = i; // 메뉴 값을 i로 설정
		}   
	}
	System.out.println(rsvMenu+"<-- rsvMenu insertRsvForm.jsp param");
	
	HashMap <String,Object> map = RsvBfDAO.selectdate(cusMail);
	System.out.println(map+"<-- map insertRsvForm.jsp param");
	
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
   	<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/insertQnAForm.css">
<title>예약하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
                        <li><a href="/Semi_F_GDCC/customer/GDCC/hotelReviewList.jsp">HOTEL REVIEW</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/golfReviewList.jsp">GOLF REVIEW</a></li>
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
<section class="site-hero inner-page overlay" style="background-image: url(images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">QnA</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="index.html">Home</a></li>
              <li>&bullet;</li>
              <li>INSERT QnA</li>
            </ul>
          </div>
        </div>
      </div>

      <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
          <span class="mouse-wheel"></span>
        </div>
      </a>
</section>
<section>
	<div class="container">
		<div class="row">	
		<div class="col"></div>	   
			<div class="mt-5 col-7 bg-white border shadow-sm p-3 mb-5 bg-body-tertiary rounded">
			<h1>조식 예약</h1>	
			<h3>투숙 기간</h3>
			<div><%=(String)map.get("checkinDate")%> ~ <%=(String)map.get("checkoutDate")%></div>
			<hr>
			<form method="post" action="/Semi_F_GDCC/customer/hotelBf/action/insertRsvAction.jsp">
	        	<div class="mb-3 mt-3">
					<label for="rsvNo" class="form-label">예약 번호:</label>
					<input type="number" class="form-control" value="<%=(Integer)map.get("rsvNo")%>" name="rsvNo">
				</div>   
	            <div class="mb-3">
	            <%
	           		java.time.LocalDate lastDayOfThirdMonth = java.time.LocalDate.now().plusMonths(3).withDayOfMonth(java.time.LocalDate.now().plusMonths(3).lengthOfMonth());
	            %>
	            	<label for="rsvDate" class="form-label">예약 날짜:</label>
	                <input type="date" class="form-control" name="rsvDate" 
	                        min="<%= java.time.LocalDate.now() %>"max="<%= lastDayOfThirdMonth %>">
	            </div>
	            <div class="mb-3">
	            	<label for="rsvTime" class="form-label">예약 시간:</label>
	                <select class="form-control" name="rsvTime">
	                	<option value="" selected="selected">:::선택:::</option>
	                    <option value="7시">7시</option>
	                	<option value="8시">8시</option>
	               		<option value="9시">9시</option>
	                    <option value="10시">10시</option>
	                    <option value="11시">11시</option>
					</select>
				</div>
	            <div class="mb-3">
	            	<label for="rsvMember" class="form-label">예약 인원:</label>
	            	<input type="number" class="form-control" value="<%=(String)map.get("rsvMember")%>" name="rsvMember" min="1">
	            </div>                  
	            	<input type="hidden" value="<%=rsvMenu%>" name="rsvMenu">
	
	            	<button type="submit" class="btn btn-primary">예약</button>
			</form>
	        </div>
		<div class="col"></div>
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