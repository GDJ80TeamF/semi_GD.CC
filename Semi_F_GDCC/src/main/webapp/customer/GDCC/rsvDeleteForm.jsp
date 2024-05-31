<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%

	String checkId = request.getParameter("checkId");
	if(checkId == null) {
		checkId = "";
	}
	String ck = request.getParameter("ck");
	if(ck == null) {
		ck = "";
	}
	
	String msg = "";
	if(ck.equals("T")) {
		msg = "인증 되셨습니다";
	} else if(ck.equals("F")) {
		msg = "아이디 또는 비밀번호를 확인하세요";
	}
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<-- rsvNo rsvDeleteForm.jsp param ");
	
	int rsvBfno = Integer.parseInt(request.getParameter("rsvBfno"));
	System.out.println(rsvBfno + "<-- rsvBfno rsvDeleteForm.jsp param ");
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
    <!-- css -->
   	<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/rsvDeleteForm.css">
<title>Insert title here</title>
<style>
	.button {
		background-color: #f2f2f2; /* 기본 배경색을 밝은 그레이로 설정합니다. */
		color: #333; /* 기본 텍스트 색상을 어두운 그레이로 설정합니다. */
		border: 1px solid #ccc; /* 테두리를 회색으로 설정합니다. */
		padding: 10px 20px; /* 버튼의 내부 여백을 설정합니다. */
		font-size: 16px; /* 버튼의 글꼴 크기를 설정합니다. */
		cursor: pointer; /* 커서 모양을 포인터로 설정합니다. */
		transition: background-color 0.3s, color 0.3s, border-color 0.3s; /* 호버 효과를 부드럽게 만듭니다. */
		width: 100%;
		height: 50px;
		border-radius: 10px; /* 버튼을 둥글게 만듭니다. */
	}
	.button:hover {
		background-color: #e0e0e0; /* 호버 시 배경색을 조금 더 어둡게 설정합니다. */
		color: #222; /* 호버 시 텍스트 색상을 어둡게 설정합니다. */
		border-color: #999; /* 호버 시 테두리 색상을 어둡게 설정합니다. */
	}
</style>
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
							 <li><a href="/Semi_F_GDCC/customer/myPage.jsp">My page</a></li>
							 <li><a href="/Semi_F_GDCC/customer/action/customerLogoutAction.jsp">LogOut</a></li>
							 
						<%
							  	}
						%>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/main.jsp">Hotel Main</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/golfMain.jsp">Golf Main</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/about.jsp">About</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/direction.jsp">Direction</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/QnAList.jsp">QnA</a></li>
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

		<div class="row site-hero-inner justify-content-center align-items-center">
		<div class="col-md-10 text-center" data-aos="fade-up">
		<span class="custom-caption text-uppercase text-white d-block  mb-3"><h1 style="color: white; font-size: 55px;">WARNING</h1><br>아이디와 패스워드를 입력하세요</span>
	        <!--  <div style="background-color:white; padding:100px; border-radius:10px;"> -->
			<div class="container2">
			<div class="mb-3 mt-6;">
			
			<div style="margin: 0 auto; width: 50%;">			
				<form method="post" action="/Semi_F_GDCC/customer/hotelBf/action/rsvDeleteCkAction.jsp">
					<table>
						<tr>
							<td>ID :</td>
							<td>
								<input type="text" name="checkId">
								<input type="hidden" name="rsvNo" value="<%=rsvNo%>">
								<input type="hidden" name="rsvBfno" value="<%=rsvBfno%>">
							</td>
						</tr>
						<tr>
							<td>PW :</td>
							<td>
								<input type="password" name="checkPw">
								
							</td>
						</tr>																				
					</table>
					<button class="button" type="submit">입 력</button>
				</form>
				<br>	
				<div><%=msg%></div>
				<div>
					 <%
						if(ck.equals("T")) {
					 %>
						<a href="/Semi_F_GDCC/customer/hotelBf/action/rsvDeleteAction.jsp?rsvNo=<%=rsvNo%>&
									rsvBfno=<%=rsvBfno%>">취소</a>
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