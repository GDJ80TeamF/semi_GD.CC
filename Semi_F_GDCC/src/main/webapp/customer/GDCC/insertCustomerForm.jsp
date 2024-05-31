<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>

<%
    // 인증 분기 세션 변수 이름 : loginEmp
    if(session.getAttribute("loginCustomer") != null){
        response.sendRedirect("/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp");
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
        msg = "사용할수 없습니다. 다른 아이디를 써주세요.";
    }
    System.out.println("checkId: " + checkId);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <!--<title>Registration Form in HTML CSS</title>-->
    <!---Custom CSS File--->
    <link rel="stylesheet" href="style.css" />
    
  <style>
	/* Import Google font - Poppins */
	@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
	* {
	  margin: 0;
	  padding: 0;
	  box-sizing: border-box;
	  font-family: "Poppins", sans-serif;
	}
	body {
	  position: relative;
	  min-height: 100vh;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  padding: 20px;
	  background-image: url('/Semi_F_GDCC/customer/GDCC/images/hotel_background.png');
	  background-size: cover;
	  background-position: center;
	}
	body::before {
	  content: '';
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: rgba(0, 0, 0, 0.5); /* Adjust the opacity as needed */
	  z-index: 1;
	}
	.container {
	  position: relative;
	  z-index: 2;
	}
	.container {
	  max-width: 700px;
	  width: 100%;
	  background: #fff;
	  padding: 25px;
	  border-radius: 8px;
	  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	}
	.container header {
	  font-size: 1.5rem;
	  color: #333;
	  font-weight: 500;
	  text-align: center;
	}
	.container .form {
	  margin-top: 30px;
	}
	.form .input-box {
	  width: 100%;
	  margin-top: 20px;
	}
	.input-box label {
	  color: #333;
	}
	.form :where(.input-box input, .select-box) {
	  position: relative;
	  height: 50px;
	  width: 100%;
	  outline: none;
	  font-size: 1rem;
	  color: #707070;
	  margin-top: 8px;
	  border: 1px solid #ddd;
	  border-radius: 6px;
	  padding: 0 15px;
	}
	.input-box input:focus {
	  box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
	}
	.form .column {
	  display: flex;
	  column-gap: 15px;
	}
	.form .gender-box {
	  margin-top: 20px;
	}
	.gender-box h3 {
	  color: #333;
	  font-size: 1rem;
	  font-weight: 400;
	  margin-bottom: 8px;
	}
	.form :where(.gender-option, .gender) {
	  display: flex;
	  align-items: center;
	  column-gap: 50px;
	  flex-wrap: wrap;
	}
	.form .gender {
	  column-gap: 5px;
	}
	.gender input {
	  accent-color: rgb(130, 106, 251);
	}
	.form :where(.gender input, .gender label) {
	  cursor: pointer;
	}
	.gender label {
	  color: #707070;
	}
	.address :where(input, .select-box) {
	  margin-top: 15px;
	}
	.select-box select {
	  height: 100%;
	  width: 100%;
	  outline: none;
	  border: none;
	  color: #707070;
	  font-size: 1rem;
	}
	.form button {
	  height: 45px;
	  width: 150px;
	  color: #fff;
	  font-size: 1rem;
	  font-weight: 400;
	  margin-top: 30px;
	  border: none;
	  cursor: pointer;
	  transition: all 0.2s ease;
	  background: orange;
	  border-radius:10px;
	}
	.form button:hover {
	  background: rgb(88, 56, 250);
	}
	/* Positioning the logo to the top-left corner */
	.site-logo {
	  position: absolute;
	  top: 50px;
	  left: 50px;
	  z-index: 2; /* Ensure the logo stays above the overlay */
	}
	.site-logo img {
	  width: 150px;
	}
	/*Responsive*/
	@media screen and (max-width: 500px) {
	  .form .column {
	    flex-wrap: wrap;
	  }
	  .form :where(.gender-option, .gender) {
	    row-gap: 15px;
	  }
	}
	
	 @keyframes fadeInUp {
	        0% {
	            opacity: 0;
	            transform: translate3d(0, 10%, 0);
	        }
	        to {
	            opacity: 1;
	            transform: translateZ(0);
	        }
	    }
	 
	    .container {
	        position: relative;
	        animation: fadeInUp 1s;
	    }
	</style>
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
    <section class="container"> 
      <header>Sign Up</header>
     <form method="post" action="/Semi_F_GDCC/customer/action/customerCheckIdAction.jsp" enctype="multipart/form-data" class="form">
            <div class="column">
            <div class="input-box">
              <label>Email Address</label>
              <input type="text" name="checkId" placeholder="Enter email address" required  value="<%=checkId%>">
             <span class="message"><%=msg%></span> 
             </div>
              <div class="input-box">
              <button type="submit">아이디 중복 체크</button><br>                                 
            </div>
            </div>
        </form>
        <form method="post" action="/Semi_F_GDCC/customer/action/insertCustomerAction.jsp" enctype="multipart/form-data" class="form">
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
        <div class="input-box">
          <label>Password</label>
          <input type="password" name="cusPw" placeholder="Enter full password" required />
        </div>
        
         <div class="input-box">
          <label>Full Name</label>
          <input type="text" name="cusName" placeholder="Enter full name" required />
        </div>

          <div class="gender-box">
              <h3>Gender</h3>
              <div class="gender-option">
                <div class="gender">
                  <input type="radio" name="cusGender" value="남" checked />
                  <label for="check-male">male</label>
                </div>
                <div class="gender">
                  <input type="radio" name="cusGender" value="여"/>
                  <label for="check-female">Female</label>
                </div>
              </div>
        </div>

        <div class="column">
            <div class="input-box">
                <label>Birth Date</label>
                <input type="date"  name="cusBirth" placeholder="Enter birth date" required />
              </div>
          <div class="input-box">
            <label>Phone Number</label>
            <input type="text" name="cusContact" placeholder="Enter phone number" required />
          </div>
        </div>
        
        <div class="input-box">
        	 <label>Profile</label>
        	 <input type="file" name="cusProfile" required />
        </div>
        
        <div style="text-align:center !important;">        
        <button type="submit">회원가입 완료</button>
        </div>
      </form>
    </section>
  </body>
</html>
