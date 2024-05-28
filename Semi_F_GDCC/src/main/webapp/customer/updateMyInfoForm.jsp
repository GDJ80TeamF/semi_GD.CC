<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.util.*" %>
<%
	//인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%

	//1.세션에서 고객 mail,pw가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 
	 
	 String cusMail = (String)(login.get("cusMail"));

	//고객정보 가져오기
	HashMap<String,Object> info 
		=	CustomerDAO.selectCustomerInfo(cusMail);

	
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
    <link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/rsvGolfList.css">
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
			<h2>Change Profile</h2>
				<div class="content">
						<form method="post" action="/Semi_F_GDCC/customer/action/updateMyInfoAction.jsp" enctype="multipart/form-data">
							<table>
								<tr>
									<th>
										<label for="filename">사진변경 : </label>
									</th>
									<td>
										<input type="file" id="filename" name="cusProfile">
									</td>
								</tr>
								
								<tr>
									<th>
										<label for="mail">
											고객메일
										</label>
									</th>
									<td>
										<input type="text" id="mail" name="cusMail"  value="<%=info.get("cusMail") %>" readonly>
									</td>
								</tr>
								<tr>
									<th>
										<label for="name">
											성함
										</label>
									</th>
									<td>
										<input type="text" id="name" name="cusName" value="<%=info.get("cusName") %>">
									</td>
								</tr>
								<tr>
									<th>
										<label for="birth">
											생년월일
										</label>
									</th>
									<td>
										<input type="date" id="birth" name="cusBirth" value="<%=info.get("cusBirth") %>" readonly>
									</td>
								</tr>
								<!-- 비밀번호 변경은 myPage.jsp에서 따로 해야함 -->
								<tr>
									<th>
										<label for="contact">
											연락처
										</label>
									</th>
									<td>
										<input type="text" id="contact" name="cusContact" value="<%=info.get("cusContact") %>">
									</td>
								</tr>
								<tr>
									<th>
										<label for="gender">
											성별
										</label>
									</th>
									<td>
										<select name="cusGender">
										    <option value="남" <%= info.get("cusGender").equals("남") ? "selected" : "" %>>남성</option>
										    <option value="여" <%= info.get("cusGender").equals("여") ? "selected" : "" %>>여성</option>
										</select>
									</td>
								</tr>
							</table>
						<button type="submit" class="btn btn-warning" style="color :ivory; font-weight: bold;">
							변경하기
						</button>
					</form>
				</div><!-- 여기까지가 box -->
			<br>
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