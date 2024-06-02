<%@page import="gdcc.dao.RsvHotelDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println("rsvNo: "+ rsvNo);	
%>
<%
	HashMap<String,Object> cusRsvOne = RsvHotelDAO.rsvHotelOne(rsvNo);
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
                        <li><a href="/Semi_F_GDCC/customer/golf/golfMain.jsp">GolfMain</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/rooms.jsp">Rooms</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/QnAList.jsp">Q&A</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/direction.jsp">Direction</a></li>
                        <li><a href="/Semi_F_GDCC/customer/hotelBf/bfInfo.jsp">Breakfast Reservation</a></li>
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
   <section class="site-hero overlay" style="background-image: url(/Semi_F_GDCC/customer/GDCC/images/hotel_background.png)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <div class="container">
            
            <span class="custom-caption text-uppercase text-white d-block  mb-3">Hotel Reservartion Detail</span>
         
          	<div style="background-color:white; border-radius:10px;">
	<h1>예약 상세정보</h1>

		 <div class="mb-3 mt-3">
	<form method="post" action="/Semi_F_GDCC/customer/hotel/updateRsvAction.jsp?rsvNo=<%=rsvNo%>">
					<table style="margin-left:auto; margin-right:auto; ">
			<tr>
				<th>예약한 성함</th>
				<th>mail</th>
				<th>체크인 날짜</th>
				<th>체크아웃 날짜</th>
				<th>인원수</th>
				<th>요청사항</th>
				
			</tr>
			<tr>
				<td><input type="text" name="rsvName" value="<%=cusRsvOne.get("name")%>" style="display:none;"><%=cusRsvOne.get("name")%>님</td>
				<td><input type="text" name="rsvMail" value="<%=cusRsvOne.get("mail")%>" style="display:none;"><%=cusRsvOne.get("mail")%></td>
				<td><input type="date" name="cusCheckIn" value="<%=cusRsvOne.get("checkin")%>" readonly="readonly"></td>
				<td><input type="date" name="cusCheckOut" value="<%=cusRsvOne.get("checkout")%>"  readonly="readonly"></td>
				<td><input type="number" name="cusMember" value="<%=cusRsvOne.get("member")%>">명</td>
				<td>
					<%
						//요청사항이 없음.
						if(cusRsvOne.get("request").equals("")){
									
					%>
						<div><textarea  rows="5" cols="50" name="cusRequest" placeholder="요청사항을 입력해주세요."></textarea></div>
					<%
						//요청사항 있음
						}else{
									
					%>
							<textarea  rows="5" cols="50" name="cusRequest"><%=cusRsvOne.get("request")%></textarea>
					<%
						}
					%>
				</td>
			</tr>
		</table>
	<div><button type="submit">예약변경하기</button></div>
	</form>


			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

		<!-- 스크립트 -->
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