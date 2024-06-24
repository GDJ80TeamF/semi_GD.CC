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
<style>

    .map-contact-container {
        display: flex;
        justify-content: center; /* 가로 중앙 정렬 */
        align-items: flex-start; /* 세로 상단 정렬 */
        margin-top: 50px;
        padding: 20px;
    }
    #map {
        width: 50%;
        height: 350px;
        margin-right: 20px;
    }
    .contact-info {
        width: 40%;
    }
    p{
    	font-weight: bold;
    }

</style>
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
        <div class="site-navbar js-site-navbar">
          <nav role="navigation">
            <div class="container">
              <div class="row full-height align-items-center">
                <div class="col-md-6 mx-auto">
                  <ul class="list-unstyled menu">
                    <li class="active"><a href="/Semi_F_GDCC/welcome.jsp">Home</a></li>
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
                    	<li><a href="/Semi_F_GDCC/customer/GDCC/main.jsp">HotelMain</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/aboutCourse.jsp">Course</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/insertNewRsvForm.jsp">Booking</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/restaurant.jsp">HalfwayHouse</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/golfReviewList.jsp">Reviews</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                   
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
<section class="site-hero overlay" style="background-image: url(/Semi_F_GDCC/css/img/grand.jpg)" data-stellar-background-ratio="0.5">
  <div class="container">
    <div class="row site-hero-inner justify-content-center align-items-center">
      <div class="col-md-10 text-center" data-aos="fade-up">
        <span class="custom-caption text-uppercase text-white d-block  mb-3">Enjoy Premium<span class="fa fa-star text-primary"> Golfing </span></span>
        <h1 class="heading">about direction</h1>
      </div>
    </div>
  </div>
  <a class="mouse smoothscroll" href="#next">
    <div class="mouse-icon">
      <span class="mouse-wheel"></span>
    </div>
  </a>
</section>
<section class="map-contact-container">
  <div id="map"></div>
  <div data-aos="fade-up" data-aos-delay="200" class="contact-info">
    <p><span class="d-block">Address:</span> <span> Incheon Jung-gu, Unseo-dong, 184 Yeongjonghaeannam-ro 321beon-gil, South Korea</span></p>
    <p><span class="d-block">Phone:</span> <span> 02)8187950</span></p>
    <p><span class="d-block">Email:</span> <span> GDCC@GD.com</span></p>
  </div>
</section>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14d94def2c1c84a3cc54d67558d16b6b"></script>
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = { 
          center: new kakao.maps.LatLng(37.450585,126.483477), // 지도의 중심좌표
          level: 4 // 지도의 확대 레벨
      };

  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  var imageSrc = "/Semi_F_GDCC/customer/MarkImage/golf.png", // 마커이미지의 주소입니다    
      imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
      imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        
  // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
  var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
      markerPosition = new kakao.maps.LatLng(37.450585,126.483477); // 마커가 표시될 위치입니다

  // 마커를 생성합니다
  var marker = new kakao.maps.Marker({
      position: markerPosition, 
      image: markerImage // 마커이미지 설정 
  });

  // 마커가 지도 위에 표시되도록 설정합니다
  marker.setMap(map);  
</script>
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