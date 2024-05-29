<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<-- rsvNo hotelReviewOne.jsp param ");

	// reviewNo에 따라 review 출력하는 메서드 / 상세보기
	HashMap<String, Object> m = ReviewDAO.selectHotelReviewOne(rsvNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
<!----------------------  템플릿 ------------------------>
<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/qnaOne.css">
<style>
	.rate{
		width: 121px;height: 20px;position: relative;
		}
	
	.rate span{
		position: absolute;
		background: url(https://aldo814.github.io/jobcloud/html/images/user/star02.png);
		width: auto;height: 20px;
		}

</style>
</head>

<body>
<!----------------------  템플릿 ------------------------>
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
	                      <li><a href="/Semi_F_GDCC/customer/myPage.jsp">Mypage</a></li>
	                      <li><a href="/Semi_F_GDCC/customer/action/customerLogoutAction.jsp">LogOut</a></li>
                      
                  	<%
                        }
                  	%>
                          <li><a href="/Semi_F_GDCC/customer/GDCC/rooms.jsp">Rooms</a></li>
                          <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                          <li><a href="/Semi_F_GDCC/customer/GDCC/direction.jsp">Direction</a></li>
                          <li><a href="/Semi_F_GDCC/customer/GDCC/reservation.jsp">Reservation</a></li>
                          <li><a href="/Semi_F_GDCC/customer/GDCC/QnAList.jsp">QnA</a></li>
                          <li><a href="/Semi_F_GDCC/customer/GDCC/hotelReviewList.jsp">REVIEW</a></li>
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
            <h1 class="heading mb-3">HOTEL REVIEW</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="index.html">Home</a></li>
              <li>&bullet;</li>
              <li>HOTEL REVIEW</li>
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

<!----------------------  템플릿 ------------------------>

<section class="section blog-post-entry bg-light" id="next">
	<div class="container">
	<h1>HOTEL Review Detail</h1>
	<span>NO.<%=(Integer)(m.get("rsvNo"))%></span>
	<table>
		<tr>
            <th>작성자</th>
            <td colspan="3"><%=(String)(m.get("rsvMail"))%></td>
        </tr>
		<tr>
			<th>별점</th>
			<td colspan="3">
	        	<div class="rate">
	            	<% 
	                	int reviewScore = (Integer)(m.get("reviewScore"));
	                	int widthPercentage = reviewScore * 10;
	            	%>
	    	        <span style="width: <%= widthPercentage %>%"></span>
		        </div>
	        </td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3"><%=(String)(m.get("reviewTitle"))%></td>
		</tr>
		<tr>
			<th colspan="4">내용</th>					
		</tr>
		<tr>
			<td colspan="4" style="height: 200px;"><%=(String)(m.get("reviewContent"))%></td>
		</tr>	
		<tr>
			<th style="width: 10%;">작성일</th>
			<td style="width: 30%;"><%=(String)(m.get("createDate"))%></td>
			<th style="width: 10%;">수정일</th>
			<td style="width: 30%;"><%=(String)(m.get("updateDate"))%></td>
		</tr>
	</table>
	</div>
</section>

    <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
          <div class="col-md-3 mb-5">
            <ul class="list-unstyled link">
              <li><a href="#">About Us</a></li>
              <li><a href="#">Terms &amp; Conditions</a></li>
              <li><a href="#">Privacy Policy</a></li>
             <li><a href="#">Rooms</a></li>
            </ul>
          </div>
          <div class="col-md-3 mb-5">
            <ul class="list-unstyled link">
              <li><a href="#">The Rooms &amp; Suites</a></li>
              <li><a href="#">About Us</a></li>
              <li><a href="#">Contact Us</a></li>
              <li><a href="#">Restaurant</a></li>
            </ul>
          </div>
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
            <!-- <li>198 West 21th Street, <br> Suite 721 New York NY 10016</li> -->
            <p><span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Address:</span> <span> 198 West 21th Street, <br> Suite 721 New York NY 10016</span></p>
            <p><span class="d-block"><span class="ion-ios-telephone h5 mr-3 text-primary"></span>Phone:</span> <span> (+1) 435 3533</span></p>
            <p><span class="d-block"><span class="ion-ios-email h5 mr-3 text-primary"></span>Email:</span> <span> info@domain.com</span></p>
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
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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