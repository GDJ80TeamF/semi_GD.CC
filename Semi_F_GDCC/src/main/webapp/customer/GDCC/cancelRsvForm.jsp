<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
	HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
	
	String cusMail = (String)(login.get("cusMail"));
%>
<%
	int rsvComNo = Integer.parseInt(request.getParameter("rsvComNo"));

	HashMap<String,Object> m = RsvComplexDAO.selectRsvOne(rsvComNo);
	
	//비번체크후 ck값 받아오기
	String ck = request.getParameter("ck");
	if(ck == null){
		ck = " ";
	}


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
    <style>
    		 .btn{
      text-decoration: none;
      color:white;
      padding:5px 5px 5px 5px;
      margin:5px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
    }
    .btn.blue{
      background-color: #1f75d9;
      border-bottom:5px solid #165195;
    }
    .btn.blue:active{
      border-bottom:2px solid #165195;
    }
     .btn.red{
      background-color: #ff521e;
      border-bottom:5px solid #c1370e;
    }
    .btn.red:active{
      border-bottom:2px solid #c1370e;
    }
    </style>
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
            <span class="custom-caption text-uppercase text-white d-block mb-3" style="border-radius:10px;">Cancel HotelComplex</span>
         	<br>
         	<div style="background-color:white; border-radius:10px;">
				<table style="margin-left:auto; margin-right:auto; ">
					<tr>
						<td>시설 예약번호 </td>
						<td><%=(Integer)m.get("comNo") %></td>
					</tr>
					<tr>
						<td>예약한 시설</td>
						<td><%=(String)m.get("rsvPlace") %></td>
					</tr>
					<tr>
						<td>예약 날짜 </td>
						<td><%=(String)m.get("rsvDate") %></td>
					</tr>
					<tr>
						<td>예약 시간 </td>
						<td><%=(String)m.get("rsvTime") %></td>
					</tr>
					<tr>
						<td>예약 인원수</td>
						<td><%=(Integer)m.get("rsvMember") %></td>
					</tr>
				</table>
			<hr>
				<%
					if(ck.equals("T")){
				%>	
					<a href="/Semi_F_GDCC/customer/hotelComplex/cancelRsvAction.jsp?rsvComNo=<%=(Integer)m.get("comNo") %>">예약 취소하기</a>
				
				<% 	
					}else if(ck.equals("F")){
				%>
					<div>비밀번호 확인에 실패했습니다.다시한번 시도해주세요. </div>
				<% 		
					}else{
				%>
					<div>원활한 예약취소를 위해 비밀번호를 한번 더 입력해주세요. 취소된 예약은 되돌리기가 불가능합니다.</div>
				<form  method="post" action="/Semi_F_GDCC/customer/hotelComplex/rsvCancelCkPw.jsp?rsvComNo=<%=(Integer)m.get("comNo") %>">
					비밀번호 확인 : <input name="checkPw" type="password">
					<button type="submit" class="btn blue">비밀번호 확인</button>
				</form>
				<%	
					}
				%>
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