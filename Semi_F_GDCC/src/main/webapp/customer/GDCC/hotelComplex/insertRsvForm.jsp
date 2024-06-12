<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.util.*" %>
<%

	//인증 분기 세션 변수 이름 : loginCustomer
		if(session.getAttribute("loginCustomer") == null){
			response.sendRedirect("/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp");
			return;
	}
	HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 
	
	String cusMail = (String)(login.get("cusMail"));
	//고객 아이디로 예약된 예약 번호 불러오기 
	
	ArrayList <HashMap<String,Object>> list = RsvHotelDAO.selectRsvNo(cusMail);
	ArrayList <HashMap<String,Object>> complexList = ComplexDAO.selectComplexNo();
	
	String rsvNo = request.getParameter("rsvNo");
	if (rsvNo == null){
		rsvNo = " ";
	}
	
	String rsvPlace = request.getParameter("rsvPlace");
	if (rsvPlace == null){
		rsvPlace = " ";
	}
	String rsvDate = request.getParameter("rsvDate");
	if (rsvDate == null){
		rsvDate = " ";
	}
%>
<!DOCTYPE html>
<html>
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
	  text-align:center;
	}
	.container {
	  max-width: 700px;
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
  </head>
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
<!-- 예약번호 선택하기   -->
<%
	if(rsvNo == " "){
%>
<form method="post" action="/Semi_F_GDCC/customer/GDCC/hotelComplex/checkRsvNo.jsp">
	<table style=" margin-left:auto; margin-right:auto;">		
		<tr>
			<td>호텔 예약번호</td>
			<td>
			<select name="rsvNo">
			<%
				for(HashMap<String,Object> m:list){
			%>
			<option value="<%=(Integer)m.get("rsvNo")%>"><%=(Integer)m.get("rsvNo")%></option>
			
			<%
				}
			
			%>
			</select>
			</td>
		</tr>	
	</table>
	<br>
	<button type="submit" class="btn blue">예약번호 선택 </button>
</form>
<%
	}else if(rsvNo != " " && rsvPlace == " " && rsvDate ==" "){
		int rsvNoparam = Integer.parseInt(rsvNo);
		HashMap<String,Object> date = RsvHotelDAO.selectdate(rsvNoparam);
%>
	
<form method="post" action="/Semi_F_GDCC/customer/GDCC/hotelComplex/checkDatePlace.jsp">
<table style=" margin-left:auto; margin-right:auto;">
		<tr>
			<td>호텔 예약번호</td>
			<td>
			<input name="rsvNo" value="<%=rsvNo%>" readonly>
			</td>
		</tr>	
		<tr>
			<td>예약날짜</td>
			<td>
			<input type="date" name="rsvDate" min="<%=(String)date.get("checkinDate")%>" max="<%=(String)date.get("checkoutDate")%>">
			
			</td>
	
		</tr>
		<tr>
			<td>이용 시설 </td>
			<td>
			<select name="rsvPlace">
			<%
				for(HashMap<String,Object> n:complexList){
			%>
			<option value="<%=(Integer)n.get("complexNo")%>"><%=(String)n.get("complexName")%></option>
			<%
				}
			%>
			
			</select>
			
			</td>
			
		</tr>
</table>
<br>
<button type="submit" class="btn blue">예약 가능한 시간대 확인 </button>

</form>
<%
	}else if(rsvPlace != " " && rsvDate != " " && rsvNo !=" "){
%>

<form method="post" action="/Semi_F_GDCC/customer/hotelComplex/insertRsvAction.jsp" style="text-align:center;">
<table style=" margin-left:auto; margin-right:auto;">
		<tr>
			<td>호텔 예약번호</td>
			<td>
			<input name="rsvNo" value="<%=rsvNo%>" readonly>
			</td>
		</tr>	
		<tr>
			<td>예약날짜</td>
			<td>
			<input type="date" name="rsvDate" value="<%=rsvDate%>" readonly>
			
			</td>
	
		</tr>
		<tr>
			<td>이용 시설 </td>
			<td>
			<%
			//선택된 부가시설 이름 출력해주기
			HashMap<String,Object> m = ComplexDAO.selectComplexOne(Integer.parseInt(rsvPlace));
			String complexName = (String) m.get("complexName");
			
			%>
			<select name="rsvPlace">
			<option value="<%=rsvPlace%>" selected readonly><%=complexName%></option>
			
			</select>
			
			</td>
			
		</tr>
		<tr>
			<td>예약 시간</td>
			<td>
			<%
			int rsvPlaceint = Integer.parseInt(rsvPlace);
			ArrayList<HashMap<String,Object>> times = RsvComplexDAO.selectTimes(rsvPlaceint, rsvDate);
			System.out.println(times.size());
			%>
			
			<%
				if(times.size() != 0){
			%>
			<select name="rsvTime">
			<%
					for(HashMap<String,Object> t:times){
						
			%>
					<option value="<%=(String)t.get("rsvTime")%>"><%=(String)t.get("rsvTime")%></option>
					
			<% 
					}
			%>
			</select>
			</td> 
			<tr>
			<td>예약 인원 </td>
			<td><input type="number" min="1" max="6" name="rsvMember"></td>
		</tr>
	
		</table>
		<br>
		<button type="submit" class="btn blue">예약하기 </button>
		<a class="btn red" href="/Semi_F_GDCC/customer/GDCC/hotelComplex/insertRsvForm.jsp?rsvNo=<%=rsvNo%>">다른 날짜 선택 </a>
		</form>
 			<% 
				}else if(times.size() == 0){
			%>
					<div>모든 시간대가 마감되었습니다. 다른 날짜나 시설을 선택해주세요.</div>
					<a class="btn red" href="/Semi_F_GDCC/customer/GDCC/hotelComplex/insertRsvForm.jsp?rsvNo=<%=rsvNo%>">다른 날짜 선택 </a>
			<% 
					}
			%>

<%
	}
%> 
</section>
</body>
</html>