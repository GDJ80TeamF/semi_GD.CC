<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mail = request.getParameter("mail");
		System.out.println(mail + "<==정보확인 후 가져온 mail");
		if(mail == null){
			mail ="";
		}
	
	String msg = request.getParameter("msg");
		System.out.println(msg + "<===msg");
	
	if(msg == null){
		msg = "";
	}

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>비밀번호 찾기</title>
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
		<div>
			<form method="post" action="/Semi_F_GDCC/customer/action/customerCheckAction.jsp">
				<table style="margin-left:auto; margin-right:auto;">
					<tr>
						<th>
							<label for ="mail">
								mail
							</label>
						</th>
						<td>
							<input type="text" id="mail" name="cusMail" required>
						</td>
					</tr>
					<tr>
						<th>
							<label for ="contact">
								연락처
							</label>
						</th>
						<td>
							<input type="text" id="contact" name="cusContact" required>
						</td>
					</tr>
					<tr>
						<th>
							<label for ="name">
								성함
							</label>
						</th>
						<td>
							<input type="text" id="name" name="cusName" required>
						</td>
					</tr>
				</table>
				<button type="submit" class="btn btn-primary"  style="margin-left:auto; margin-right:auto;">고객정보 확인하기</button>
			</form>
		</div>
	<br>
			
		<div>
			<%
				if(msg.equals("T") && mail != null){
			%>
				<label for="pw">
					새로운 비밀번호를 입력하세요
				</label>
					<form method="post" action = "/Semi_F_GDCC/customer/action/customerResetPwAction.jsp">
							<input type="hidden" name = "mail" value="<%=mail%>">
							<input type="password" name = "newPw" id="pw">
						<button type="submit">변경</button>
					</form>
			<%
				}else if(msg.equals("F")){
					
			%>
				<div>
					정보를 정확히 입력해주세요
				</div>
			<%
				}
			%>		
		</div>
	<br>
		<div>
			<%
				if(msg.equals("G")){
			%>
				<div>
					<span>
						비밀번호가 변경됐습니다. 
					</span>
					<a href="/Semi_F_GDCC/customer/customerLoginForm.jsp">
						로그인하기
					</a>
				</div>
			<%
				}
			%>
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