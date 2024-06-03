<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%

	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp");
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
	int lastPage = RsvHotelDAO.RsvHotelpage();
	System.out.println("lastPage" + lastPage);
%>
<%
	ArrayList<HashMap<String, Object>> List = RsvHotelDAO.selectCuRsvList(cusMail, startRow, rowPerPage);
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
    <style>
<style>
table {
  border-collapse: collapse;
  width: 100px;
}

th, td {
  text-align: left;
  padding: 20px;
}

tr:nth-child(even) {background-color: #f2f2f2;}

</style>
<title>myPage</title>
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
                    <!-- 헤더메뉴 -->
                      <ul class="list-unstyled menu">
                        <li class="active"><a href="/Semi_F_GDCC/customer/GDCC/main.jsp">Home</a></li>
                        <%
							  	if(session.getAttribute("loginCustomer") == null){
						%>
                        	<li><a href="/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp">Login</a></li>
                        	<li><a href="/Semi_F_GDCC/customer/GDCC/insertCustomerForm.jsp">Join MemeberShip</a></li>
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
    <!-- END head -->
    <section class="site-hero overlay" style="background-image: url(/Semi_F_GDCC/customer/GDCC/images/hotel_background.png)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <div class="container">
            <span class="custom-caption text-uppercase text-white d-block mb-3" style="border-radius:10px;">Reservation Hotel</span>
         	<br>
         	<div style="background-color:white; border-radius:10px;">
         	
					<table style="margin-left:auto; margin-right:auto; ">
							<tr>		
								<th>예약 번호</th>
								<th>룸 번호</th>
								<th>예약자 아이디 </th>
								<th>조식예약여부</th>
							</tr>
						<%
							for(HashMap<String, Object> m : List){
						%>
							<tr>
									<td><a href="/Semi_F_GDCC/customer/GDCC/cusRsvHotelOne.jsp?rsvNo=<%=m.get("rsv_no")%>"><%=m.get("rsv_no")%></a></td>
									<td><%=(Integer)m.get("room_no")%></td>
									<td><%=cusMail%></td>
									<td><a href="/Semi_F_GDCC/customer/GDCC/rsvOne.jsp?rsvNo=<%=m.get("rsv_no")%>">조식예약 확인</a></td>
									
							</tr>
	 
								<%
									}
								%>
						</table>
						<a class="btn btn-primary" href="/Semi_F_GDCC/customer/GDCC/rsvComplexList.jsp">부대시설예약확인</a><br>
						<a href="/Semi_F_GDCC/customer/GDCC/rsvHotelList.jsp?currentPage=1"> << 처음 페이지&nbsp; </a>
						<a href="/Semi_F_GDCC/customer/GDCC/rsvHotelList.jsp?currentPage=<%=currentPage-1%>">&nbsp; < 이전 </a>										
						<a href="/Semi_F_GDCC/customer/GDCC/rsvHotelList.jsp?currentPage=<%=currentPage+1%>">&nbsp;&nbsp; 다음 > </a>
						<a href="/Semi_F_GDCC/customer/GDCC/rsvHotelList.jsp?currentPage=<%=lastPage%>"> &nbsp;마지막 페이지 >></a>

						<br>
					<div>
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