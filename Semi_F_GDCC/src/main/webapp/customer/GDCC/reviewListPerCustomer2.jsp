<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%

	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp");
		return;
	}
%>
<%
	// 세션에서 고객 mail가져오기
	HashMap<String,Object> login = (HashMap<String,Object>)(session.getAttribute("loginCustomer"));
	
	String cusMail = (String)(login.get("cusMail"));
	System.out.println(cusMail+ "<--cusMail reviewListPerCustomer.jsp param");
	
	//고객 본인이 작성한 hotelReview 조회하는 메서드
	ArrayList<HashMap<String, Object>> hotelReviewList = ReviewDAO.selectHotelReviewPerCus(cusMail);
	//고객 본인이 작성한 golfReview 조회하는 메서드
	ArrayList<HashMap<String, Object>> golfReviewList = ReviewDAO.selectGolfReviewPerCus(cusMail);
	
	// cusMail에 따라 hotelRsvState 출력하는 메서드
	String hs = ReviewDAO.hotelRsvState(cusMail);
	System.out.println(hs + "<-- hs reviewListPerCustomer.jsp param");
	// cusMail에 따라 golfRsvState 출력하는 메서드
	String gs = ReviewDAO.golfRsvState(cusMail);
	System.out.println(gs + "<-- gs reviewListPerCustomer.jsp param");
	
	// 고객이 예약한 호텔rsvNo 출력하는 메서드 / 리뷰작성리스트
	ArrayList<HashMap<String, Object>> hotelRsvNoList = ReviewDAO.selectHotelRsvNo(cusMail);
	// 고객이 예약한 골프rsvNo 출력하는 메서드 / 리뷰작성리스트
	ArrayList<HashMap<String, Object>> golfRsvNoList = ReviewDAO.selectGolfRsvNo(cusMail);
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
<body style="background-image: url(/Semi_F_GDCC/customer/GDCC/images/hotel_background.png)">
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
                        	<li><a href="/Semi_F_GDCC/customer/customerLoginForm.jsp">Login</a></li>
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
                        <li><a href="/Semi_F_GDCC/customer/GDCC/golfReviewList.jsp">Golf Reviews</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/hotelReviewList.jsp">Hotel Reviews</a></li>
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
<br><br><br><br>
<div class="container1">
	<div class="row site-hero-inner justify-content-center align-items-center">
		<div class="col-md-10 text-center" data-aos="fade-up">
			<span class="custom-caption text-uppercase text-white d-block  mb-3"> 
				<br>MY HOTEL REVIEW
			</span>           
	        <!--  <div style="background-color:white; padding:100px; border-radius:10px;"> -->
			<div class="mb-3 mt-6;">
			<div class="container2">
			<a href="/Semi_F_GDCC/customer/GDCC/reviewListPerCustomer2.jsp">HOTEL REVIEW</a> /
			 <a href="/Semi_F_GDCC/customer/GDCC/reviewListPerCustomer.jsp">GOLF REVIEW</a>	      
		        <table border="1">
					<tr>
						<th style="width:5%">No.</th>
						<th style="width:10%">reviewScore</th>
						<th style="width:15%">reviewTitle</th>
						<th style="width:15%">reviewContent</th>			
						<th style="width:20%">stayDate</th>
						<th style="width:10%">createDate</th>
						<th style="width:10%">updateDate</th>
						<th style="width:10%">&nbsp;</th>
					</tr>
					<%
						for(HashMap m : hotelReviewList) {				
					%>
						<tr>
							<td><%=(Integer)(m.get("rsvNo"))%></td>
							<td>
					        	<div class="rate">
					            	<% 
					                	int reviewScore = (Integer)(m.get("reviewScore"));
					                	int widthPercentage = reviewScore * 10;
					            	%>
					    	        <span style="width: <%= widthPercentage%>%"></span>
						        </div>
					        </td>
							<td><%=(String)(m.get("reviewTitle"))%></td>
							<td>
								<a href="/Semi_F_GDCC/customer/GDCC/hotelReviewOne.jsp?rsvNo=<%=(Integer)(m.get("rsvNo"))%>">
								    <%
								      String reviewContent = (String)(m.get("reviewContent"));
								      if (reviewContent != null && reviewContent.length() > 5) { // 내용길이가 5글자보다 크면
								          out.print(reviewContent.substring(0, 5) + "...");	  // 5글자까지 출력 + "..."
								      } else {
								          out.print(reviewContent);
								      }
								   %>
								</a>
							</td>					
							<td><%=(String)(m.get("checkinDate"))%> ~ <%=(String)(m.get("checkoutDate"))%></td>
							<td><%=(String)(m.get("createDate"))%></td>
							<td><%=(String)(m.get("updateDate"))%></td>
							<td>
								<a class="update" href="/Semi_F_GDCC/customer/GDCC/updateHotelReviewForm.jsp?rsvNo=<%=(Integer)(m.get("rsvNo"))%>">수정</a>		
								<br>
								<a class="delete" href="/Semi_F_GDCC/customer/GDCC/deleteHotelReviewAction.jsp?rsvNo=<%=(Integer)(m.get("rsvNo"))%>">삭제</a>
							</td>			
						</tr>
					<%
						}
					%>
				</table>
				<table border="1">
					<tr>
						<th style="width:30%">rsvNo</th>
						<th style="width:45%">stayDate</th>
						<th style="width:13%">&nbsp;</th>
					</tr>
					<%
						for(HashMap m : hotelRsvNoList) {
							//리뷰 작성유무 확인시키는 메서드
							boolean reviewCk = ReviewDAO.hotelReviewCk(cusMail, (Integer)(m.get("rsvNo")));
					%>
					<tr>
						<td><%=(Integer)(m.get("rsvNo"))%></td>
						<td><%=(String)(m.get("checkinDate"))%>&nbsp; ~ &nbsp;<%=(String)(m.get("checkoutDate"))%></td>
						<%
							if(hs.equals("예약완료")) {
						%>
							<td>만료 후 활성화</td>
						<%
							}else if(hs.equals("예약만료")) {		// 예약만료시에만 리뷰쓸수있게
								if(reviewCk == false) {	// 리뷰값이 없으면 쓸수있게
						%>
								<td>
									<a href="/Semi_F_GDCC/customer/GDCC/insertHotelReviewForm.jsp?rsvNo=
												<%=(Integer)(m.get("rsvNo"))%>">리뷰 쓰기</a>
								</td>
						<%
								} else {	// 리뷰값이 있으면 작성불가				
						%>
								<td>작성 완료</td>
						<%
								}
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