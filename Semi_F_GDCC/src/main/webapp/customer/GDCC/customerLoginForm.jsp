<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") != null){
		response.sendRedirect("/Semi_F_GDCC/customer/main.jsp");
		return;
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
<title>로그인 폼</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
 <header class="site-header js-site-header">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col-6 col-lg-4 site-logo" data-aos="fade"><a href="/Semi_F_GDCC/customer/GDCC/main.jsp"><img src="/Semi_F_GDCC/customer/GDCC/images/GDCC_main.png" width="150"></a></div>
          <div class="col-6 col-lg-8"></div>
			</div>
		</div>
    </header>
 <section class="site-hero overlay" style="background-image: url(/Semi_F_GDCC/customer/GDCC/images/hotel_background.png)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <div class="container">
		<div class="row">
		<div class="col"></div>
		<div class="mt-5 col-7 bg-white border shadow-sm p-3 mb-5 bg-body-tertiary rounded">
				<form method="post" action="/Semi_F_GDCC/customer/action/customerLoginAction.jsp">
				  <div class="mb-3 mt-3">
				    <label for="email" class="form-label">Email:</label>
				    <input type="text" class="form-control" placeholder="Enter email" name="cusMail">
				  </div>
				  <div class="mb-3">
				    <label for="pwd" class="form-label">Password:</label>
				    <input type="password" class="form-control" placeholder="Enter password" name="cusPw">
				  </div>
				  <button type="submit" class="btn btn-primary">로그인</button>
				</form>
				  <br>
			<a href="/Semi_F_GDCC/customer/findIdForm.jsp" style="text-decoration-line: none; color: black;">
				ID찾기
			</a>
				&nbsp;
			<a href="/Semi_F_GDCC/customer/findPwForm.jsp" style="text-decoration-line: none; color: black;">
				비밀번호 찾기
			</a>
					</div>
					<div class="col"></div>
				</div>
			</div>
          </div>
        </div>
      </div>
    </section>
    <!-- END section -->
    
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