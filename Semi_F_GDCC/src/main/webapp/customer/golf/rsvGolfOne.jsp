<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%	
	 //rsvNo넘어오나 확인->디버깅확인완료
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
		System.out.println(rsvNo + "<==rsvGolfOne.rsvNo");
		
	//rsvNo로 예약상세 불러오기->확인
	
	HashMap<String,Object> rsvList = RsvGolfDAO.selectRsvOne(rsvNo);
		System.out.println(rsvList + "<==rsvGolfOne.rsvList");
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
    <link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/rsvGolfOne.css">
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
			<%-- <div>
				<%=profile.get("cusProfile") %>
			</div> --%>
			 <div class="mb-3 mt-3">
			<h2>My Booking</h2>
			<br>
				<div class="content">
						<table>
							<tr>
								<th>e-mail</th>
								<td><%=rsvList.get("rsvMail") %></td>
							</tr>
							<tr>
								<th>라운딩 날짜</th>
								<td><%=rsvList.get("rsvDate") %></td>
							</tr>
							<tr>
								<th>시작코스</th>
								<td><%=rsvList.get("rsvCourse") %>코스</td>
							</tr>
							<tr>
								<th>T-TIME</th>
								<td>
									<%
										// rsvTtime을 정수로 바꿔주기
										int rsvTtime = Integer.parseInt((String) rsvList.get("rsvTtime"));
										
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
							<tr>
								<th>요청사항</th>
								<td>
									<%
										if(rsvList.get("rsvRequest") == null){	
									%>
											요청사항이 없습니다
									<%
										}else{
									%>
											<%=rsvList.get("rsvRequest") %>
									<%
										}
									%>	
								</td>
							</tr>
							<tr>
								<th>라운딩 인원</th>
								<td><%=rsvList.get("rsvMember") %></td>
							</tr>
							<tr>
								<th>예약상태</th>
								<td><%=rsvList.get("rsvState") %></td>
							</tr>
						</table>
					</div><!-- 여기까지가 content -->
				<br>
					<button type="submit" class="btn btn-warning">			
						<a href="/Semi_F_GDCC/customer/golf/updateRsvForm.jsp?rsvNo=<%=rsvNo%>">
							변경신청
						</a>
					</button>
					<button type="submit" class="btn btn-warning">
						<a href="/Semi_F_GDCC/customer/golf/rsvCancelForm.jsp?rsvNo=<%=rsvNo%>">
							예약취소
						</a>
					</button>
					<div class="box"></div>
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