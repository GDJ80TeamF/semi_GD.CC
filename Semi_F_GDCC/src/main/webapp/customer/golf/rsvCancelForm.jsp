<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%
	//인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	//예약 번호 출력
	String rsvNo1 = request.getParameter("rsvNo");
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	//세션 가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
		 String cusMail = (String)(login.get("cusMail"));
	
	//회원 골프예약 정보 가져오기
		HashMap<String,Object> rsvOne =
			RsvGolfDAO.selectRsvOne(rsvNo);
	//비밀번호가 일치하지 않을때 메세지
		String msg = request.getParameter("msg");
	
		if (msg == null) {
		    msg = "비밀번호를 입력해주세요"; 
		}
		if (msg.equals("F")) {
		    msg = "일치하지 않습니다";
		}
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
    <!-- css파일연결 -->
    <link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/rsvCancelForm.css">
<title>myPage</title>
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
		
            <h1 class="heading">	<h1> </h1></h1>
		 <div class="mb-3 mt-3">
			<h2>Cancel</h2>
			<div>
				<table style="margin: 0 auto; margin-top: 20px; margin-bottom: 20px;">
					<tr>
						<th>예약날짜</th>
						<th>시작코스</th>
						<th>T-TIME</th>
					</tr>
					<tr>
						<td><%=rsvOne.get("rsvDate") %></td>
						<td><%=rsvOne.get("rsvCourse") %></td>
						<td>
							<%
								// rsvTtime을 정수로 바꿔주기
								int rsvTtime = Integer.parseInt((String) rsvOne.get("rsvTtime"));
								
								// rsvTtime enum에 따라서 시간에 맞춰서 출력
								switch (rsvTtime) {
								    case 1:
								        out.print("11:00");
								        break;
								    case 2:
								        out.print("11:15");
								        break;
								    case 3:
								        out.print("11:30");
								        break;
								    case 4 :
								    	out.print("11:45");
								    	break;
								    case 5 :
								    	out.print("12:00");
								    	break;
								    case 6 :
								    	out.print("12:15");
								    	break;
								    case 7 :
								    	out.print("12:30");
								    	break;
								    case 8 :
								    	out.print("12:45");
								    	break;
								    case 9 :
								    	out.print("13:00");
								    	break;
								}
							%>					
						</td>
					</tr>
				</table>
				<h4>예약을 취소하시겠습니까?</h4>
					<%=msg %>
					<form method="post" action="/Semi_F_GDCC/customer/golf/rsvCancelPwCk.jsp">						
						<input type="password" name="ckPw">
						<input type="hidden" id="mail" name="cusMail" value="<%=cusMail %>">
						<input type="hidden" id="rsvNo" name="rsvNo" value="<%=rsvNo%>">
					<br><br>
						<button class="btn btn-warning"> 
							<a href="/Semi_F_GDCC/customer/golf/rsvGolfList.jsp" >							
								돌아가기
							</a>
						</button>
						<button type="submit" class="btn btn-warning" style="color : ivory; font-weight: bold;"> 
							취소 
						</button>
					<br><br>
					</form>	
				</div>
			</div>
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