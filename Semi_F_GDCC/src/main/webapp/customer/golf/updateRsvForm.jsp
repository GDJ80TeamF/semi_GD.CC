<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import="java.util.*" %>
<%

	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	//세션에서 메일 가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 

	 String rsvMail = (String)(login.get("cusMail"));
	 	System.out.println(rsvMail + "updateRsvForm.rsvMail");
	 	
	 	
	//예약번호 불러오기
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
		System.out.println(rsvNo + "<==updateRsvForm.rsvNo");
		
	//예약번호에 맞춰서 가져오기
	HashMap<String,Object>updateRsv = RsvGolfDAO.selectRsvOne(rsvNo);
		System.out.println(updateRsv + "<==updateRsvForm.updateRsv");
		
	//날짜와 코스를 체크하고 그 날짜&코스의 T-TIME가져오기
	String checkSession = request.getParameter("checkSession");
		System.out.println(checkSession + "checkSession");
	
	String checkDate = request.getParameter("checkDate");
	String checkCourse = request.getParameter("checkCourse");
		System.out.println(checkDate + "<==checkDateCourse.checkDate");
		System.out.println(checkCourse + "<==checkDateCourse.checkCourse");
		
	 ArrayList<HashMap<String,Object>> tableRsvTime = (ArrayList<HashMap<String,Object>>) session.getAttribute("tableRsvTime");
		System.out.println(tableRsvTime + "<===tableRsvTime예약된 시간 담겨져있음");	
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
    <link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/updateRsvForm.css">
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
        <h1 class="heading"></h1>
		 <div class="mb-3 mt-3">
			<h2>Change Booking</h2>
				<div class="content">
		<%
			if(checkSession == null){
		%>
				<form method="post" action="/Semi_F_GDCC/customer/action/checkUpdateAction.jsp">
				<input type="hidden" name="rsvNo" value="<%=rsvNo%>">
				<label for="date">
					예약 날짜
				</label>
				<input type ="date" id="date" name="rsvDateCheck" value="<%=updateRsv.get("rsvDate")%>">
			<br>
				<label for="course">
					Start Course
				</label>
			<br>
					<%
						if(updateRsv.get("rsvCourse").equals("IN")){//선택했던 코스가 IN코스였던 경우
					%>
						<input type="radio" id ="course" name="rsvCourseCheck" value="IN" checked="checked">IN코스
						<input type="radio" id ="course" name="rsvCourseCheck" value="OUT" >OUT코스
					<%							
						}else{//선택했던 코스가 OUT코스인 경우
					%>
						<input type="radio" id ="course" name="rsvCourseCheck" value="IN">IN코스
						<input type="radio" id ="course" name="rsvCourseCheck" value="OUT" checked="checked">OUT코스
					<%
						}
					%>
				<br>
				<button type="submit" class="btn btn-warning" style="color : ivory; font-weight: bold;">
					T-TIME확인하기
				</button>
			</form>
		<%
			}
		%>
			<br>
			<!-- 여기서 부터 다시 action페이지로 넘길 값을 넣어줘야함 위의 코스랑, 날짜는 숨겨서 -->
			<form method="post" action="/Semi_F_GDCC/customer/golf/action/updateRsvAction.jsp">
				<%
					if(checkSession != null && checkSession.equals("T")){
				%>
						<input type="hidden" name="rsvNo" value="<%=rsvNo%>">
						<input type="hidden" name="rsvMail" value="<%=rsvMail%>">
						
						<label for="date">
							예약 날짜
						</label>
						<input type ="date" id="date" name="rsvDate" value="<%=checkDate%>">
					<br>
						<label for="course">
							Start Course
						</label>
					<br>
							<%
								if(checkCourse.equals("IN")){//선택했던 코스가 IN코스였던 경우
							%>
								<input type="radio" id ="course" name="rsvCourse" value="IN" checked="checked">IN코스
								<input type="radio" id ="course" name="rsvCourse" value="OUT" >OUT코스
							<%							
								}else{//선택했던 코스가 OUT코스인 경우
							%>
								<input type="radio" id ="course" name="rsvCourse" value="IN">IN코스
								<input type="radio" id ="course" name="rsvCourse" value="OUT" checked="checked">OUT코스
							<%
								}
							%>
					<br>
						<label>
							T-TIME선택
						</label>
					<br>
						 	<% 
					         	HashSet<Integer> set = new HashSet<Integer>();
					            set.add(1);
				           		set.add(2);
				           		set.add(3);
				           		set.add(4);
				           		set.add(5);
				           		set.add(6);
				           		set.add(7);
				           		set.add(8);
				           		set.add(9);
		
					         	for (HashMap<String,Object> m : tableRsvTime) { 
					         		
					         		set.remove(Integer.parseInt((String)(m.get("rsvTtime"))));
				
					        	}
				         	
				         	
				         		for(Integer i : set) {
				       	 	%>
				        		<input type="radio" name="rsvTtime" value="<%=i%>">
							        <%	
							        	switch (i) {
										    case 1:
										        out.print("11:00");
										        break;
										    case 2:
										        out.print("11:15");
										        break;
										    case 3:
										        out.print("11:30");
										        break;
										    case 4 :
										    	out.print("11:45");
										    	break;
										    case 5 :
										    	out.print("12:00");
										    	break;
										    case 6 :
										    	out.print("12:15");
										    	break;
										    case 7 :
										    	out.print("12:30");
										    	break;
										    case 8 :
										    	out.print("12:45");
										    	break;
										    case 9 :
										    	out.print("13:00");
										    	break;
									    	
										}
				     				%>
				        <% 		
				         	}
				        %>
					<br>
						<label>
							동반인원
						</label>
						<select name="rsvMember" value="<%=updateRsv.get("member")%>">
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					<br>
						<label>
							요청사항
						</label>
					<br>
						<textarea rows="3" cols="40" name="rsvRequest" placeholder="요청사항을 적어주세요"></textarea>
					<br>
					<button type="submit" class="btn btn-warning" style="color : ivory; font-weight: bold;">
						변경요청
					</button>
					<%
						}
					%>
				</form>
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