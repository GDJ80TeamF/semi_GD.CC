<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>

<%
	// 인증 분기 세션 변수 이름 : loginEmp
	if(session.getAttribute("loginCustomer") != null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	/* 아이디 중복 체크 */
	String checkId = request.getParameter("checkId");
	
	if(checkId == null) {
		checkId = "";
	}
	String ck = request.getParameter("ck");
	System.out.println("ck: " + ck);
	if(ck == null) {
		ck = "";
	}
	String msg = "";
	if(ck.equals("T")){
		msg = "사용할수 있는 아이디 입니다.";
	} else if(ck.equals("F")){		
		msg = "사용할수 없는 아이디 입니다. 다른 아이디를 써주세요.";
	}
	System.out.println("checkId: " + checkId);
%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>고객 회원가입</title>
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
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
            text-align: center;
        }
        .form-group label, .form-group input, .form-group button, .form-group span {
            display: inline-block;
            vertical-align: middle;
            margin: 5px;
        }
        .form-group label {
            width: 100px;
            text-align: right;
            margin-right: 10px;
        }
        .form-group input {
            width: 45%;
        }
        .form-group button {
            width: 30%;
        }
        .message {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-size: 1.2em;
            color: green;
        }
        .site-header, .site-hero {
            text-align: center;
        }
        .site-header img {
            display: block;
            margin: 0 auto;
        }
    </style>
  </head>
<body>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Login</title>
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
				<div class="bg-white border shadow-sm p-3 mb-5 bg-body-tertiary rounded">	
				<h1 style="text-align: center;">회원가입</h1>
				<form method="post" action="/Semi_F_GDCC/customer/action/customerCheckIdAction.jsp" enctype="multipart/form-data" >
					  <div class="form-group">
                                <label>아이디</label>
                                <input type="email" name="checkId" value="<%=checkId%>"><br>
                                <button type="submit" class="btn btn-primary">아이디 중복 체크</button>
                                <span class="message"><%=msg%></span>
                            </div>
					
				</form>
					
				<form method="post" action="/Semi_F_GDCC/customer/action/insertCustomerAction.jsp">
					
						<!-- T일때만 사용 가능 -->
						<%
							if(ck.equals("T")){
						%>
						<input type="text" name="cusMail" readonly="readonly" value="<%=checkId%>" style="display:none">
						<%
							}else if(ck.equals("F")){
						%>
						<input type="text" name="cusMail" readonly="readonly" style="display:none">
						<%
							}
						%>
						
						<div class="form-group">
                                <label>이름</label>
                                <input type="text" name="cusName">
                            </div>
                            <div class="form-group">
                                <label>비밀번호</label>
                                <input type="password" name="cusPw">                        
                            </div>
                            <div class="form-group">
                                <label>성별</label>
                                <input type="text" name="cusGender">
                            </div>
                            <div class="form-group">
                                <label>생년월일</label>
                                <input type="date" name="cusBirth">
                            </div>
                            <div class="form-group">
                                <label>전화번호</label>
                                <input type="text" name="cusContact">
                            </div>
                            <div class="form-group">
                                <label>프로필</label>
                                <input type="file" name="cusProfile">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">회원가입 완료</button>        
                            </div>        
						
							
				</form>
				</div>
			</div>
		</div>
  	</div>
  </div>
</section>
	<%-- <h1>회원가입</h1>
	<form method="post" action="/Semi_F_GDCC/customer/action/customerCheckIdAction.jsp" enctype="multipart/form-data" >
		아이디:
		<input type="email" name="checkId" value=<%=checkId%>>
		<button type="submit">아이디 중복 체크</button>
		<br><span><%=msg%></span>
	</form>
		
		<form method="post" action="/Semi_F_GDCC/customer/action/insertCustomerAction.jsp">
			<div>
				<!-- T일때만 사용 가능 -->
				<%
					if(ck.equals("T")){
				%>
				<input type="text" name="cusMail" readonly="readonly" value="<%=checkId%>" style="display:none">
				<%
					}else if(ck.equals("F")){
				%>
				<input type="text" name="cusMail" readonly="readonly" style="display:none">
				<%
					}
				%>
			</div>
		<div>
			이름:
			<input type="text" name="cusName">
		</div>
		<div>
			비밀번호:
			<input type="text" name="cusPw">
		</div>
		<div>
			성별:
			<input type="text" name="cusGender">
		</div>
		<div>
			생년월일:
			<input type="date" name="cusBirth">
		</div>
		<div>
			전화번호:
			<input type="text" name="cusContact">
		</div>
		<div>
			프로필:
			<input type="file" name="cusProfile">
		</div>
		<div>
			<button type="submit">회원가입 완료</button>
		</div>
	</form> --%>

    
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