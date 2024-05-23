<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	//인증 분기 세션 변수 이름 : loginCustomer
		if(session.getAttribute("loginCustomer") == null){
			response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
			return;
		}
		HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
		
		String cusMail = (String)(login.get("cusMail"));
	

%>
<%
	String checkinDate = request.getParameter("checkinDate");
	if(checkinDate == null){
		checkinDate = " ";
	}
	String checkoutDate = request.getParameter("checkoutDate");
	if(checkoutDate == null){
		checkoutDate = " ";
	}
	System.out.println(checkinDate);
	System.out.println(checkoutDate);


%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
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
                        <li><a href="/Semi_F_GDCC/customer/GDCC/rooms.jsp">Rooms</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/QnAList.jsp">Q&A</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/direction.jsp">Direction</a></li>
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
            <h1 class="heading mb-3">Room Reservation</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="">Home</a></li>
              <li>&bullet;</li>
              <li>Room Reservation</li>
            </ul>
          </div>
        </div>
      </div>
	<section class="section">
      <div class="container">
      <div class="col-md-6 mb-3 mb-lg-0 col-lg-3"></div>
                
                
			
			<%
			
				if(checkinDate == " " && checkoutDate == " "){
			%>
				<form method="post" action="/Semi_F_GDCC/customer/GDCC/checkRoomList.jsp">
					<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
	                  <label for="checkinDate" class="font-weight-bold text-black">Check In</label>
	                  <div class="field-icon-wrap">
	                    <div class="icon"><span class="icon-calendar"></span></div>
	                    <input type="date" name="checkinDate" class="form-control">
	                  </div>
	                </div>
	                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
	                  <label for="checkoutDate" class="font-weight-bold text-black">Check Out</label>
	                  <div class="field-icon-wrap">
	                    <div class="icon"><span class="icon-calendar"></span></div>
	                    <input type="date" name="checkoutDate" class="form-control">
	                  </div>
	                </div>
	                 <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
	                  
	                </div>
					<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
						
					</div>	
					
						<!-- 가능한 날짜 체크 -->
	              </div>
	              <div class="container centered-container">
	              
	                <div class="col-md-6 col-lg-3 align-self-end">
	                  <button class="btn btn-primary btn-block text-white">Check Availabilty</button>
	                </div>
	              </div>
				</form>
			
			
			<% 
				}else{
			%>
				
				<form method="post" action="/Semi_F_GDCC/customer/GDCC/insertNewRsvAction.jsp">
				<table>
				<tr>
					<th>
						예약 일시:
						<input type="text" name="checkinDate" value="<%=checkinDate%>" readonly>
						 ~ 
						<input type="text" name="checkoutDate" value="<%=checkoutDate%>" readonly>
					</th>
			
				<tr>
				<tr>
					<th>
						룸 선택:
						<%
							ArrayList<HashMap<String,Object>> rooms = RsvHotelDAO.selectRoomList(checkinDate, checkoutDate);
							for(HashMap<String,Object> m:rooms){
						%>
						
					</th>
				</tr>
				<tr>
					<td rowspan="2"></td>
				</tr>
				<tr>
					
				</tr>
				<tr>
					<td><input type="radio" name="roomNo" value="<%=(Integer)m.get("roomNo") %>"></td>
				</tr>		
				<tr>	
					<th>룸 번호 : <%=(Integer)m.get("roomNo") %> </th>
					
				</tr>
				
				<tr>
					<th>룸 등급 : <%=(String)m.get("roomGrade") %> </th>
				</tr>
				<tr>
					<th>룸 가격 :<%=(Integer)m.get("roomPrice") %></th>
				</tr>
				<tr>
					<th><%=(String)m.get("roomInfo") %></th>
				</tr>
				<tr>
					<th><img src="/Semi_F_GDCC/admin/upload/<%=(String)m.get("roomImg") %>" width="400" height="300"></th>
						
						
				</tr>
			
							<br>
						<%
								
							}
						%>
						
				<tr>
				<th>예약자 아이디 : <input type="text" value="<%=cusMail%>" readonly name="rsvMail"></th>
				</tr>
				<tr>
				<th>동반 인원 수 : <input type="number" name="rsvMember" min="1" max="4"></th>
				</tr>
				<tr>
				<th>요청 사항 : <br>
				<textarea rows="5" cols="40" name="rsvRequest"></textarea></th>
				</tr>
				<tr>
				<td><button type="submit" class="btn btn-primary">예약하기! </button></td>
			</tr>
		</table>
	</form>
			
<%
	}

%>		
              </div>
    </section> 

    <!-- END section -->

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
				
				
              </div>
          </div>
        </div>
      </div>
    </section>

</body>
</html>