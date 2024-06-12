<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	HashMap<String,Object> loginMember 
	= (HashMap<String,Object>)(session.getAttribute("loginCustomer"));
	
	String cusMail = request.getParameter("cusMail");
	System.out.println(cusMail+ "<<==cusMail");
	
	
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int rowPerPage = 10;
	int startRow = (currentPage-1) * rowPerPage;
	//페이징 lastPage 구하는 dao 호출 
	int lastPage = QnaDAO.page();
	System.out.println(lastPage + "<--lastPage QnAList param");
	
	//QnA리스트 출력하는 메서드
	ArrayList<HashMap<String, Object>> list = QnaDAO.selectQnAList(startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!----------------------  템플릿 ------------------------>

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
<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/qnaList.css">

<!----------------------  템플릿 ------------------------>
</head>
<style>
	h1 {
		text-align: center;
		}
        
</style>
<body>
<!----------------------  템플릿 ------------------------>
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
                        <li><a href="/Semi_F_GDCC/customer/GDCC/main.jsp">Hotel Main</a></li>
                        <li><a href="/Semi_F_GDCC/customer/golf/golfMain.jsp">Golf Main</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/direction.jsp">Direction</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/QnAList.jsp">QnA</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/golfReviewList.jsp">Golf Reviews</a></li>
                        <li><a href="/Semi_F_GDCC/customer/GDCC/hotelReviewList.jsp">Hotel Reviews</a></li>
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

<section class="site-hero inner-page overlay" style="background-image: url(images/hero_4.jpg)" data-stellar-background-ratio="0.5">
	<div class="container">
	  <div class="row site-hero-inner justify-content-center align-items-center">
	    <div class="col-md-10 text-center" data-aos="fade">
	      <h1 class="heading mb-3">QnA</h1>
	      <ul class="custom-breadcrumbs mb-4">
	        <li><a href="index.html">Home</a></li>
	        <li>&bullet;</li>
	        <li>QnA</li>
	      </ul>
	    </div>
	  </div>
	</div>

	<a class="mouse smoothscroll" href="#next">
	  <div class="mouse-icon">
	    <span class="mouse-wheel"></span>
	  </div>
	</a>
</section>

<!----------------------  템플릿 ------------------------>
<section class="section blog-post-entry bg-light" id="next">
	<div class="container">
	    <h1>QnA 게시판</h1><br>
	    <a href="/Semi_F_GDCC/customer/GDCC/insertQnAForm.jsp" class="write-button">글 쓰기</a>
	    <hr>
	    <table>
	        <thead>
	        <tr>
	            <th>NO.</th>
	            <th>제목</th>
	            <th>작성자</th>
	        </tr>
	        </thead>
	        <tbody>
	        <%
	        	for(HashMap m : list) { 
	        %>
	            <tr>
	                <td>
	                    <a href="/Semi_F_GDCC/customer/GDCC/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
	                        <%=(Integer)(m.get("qnaNo"))%>
	                    </a>
	                </td>
	                <td>
	                    <a href="/Semi_F_GDCC/customer/GDCC/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
	                        <%=(String)(m.get("qnaTitle"))%>
	                    </a>
	                </td>
	                <td>
	                    <a href="/Semi_F_GDCC/customer/GDCC/QnAOne.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">
	                        <%=(String)(m.get("cusMail"))%>
	                    </a>
	                </td>
	            </tr>
	        <%
	        	}
	        %>
	        </tbody>
	    </table>
	    <!-- START 페이징 버튼 -->
	    <div class="pagination">
	        <%
	        	if(currentPage > 1){ 
	        %>
	            <a href="/Semi_F_GDCC/customer/GDCC/QnAList.jsp?currentPage=1"> &nbsp;<< 처음 페이지 </a>
	            <a href="/Semi_F_GDCC/customer/GDCC/QnAList.jsp?currentPage=<%=currentPage-1%>">&nbsp; < 이전 </a>                   
	        <%
	        	}
	        %>
	        <%
	        	if(currentPage < lastPage){ 
	        %>   
	            <a href="/Semi_F_GDCC/customer/GDCC/QnAList.jsp?currentPage=<%=currentPage+1%>"> 다음 >&nbsp; </a>
	            <a href="/Semi_F_GDCC/customer/GDCC/QnAList.jsp?currentPage=<%=lastPage%>"> 마지막 페이지 >>&nbsp;</a>
	        <%
	        	}
	        %>
	    </div>
	     <!-- END 페이징 버튼 -->
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
<!----------------------  템플릿 ------------------------>
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
<!----------------------  템플릿 ------------------------>
</body>
</html>