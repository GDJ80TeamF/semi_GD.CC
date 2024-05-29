<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>골프장 코스 소개</title>
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
                        <li><a href="/Semi_F_GDCC/customer/golf/insertNewRsvForm.jsp">Booking</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/main.jsp">HotelMain</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/direction.jsp">Direction</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/restaurant.jsp">Restaurant</a></li>  
                        
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
            <h1 class="heading">about course</h1>
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
<main>
        <!-- 18홀 코스 이미지 -->
        <div class="courseImg">
	        <img src="/Semi_F_GDCC/css/img/inout.png" alt="코스">
        </div>
        <div class="container">
        	<div class="out">
       		 <h2 style="text-align: center; color : #FFBB00; font-weight: bold;">OUT</h2>
	           <img src="/Semi_F_GDCC/css/img/courseOut.jpeg" alt="Out 코스 사진">
                    <h3>난이도 ⭐⭐⭐</h3>
                    <p>
                    	다양한 지형과 긴 페어웨이 도전적인 장애물로 구성되어 있어 
                    	<br>
                    	중급자에게 적합합니다
                    </p>
                    <h3>공략</h3>
                    <p>
                    	긴 페어웨이를 공략하기 위해서 정확한 티샷과 도전적인 세컨샷이 필수입니다
                    	<br>
                	    그린 주변의 벙커를 조심하세요
               	    </p>
                    <h3>그린 스피드 : 2.7</h3>
                    <p>빠른 그린스피드는 아니지만 내리막 경사를 조심하세요</p>
        	</div><!-- out마지막 -->
        
        	<div class="in">
       		 <h2 style="text-align: center; color : #3DB7CC; font-weight: bold;">
       		 	IN
       		 </h2>
            	<div class="course-content">
              	  <img src="/Semi_F_GDCC/css/img/courseIn.jpeg" alt="In 코스 사진">
                    <h3>난이도 ⭐⭐⭐⭐</h3>
                    <p>
                    	짧고 좁은 페어웨이 빠른 그린으로 구성되어 있어 
                  		<br>
                  		상급자에게 적합합니다.
               		</p>
                    <h3>공략</h3>
                    <p>
                    	욕심은 금물! 안전한 티샷이 매우 중요한 코스입니다
                    <br>
                    	블라인드 홀이 많기 때문에 정확한 방향을 조준하는 것이 중요합니다
                    	<br>
                    	그린 주변의 슬로프를 조심하세요.
                    </p>
                    <h3>그린 스피드 : 3.0 </h3>
                    <p>
                    	매우 빠르기 때문에 퍼팅 시 힘조절이 중요합니다
                    	<br>
                    	그린을 벗어나지 않게 조심하세요
                    </p>
           		</div>
        	</div><!-- in마지막 -->
        </div><!-- container마지막 -->
       
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