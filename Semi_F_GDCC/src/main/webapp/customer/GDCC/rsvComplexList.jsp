  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@ page import="gdcc.dao.*" %>
 <%
 

	//인증 분기 세션 변수 이름 : loginCustomer
		if(session.getAttribute("loginCustomer") == null){
			response.sendRedirect("/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp");
			return;
	}
	HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
	
	String cusMail = (String)(login.get("cusMail"));
	
	//고객 아이디로 예약된 예약 번호 불러오기 
 	ArrayList<HashMap<String,Object>> list = RsvComplexDAO.selectRsvList(cusMail);
 
 
 %>

<!DOCTYPE html>
<html>
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
	  text-align:center;
	}
	.container {
	  max-width: 1000px;
	  width: 100%;
	  background: #fff;
	  padding: 25px;
	  border-radius: 8px;
	  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	  text-align:center;
	}
	.container header {
	  font-size: 1.5rem;
	  color: #333;
	  font-weight: 500;
	  text-align: center;
	}
	.container .form {
	  margin-top: 30px;
	  text-align:center;
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
<body>
<header class="site-header js-site-header">
	 <div class="container-fluid">
	        <div class="row align-items-center">
	          <div class="col-6 col-lg-4 site-logo" data-aos="fade">
	          	<a href="/Semi_F_GDCC/welcome.jsp"><img src="/Semi_F_GDCC/customer/GDCC/images/GDCC_main.png" width="150"></a>
	          </div>
		</div>
	</div>
</header>
<section class="section blog-post-entry bg-light" id="next">
 <div class="container">
  <table class="table table-striped">
		<tr>
			<th>시설 예약 번호</th>
			<th>호텔 예약 번호 </th>
			<th> 예약한 시설 </th>
			<th>예약날짜 </th>
			<th>예약시간  </th>
			<th>예약 상태  </th>
			<th>상세보기 </th>
			<th>예약취소 </th>
			
		</tr>
		<tr>
		<%
			for(HashMap<String,Object> m :list){
		%>
		<td><%= (Integer)m.get("comNo")%></td>
		<td><%= (Integer)m.get("rsvNo")%></td>
		<td><%= (String)m.get("rsvPlace")%></td>
		<td><%= (String)m.get("rsvDate")%></td>
		<td><%= (String)m.get("rsvTime")%></td>
		<td><%= (String)m.get("rsvState")%></td>
		<td><a class="btn blue" href="/Semi_F_GDCC/customer/GDCC/rsvComplexOne.jsp?rsvComNo=<%=(Integer)m.get("comNo")%>">상세보기 </a></td>
		<td><a class="btn red" href="/Semi_F_GDCC/customer/GDCC/cancelRsvForm.jsp?rsvComNo=<%=(Integer)m.get("comNo")%>">취소하기 </a></td>
		</tr>
		<%
			}
		
		
		%>
		
	</table>
 		<div><a class="btn blue" href="/Semi_F_GDCC/customer/GDCC/hotelComplex/insertRsvForm.jsp">호텔 시설 새로운 예약하기 !</a></div>
	</div>
	</section>
</body>
</html>