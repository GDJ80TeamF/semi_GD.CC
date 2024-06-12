<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!----------------------  템플릿 ------------------------>

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
<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/qnaList.css">

<!----------------------  템플릿 ------------------------>

<style>
	/* 슬라이더 애니메시션 참고 -// 
	https://velog.io/@wswy17/CSS-animation-%ED%99%9C%EC%9A%A9%ED%95%B4-slider-%EB%A7%8C%EB%93%A4%EA%B8%B0 */
	.slider {
		overflow: hidden;
		position: relative;
		margin-left: 15%;
	}
	
	.slider .slide {
		position: absolute;
		top: 0;
		left: 0;
		width: 80%;
		height: 70%;
		background-size: cover;
		background-position: center;
		animation: slide 15s infinite;
	}
	
	.slider .slide:nth-child(1) {
		background-image: url('/Semi_F_GDCC/customer/GDCC/images/restaurant5.jpg');		
		animation-delay: -0;
	  
	}	
	.slider .slide:nth-child(2) {
		background-image: url('/Semi_F_GDCC/customer/GDCC/images/restaurant4.jpg');
		animation-delay: -5s;	  	 
	}
	  
	.slider .slide:nth-child(3) {
		background-image: url('/Semi_F_GDCC/customer/GDCC/images/restaurant3.jpg');
		animation-delay: -10s;	  	  
	}	  	
	@keyframes slide {
	  		0% {
		transform: translateX(0);
	  }	
	  26% {
	    transform: translateX(0);
	  }
	  33% {
	    transform: translateX(-100%);
	    animation-timing-function: step-end;
	  }
	  93% {
	    transform: translateX(100%);
	  }	
	  100% {
	    transform: translateX(0);
	  }
</style>
</head>
<body>
<!----------------------  템플릿 ------------------------>
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
	                  <li><a href="/Semi_F_GDCC/customer/GDCC/main.jsp">Hotel Main</a></li>
	                  <li><a href="/Semi_F_GDCC/customer/golf/golfMain.jsp">Golf Main</a></li>
	                  <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
	                  <li><a href="/Semi_F_GDCC/customer/GDCC/direction.jsp">Direction</a></li>
	                  <li><a href="/Semi_F_GDCC/customer/GDCC/QnAList.jsp">QnA</a></li>
	                  <li><a href="/Semi_F_GDCC/customer/GDCC/hotelReviewList.jsp">Reviews</a></li>
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
<section class="site-hero inner-page overlay" style="background-image: url(images/restaurant.jpg)" data-stellar-background-ratio="0.5">
	<div class="container">
	  <div class="row site-hero-inner justify-content-center align-items-center">
	    <div class="col-md-10 text-center" data-aos="fade">
	      <h1 class="heading mb-3"></h1>
	      <ul class="custom-breadcrumbs mb-4">
	        <h1 class="heading mb-3">GOODEE RESTAURANT</h1>
	        <li><h1><b>P R E M I U M</b></h1></li>
	        <br>
	        <li><br><br>매일 공수해온 엄선된 식재료, 5성급 주장방의 장인정신이 만든 <br> 미식을 경험해보세요</li>	
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
<section class="section blog-post-entry bg-light" id="next">		

	<!-- 슬라이드 이미지 -->
	<div class="container-fluid">
		<div class="slider">
			<div class="slide"></div>
			<div class="slide"></div>
			<div class="slide"></div>							
			<div>
				<br><br><br><br><br><br><br><br><br>
				<br><br><br><br><br><br><br><br><br>
				<br><br><br><br><br><br>
				<button style="width: 10%; margin-left: 35%; border-radius: 10px;"><a href="/Semi_F_GDCC/customer/GDCC/insertRsvForm.jsp"><b>예 약 하 기</b></a></button>
				<br><br>
				<span><b>운영시간</b></span><br>					
				<span>[조식]</span>
				<br>
				<span>평일(월-금) - 07:00 - 11:00</span>
				<br>
				<span>주말 및 공휴일 - 07:00 - 11:00</span>
				<br>
				<hr>
				<span>주차정보</span>					
				<span>- 레스토랑 이용 시 호텔 내 점심 3시간 무료 주차 가능합니다.</span>
				<br>
				<span>*주말 및 공휴일 이용 시 골프장 이용객이 많아 주차장이 다소 혼잡하여 양해 부탁 드립니다. (주차 소요 시간: 평균 20분 이상)</span>					
			</div>							
		</div>
	</div>
</section>	

<footer class="section footer-section">
  <div class="container">
    <div class="row mb-4">   
        <span class="ion-ios-location h5 mr-3 text-primary"></span>
        <span>Address:<br> (08505) 서울특별시 금천구 <br>가산디지털2로 95</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="ion-ios-telephone h5 mr-3 text-primary"></span>
        <span>Phone: <br>(+1) 234 4567 8910</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="ion-ios-email h5 mr-3 text-primary"></span>
        <span>Email: <br> GDCC@GD.com</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    <div class="row pt-5">
      <p class="col-md-6 text-left">
        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        Copyright &copy;<script>document.write(new Date().getFullYear());</script> MADE BY TEAM F 서기범 나연주 반지현 임아영 <i class="icon-heart-o" aria-hidden="true"></i>
        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
      </p>
    </div>
  </div>
</footer>
<!-- END footer -->
<!----------------------  템플릿 ------------------------>
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
<!----------------------  템플릿 ------------------------>
</body>
</html>