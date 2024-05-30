<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//인증 분기 세션 변수 이름 : loginCustomer
if(session.getAttribute("loginCustomer") == null){
	response.sendRedirect("/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp");
	return;
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그늘집</title>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GDCC Hotel by Colorlib.com</title>
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
	<!-- 원래 css자리 -->
	<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/aboutCourse.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300&display=swap" rel="stylesheet">
	<!-- new css연결하기 -->
	<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/restaurant.css">
</head>
<body>
<header class="site-header js-site-header">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col-6 col-lg-4 site-logo" data-aos="fade"><a href="/Semi_F_GDCC/welcome.jsp"><img src="/Semi_F_GDCC/customer/GDCC/images/GDCC_main.png" width="150"></a></div>
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
                           <li><a href="/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp">Login</a></li>
                           <li><a href="/Semi_F_GDCC/customer/insertCustomerForm.jsp">Join MemeberShip</a></li>
                        <%
                     }else{
                  %>
                      <li><a href="/Semi_F_GDCC/customer/GDCC/myPage.jsp">Mypage</a></li>
                      <li><a href="/Semi_F_GDCC/customer/action/customerLogoutAction.jsp">LogOut</a></li>
                      
                  <%
                          }
                  %>
                  		<li><a href="/Semi_F_GDCC/customer/golf/aboutCourse.jsp">Course</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/insertNewRsvForm.jsp">Booking</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/main.jsp">HotelMain</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/direction.jsp">Direction</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/restaurant.jsp">HalfwayHouse</a></li>  
                        
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
  <section class="site-hero overlay" style="background-image: url(/Semi_F_GDCC/css/img/grand.jpg)" data-stellar-background-ratio="0.5">
     <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <span class="custom-caption text-uppercase text-white d-block  mb-3">Enjoy Premium<span class="fa fa-star text-primary"> Golfing </span></span>
            <h1 class="heading">Halfway House</h1>
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
<main class="image-gallery" style="background-image: url('/Semi_F_GDCC/css/img/pin.jpeg'); background-size: cover; background-attachment: fixed;">
  <div class="image-grid">
    <div class="image-row">
      <img src="/Semi_F_GDCC/css/img/menu.png" alt="Image 1">
      <img src="/Semi_F_GDCC/css/img/origin.png" alt="Image 2">
    </div>
    <div class="image-row">
      <img src="/Semi_F_GDCC/css/img/breakfast.png" alt="Image 3">
      <img src="/Semi_F_GDCC/css/img/lunch.png" alt="Image 4">
    </div>
    <div class="image-row">
      <img src="/Semi_F_GDCC/css/img/beverage.png" alt="Image 5">
      <img src="/Semi_F_GDCC/css/img/alcohol.png" alt="Image 6">
    </div>
  </div>
 </main>
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