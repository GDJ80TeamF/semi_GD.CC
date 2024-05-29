<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mail = request.getParameter("mail");

	String msg = request.getParameter("msg");
	
	if(msg == null){
		msg = "";
	}else if(msg.equals("F")){
		msg = "다시 입력해주세요";
	}
	if(msg.equals("T")){
		msg = "고객님의 email은" + mail + "입니다";
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>아이디 찾기</title>
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
            </div>
          </div>
        </div>
    </header>
     <section class="site-hero overlay" style="background-image: url(/Semi_F_GDCC/customer/GDCC/images/hotel_background.png)" data-stellar-background-ratio="0.5">
	<div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
				     <span class="custom-caption text-uppercase text-white d-block mb-3">Find ID</span>
            <div class="container">
				<div class="bg-white border shadow-sm p-3 mb-5 bg-body-tertiary rounded">	
			<form method="post" action="/Semi_F_GDCC/customer/action/findIdAction.jsp">
				<table style="margin-left:auto; margin-right:auto;">
					<tr>
						<th>
							<label for="name">
								성함 : 
							</label>
						</th>
						<td>
							<input type="text" id ="name" name ="cusName">
						</td>
					</tr>
					<tr>
						<th>
							<label for="birth">
								생년월일 : 
							</label>
						</th>
						<td>
							<input type="date" id ="birth" name ="cusBirth">
						</td>
					</tr>
					<tr>
						<th>
							<label for="contact">
								전화번호 : 
							</label>
						</th>
						<td>
							<input type="text" id ="contact" name ="cusContact" placeholder="01012345678(-없이 입력)">
						</td>
					</tr>
				</table>
				<button type="submit" class="btn btn-primary">찾기</button>
				<%=msg %>
			</form>
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