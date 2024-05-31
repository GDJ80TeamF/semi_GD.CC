<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GDCC Hotel by Colorlib.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
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
    <!-- Custom Style -->
    <link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/golfMain.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">

    <!-- jQuery 로드 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- jQuery를 사용하는 스크립트 -->
    <script>
    $(document).ready(function(){
        $("div#weatherCheck").hover(
            function() {
                // 호버시 날씨 정보를 부드럽게 보이도록 설정합니다.
                $(".weather").addClass('show');
            }, 
            function() {
                // 호버를 벗어날 시 날씨 정보를 부드럽게 숨기도록 설정합니다.
                $(".weather").removeClass('show');
            }
        );
        
        // 서울 날씨 정보 가져오기
        $.getJSON("http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=e5c25df9f0f40f8923682bd43dfc75d2&units=metric", function(data){
            var temperature = data.main.temp;
            var minTemperature = data.main.temp_min;
            var weatherIcon = data.weather[0].icon;
            var windSpeed = data.wind.speed;

            $(".SeoulNowtemp").text("MAX " + temperature + "°C");
            $(".SeoulLowtemp").text("MIN " + minTemperature + "°C");
            $(".SeoulWindSpeed").text("WIND " + windSpeed + " m/s");
            $(".SeoulIcon").html("<img src='http://openweathermap.org/img/w/" + weatherIcon + ".png'>");
        });
    });
    </script>

    
</head>
<body>
<!-- 헤드 로고 & 메뉴 토글 들어가는 부분 -->
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
                    <!-- 메뉴바 -->
                      <ul class="list-unstyled menu">
                        <li class="active"><a href="/Semi_F_GDCC/welcome.jsp">Home</a></li>
                        <% if(session.getAttribute("loginCustomer") == null){ %>
                           <li><a href="/Semi_F_GDCC/customer/customerLoginForm.jsp">Login</a></li>
                           <li><a href="/Semi_F_GDCC/customer/insertCustomerForm.jsp">Join Membership</a></li>
                        <% } else { %>
                           <li><a href="/Semi_F_GDCC/customer/GDCC/myPage.jsp">Mypage</a></li>
                           <li><a href="/Semi_F_GDCC/customer/action/customerLogoutAction.jsp">LogOut</a></li>
                        <% } %>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/main.jsp">HotelMain</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/aboutCourse.jsp">Course</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/insertNewRsvForm.jsp">Booking</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/restaurant.jsp">HalfwayHouse</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/golfReviewList.jsp">Reviews</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/direction.jsp">Direction</a></li>
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
<!-- END head 배경이미지 안에 들어가는 문구 -->
<section class="site-hero overlay" style="background-image: url(/Semi_F_GDCC/css/img/grand.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <span class="custom-caption text-uppercase text-white d-block mb-3">Enjoy Premium<span class="fa fa-star text-primary"> Golfing </span></span>
            <h1 class="heading">GooDee Country Club</h1>
            
            <div class="circle-container">
                <div class="circle" id="booking">
                	<a href="/Semi_F_GDCC/customer/golf/insertNewRsvForm.jsp">
                		booking
                	</a>
                </div>
                <div class="circle" id="course">
                	<a href="/Semi_F_GDCC/customer/golf/aboutCourse.jsp">
                		course
                	</a>
                </div>
                <div class="circle" id="weatherCheck">            	
                		weather
               	</div>
            </div>
            
            <div class="weather">
                <h3 class="SeoulIcon"></h3><!-- 아이콘 -->
                <h3 class="SeoulNowtemp"></h3><!-- 현재기온 -->
                <h3 class="SeoulLowtemp"></h3><!-- 최저기온 -->
                <h3 class="SeoulWindSpeed"></h3><!-- 풍속 -->
            </div>
          </div>
        </div>
      </div>
</section>
<!-- END section -->
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


<!-- <!-- footer부분 -->    
<footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
          <div class="col-md-3 mb-5">
            <ul class="list-unstyled link">
              <li><a href="/Semi_F_GDCC/welcome.jsp">home</a></li>
              <li><a href="/Semi_F_GDCC/customer/golf/insertNewRsvForm.jsp">reservation</a></li>
              <li><a href="/Semi_F_GDCC/customer/golf/aboutCourse.jsp">course</a></li>
              <li><a href="/Semi_F_GDCC/customer/golf/restaurant.jsp">HalfwayHouse</a></li>
              
            </ul>
          </div>
          <div class="col-md-3 mb-5">
            <ul class="list-unstyled link">
              <li><a href="/Semi_F_GDCC/customer/GDCC/rooms.jsp">Hotel Rooms</a></li>
             
            </ul>
          </div>
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
            <li>Yeongjonghaeannam-ro 321beon-gil,<br> Incheon Jung-gu, Unseo-dong, 184</li>
            <p><span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Address:</span> <span>Yeongjonghaeannam-ro 321beon-gil, <br> Incheon Jung-gu, Unseo-dong, 184</span></p>
            <p><span class="d-block"><span class="ion-ios-telephone h5 mr-3 text-primary"></span>Phone:</span> <span> 02)8187950</span></p>
            <p><span class="d-block"><span class="ion-ios-email h5 mr-3 text-primary"></span>Email:</span> <span>GDCC@GD.com</span></p>
          </div>
          <div class="col-md-3 mb-5">
            <p>Sign up for our newsletter</p>
            <form action="#" class="footer-newsletter">
              <div class="form-group">
                <input type="email" class="form-control" placeholder="Email...">
                <button type="submit" class="btn"><span class="fa fa-paper-plane"></span></button>
              </div>
            </form>
          </div>
        </div>
        <div class="row pt-5">
          <p class="col-md-6 text-left">
            Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
          </p>
            
          <p class="col-md-6 text-right social">
            <a href="#"><span class="fa fa-tripadvisor"></span></a>
            <a href="#"><span class="fa fa-facebook"></span></a>
            <a href="#"><span class="fa fa-twitter"></span></a>
            <a href="#"><span class="fa fa-linkedin"></span></a>
            <a href="#"><span class="fa fa-vimeo"></span></a>
          </p>
        </div>
      </div>
</footer>
</body>
</html>