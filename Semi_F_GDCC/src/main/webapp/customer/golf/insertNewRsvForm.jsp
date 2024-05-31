<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%
	//인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp");
		return;
	}
%>
<%
// Calendar 객체 생성<<<오늘 이전의 날짜 
Calendar calendar = Calendar.getInstance();

// 현재 날짜를 가져오기
int year = calendar.get(Calendar.YEAR);
int month = calendar.get(Calendar.MONTH) + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
int day = calendar.get(Calendar.DAY_OF_MONTH);

// 가져온 날짜를 YYYY-MM-DD 형식의 문자열로 변환
String today = String.format("%04d-%02d-%02d", year, month, day);
	System.out.println(today + "<===오늘날짜");
%>
<%
	//세션 가져오기
	 HashMap<String, Object> login = (HashMap<String, Object>)(session.getAttribute("loginCustomer")); 	 

	 String cusMail = (String)(login.get("cusMail"));
	 	System.out.println(cusMail + "rsvGolfList.cusMail");

	//golf_course테이블에서 코스 정보 가져옴/디버깅확인
	ArrayList<HashMap<String,Object>> golfCourse = RsvGolfDAO.courseList();
		System.out.println(golfCourse + "<==insertNewRsvForm.golfCourse");
		
		
	String courseName = request.getParameter("courseName");
		System.out.println(courseName + "<==insertNewRsvForm.courseName");
	
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
<meta charset="UTF-8">
<title>라운딩예약하기</title>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GDCC Hotel by Colorlib.com</title>
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 템플릿 -->
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

<!-- 여기가 원래 css쟈리 -->
<!-- css파일연결 -->
<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/insertNewRsvForm.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300&display=swap" rel="stylesheet">

</head>
	<!-- 캘린더 API가져오기 -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
		    var calendarEl = document.getElementById('calendar');
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		        initialView: 'dayGridMonth',
		        selectable: true,
		        dateClick: function(info) {
		            // 캘린더에서 날짜를 클릭했을 때 해당 날짜를 선택한 날짜 input 요소에 자동으로 설정
		            document.getElementById('date').value = info.dateStr;
		            console.log("Clicked event occurs : date =" + info.dateStr);
		            
		            var selectedDate = new Date(info.dateStr);
		            var today = new Date();
		            var dateWithoutTime = new Date(today.getFullYear(), today.getMonth(), today.getDate());
		            
		            // 선택한 날짜가 오늘 이전의 날짜인지 확인
		            if (selectedDate.getTime() < dateWithoutTime.getTime()) {
		                alert("오늘 이전의 날짜는 선택할 수 없습니다.");
		                return false; // 선택 취소
		            }

		            // 캘린더에서 날짜를 클릭했을 때 해당 날짜를 선택한 날짜 input 요소에 자동으로 설정
		            document.getElementById('date').value = info.dateStr;
		            console.log("Clicked event occurs : date =" + info.dateStr);
		        }
		    
		    
		    });
		    calendar.render();
		});
    </script>
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
                        <li class="active"><a href="/Semi_F_GDCC/customer/golf/golfMain.jsp">Home</a></li>
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
                        <li><a href="/Semi_F_GDCC/customer/GDCC/main.jsp">HotelMain</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/aboutCourse.jsp">Course</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/restaurant.jsp">HalfwayHouse</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/golfReviewList.jsp">Reviews</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/direction.jsp">Direction</a></li>      
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
  <section class="site-hero overlay" style="background-image: url(/Semi_F_GDCC/css/img/grand.jpg)" data-stellar-background-ratio="0.5">
  
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <span class="custom-caption text-uppercase text-white d-block  mb-3">Enjoy Premium<span class="fa fa-star text-primary"> Golfing </span></span>
            <h1 class="heading">BOOKING</h1>
          </div>
        </div>

  		<a class="mouse smoothscroll" href="#next">
		   	<div class="mouse-icon">
		   		<span class="mouse-wheel"></span>
		 	</div>
		</a>
	
  </section>
<div class="form">
<div class="container">
	<div class="content">
		<div id='calendar'> </div>
	</div><!-- containt마지막 -->	
		<div class="content2">
		<%
			if(checkSession == null){
		%>
			<span style="color : orange; font-weight: bold;">원하는 날을 선택해주세요</span>
				<br><hr>
					<form method="post" action="/Semi_F_GDCC/customer/action/checkDateCourseAction.jsp">
					<br>
						<label for="date">
							날짜
						</label>
					<input type="date" id="date" name="rsvDateCheck" min="<%=today %>" >
				<br>
					<label for="course">
						시작코스
					</label>
					<br>
					<input type="radio" id="course" name="rsvCourseCheck" value="IN"> IN코스
					<input type="radio" id="course" name="rsvCourseCheck" value="OUT"> OUT코스
				<br>
					<button type="submit" class="btn btn-warning" style="color : ivory; font-weight: bold;">T-TIME확인하기</button>
				</form>
			<%
				}else{
			%>
			<%
				}
			%>
				
				<form method="post" action="/Semi_F_GDCC/customer/action/insertNewRsvAction.jsp">
					<%
						if(checkSession != null && checkSession.equals("T")){
							//checkSession이 null이라는 것은 date랑 course를 체크했다는 것! 
					%>
				<span>원하는 날짜를 선택하세요</span>
					<br><hr>
							<label for="date">
					                라운딩 날짜
						        </label>
					            <input type="date" id="date" name="rsvDate" value="<%= checkDate%>" min="<%=today%>">
				          <br>
					            <label for="course">
					                시작코스
					            </label>
					            <input type="radio" id="course" name="rsvCourse" value="<%= checkCourse %>" checked="checked">
					            	<%=checkCourse %>코스
					      <br>
					      		
					      			<label>
					      				가능 T-TIME 
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
					        <label for="mail">
					       	 	고객 mail
					        </label>
					        <input type="text" id = "mail" name="rsvMail" value="<%=cusMail%>" style="width : 200px;">
				        <br>
					        <label for = "member">
					        	동반인원
					        </label>
					        <select id = "member" name ="rsvMember">
					        	<option value="3">3명</option>
					        	<option value="4">4명</option>
					        	<option value="5">5명</option>
					        </select>
				        <br>
					        <label for="request">
					     		요청사항
					        </label>
					    <br>
					        <textarea rows="3" cols="30" name="rsvRequest"></textarea>
						<br>
						<button type="submit" class="btn btn-warning" style="color : ivory; font-weight: bold;" >예약하기</button>
					<%
						}
					%>
				
			</form>	
		</div><!-- content2 -->
	</div><!-- container마지막 -->	
</div>


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