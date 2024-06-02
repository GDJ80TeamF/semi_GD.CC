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
    <!-- 예약 버튼 -->
    <style>
   	.centered-container {
      display: flex;
      justify-content: center;
      align-items: center; /* 수직 중앙 정렬을 위한 선택 사항 */
      height: 10vh; /* 전체 높이를 설정하여 수직 중앙 정렬을 확인할 수 있게 함 */
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
                    
                      <ul class="list-unstyled menu">
                        <li class="active"><a href="/Semi_F_GDCC/customer/GDCC/main.jsp">Home</a></li>
                        <%
							  	if(session.getAttribute("loginCustomer") == null){
						%>
                        	<li><a href="/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp">Login</a></li>
                        	<li><a href="/Semi_F_GDCC/customer/insertCustomerForm.jsp">Join MemeberShip</a></li>
                        <%
							}else{
						%>
							 <li><a href="/Semi_F_GDCC/customer/GDCC/myPage.jsp">Mypage</a></li>
							 <li><a href="/Semi_F_GDCC/customer/action/customerLogoutAction.jsp">LogOut</a></li>
							 
						<%
							  	}
						%>
                        <li><a href="/Semi_F_GDCC/customer/golf/golfMain.jsp">GolfMain</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/rooms.jsp">Rooms</a></li>
                        <li><a href="/Semi_F_GDCC/customer/hotelComplex/insertRsvForm.jsp">Hotel Complex</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/QnAList.jsp">Q&A</a></li>
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

    <section class="site-hero overlay" style="background-image: url(/Semi_F_GDCC/customer/GDCC/images/hotel_back.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <span class="custom-caption text-uppercase text-white d-block  mb-3">Welcome To GODEE Hotel</span>
            <h1 class="heading">A Best Place To Stay</h1>
          </div>
        </div>
      </div>

      <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
          <span class="mouse-wheel"></span>
        </div>
      </a>
    </section>
    <!-- END section -->

    <section class="section bg-light pb-0"  >
      <div class="container">
       
        <div class="row check-availabilty" id="next">
          <div class="block-32" data-aos="fade-up" data-aos-offset="-200">
			<!-- 에약 가능한지 확인 -->
           <!-- 예약번호 선택하기   -->
<%
	if(rsvNo == " "){
%>
<form method="post" action="/Semi_F_GDCC/customer/hotelComplex/checkRsvNo.jsp">
	<table>		
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
	<button type="submit">예약번호 선택 </button>
</form>
<%
	}else if(rsvNo != " " && rsvPlace == " " && rsvDate ==" "){
		int rsvNoparam = Integer.parseInt(rsvNo);
		HashMap<String,Object> date = RsvHotelDAO.selectdate(rsvNoparam);
%>
	
<form method="post" action="/Semi_F_GDCC/customer/hotelComplex/checkDatePlace.jsp">
<table>
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
		
<button type="submit">예약 가능한 시간대 확인 </button>

</form>
<%
	}else if(rsvPlace != " " && rsvDate != " " && rsvNo !=" "){
%>

<form method="post" action="/Semi_F_GDCC/customer/hotelComplex/insertRsvAction.jsp">
<table>
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
		<button type="submit">예약하기 </button>
		<a href="/Semi_F_GDCC/customer/hotelComplex/insertRsvForm.jsp?rsvNo=<%=rsvNo%>">다른 날짜 선택 </a>
		</form>
 			<% 
				}else if(times.size() == 0){
			%>
					<div>모든 시간대가 마감되었습니다. 다른 날짜나 시설을 선택해주세요.</div>
					<a href="/Semi_F_GDCC/customer/hotelComplex/insertRsvForm.jsp?rsvNo=<%=rsvNo%>">다른 날짜 선택 </a>
			<% 
					}
			%>
			



<%
	}


%> 

          </div>


        </div>
      </div>
    </section>

    
    
    
    

		
	  <footer class="section footer-section">
  <div class="container">
    <div class="row mb-4">   
        <span class="ion-ios-location h5 mr-3 text-primary"></span>
        <span>Address:<br> (08505) 서울특별시 금천구 <br>가산디지털2로 95</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="ion-ios-telephone h5 mr-3 text-primary"></span>
        <span>Phone: <br>(+1) 234 4567 8910</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="ion-ios-email h5 mr-3 text-primary"></span>
        <span>Email: <br> GDCC@GD.com</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    <div class="row pt-5">
      <p class="col-md-6 text-left">
        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        Copyright &copy;<script>document.write(new Date().getFullYear());</script> MADE BY TEAM F 서기범 나연주 반지현 임아영 <i class="icon-heart-o" aria-hidden="true"></i>
        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
      </p>
    </div>
  </div>
</footer>
<!-- END footer -->	
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