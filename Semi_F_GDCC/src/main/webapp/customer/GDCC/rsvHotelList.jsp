<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%

	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	//1.세션에서 고객 mail가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 

	 String cusMail = (String)(login.get("cusMail"));
	 	System.out.println(cusMail + "myPage.cusMail");
	
	
	//2.DAO랑 연결시켜서 고객정보 select쿼리 가져오기
	HashMap<String, Object> profile = CustomerDAO.selectCustomerInfo(cusMail);
		
		System.out.println(profile + "<==myPage.profile");

	
%>
<%
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	// 공지 5개씩
	int rowPerPage = 5;
	int startRow = (currentPage-1) * rowPerPage;	
%>
<%
	ArrayList<HashMap<String, Object>> List = RsvHotelDAO.rsvList(startRow, rowPerPage);
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
                        <li><a href="/Semi_F_GDCC/customer/GDCC/about.jsp">About</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/direction.jsp">Direction</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/reservation.jsp">Reservation</a></li>
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
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <div class="container">
            
            <span class="custom-caption text-uppercase text-white d-block  mb-3">MY PROFILE</span>
         
          <div style="background-color:white;">
		
            
			<%-- <div>
				<%=profile.get("cusProfile") %>
			</div> --%>
			 <div class="mb-3 mt-3">
				<table>
					<tr>
						<th>
							프로필
						</th>
						<td>
							<img src="/Semi_F_GDCC/customer/upload/<%=profile.get("cusProfile")%>" width="100" height="100">
						</td>
					</tr>
					<tr>
						<th>
							고객mail
						</th>
						<td>
							<%=profile.get("cusMail") %>
						</td>
					</tr>
					<tr>
						<th>
							성함
						</th>
						<td>
							<%=profile.get("cusName") %>
						</td>
					</tr>
					<tr>
						<th>
							연락처
						</th>
						<td>
							<%=profile.get("cusContact") %>
						</td>
					</tr>
					<tr>
						<th>
							성별
						</th>
						<td>
							<%=profile.get("cusGender") %>
						</td>
					</tr>
					<tr>
						<th>
							생년월일
						</th>
						<td>
							<%=profile.get("cusBirth") %>
						</td>
					</tr>
				</table>
				
				<div>
					<a href="/Semi_F_GDCC/customer/updateMyInfoForm.jsp"> 
						프로필 변경하기
					</a>
					<a href="/Semi_F_GDCC/customer/updatePwForm.jsp">
						비밀번호 변경하기
					</a>
					<a href="/Semi_F_GDCC/customer/deleteCustomerForm.jsp">
						회원탈퇴하기
					</a>
					<a href="/Semi_F_GDCC/customer/reviewListPerCustomer.jsp">
						my후기
					</a>
					<a href="/Semi_F_GDCC/customer/QnAListPerCustomer.jsp">
						MyQnA
					</a>
					<a href="/Semi_F_GDCC/customer/golf/rsvGolfList.jsp">
						골프예약확인
					</a>
					<a href="/Semi_F_GDCC/customer/GDCC/rsvHotelList.jsp">호텔예약확인</a>
				</div>
          </div>
        </div>
      </div>
</div>
</div>
   </div>
</section>
    <section class="site-hero overlay" style="background-image: url(/Semi_F_GDCC/customer/GDCC/images/hotel_background.png)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <div>
					<table border="1">
							<%
								for(HashMap<String, Object> m : List){
							%>
						<tr>
							<th>예약 번호</th>
							<th>룸 번호</th>
							<th>예약자 아이디 </th>
						</tr>
						<tr>
								<td><a href="/Semi_F_GDCC/customer/hotel/cusRsvHotelOne.jsp?rsvNo=<%=m.get("rsvNo")%>"><%=m.get("rsvNo")%></a></td>
								<td><%=(Integer)m.get("roomNo")%></td>
								<td><%=cusMail%></td>
						</tr>
							<%
								}
							%>
					</table>
				</div>
          </div>
        </div>
      </div>

      <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
          <span class="mouse-wheel"></span>
        </div>
      </a>
    </section>
    <!-- END section -->
    

<h1>호텔 예약 리스트</h1>
				
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