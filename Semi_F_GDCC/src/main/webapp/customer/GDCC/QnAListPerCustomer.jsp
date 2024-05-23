<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%

	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/customerLoginForm.jsp");
		return;
	}
%>
<%
	// 세션에서 고객 mail가져오기
	HashMap<String,Object> login = (HashMap<String,Object>)(session.getAttribute("loginCustomer"));

	String cusMail = (String)(login.get("cusMail"));
	System.out.println(cusMail+ "<--cusMail QnAListPerCustomer.jsp param");
	
	//고객 본인이 작성한 QnA 조회하는 메서드
	ArrayList<HashMap<String, Object>> list = QnaDAO.selectQnAPerCus(cusMail);
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

<!----------------------  템플릿 ------------------------>
<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/qnaListPerCustomer.css">
</head>
<body>
<!----------------------  템플릿 ------------------------>
<header class="site-header js-site-header">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col-6 col-lg-4 site-logo" data-aos="fade"><a href="/Semi_F_GDCC/customer/GDCC/main.jsp"><img src="/Semi_F_GDCC/customer/GDCC/images/GDCC_main.png" width="150"></a></div>
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
                    	  <li><a href="/Semi_F_GDCC/customer/customerLoginForm.jsp">Login</a></li>
                          <li><a href="/Semi_F_GDCC/customer/insertCustomerForm.jsp">Join MemeberShip</a></li>
                    <%
                     	}else{
                  	%>
	                      <li><a href="/Semi_F_GDCC/customer/myPage.jsp">Mypage</a></li>
	                      <li><a href="/Semi_F_GDCC/customer/action/customerLogoutAction.jsp">LogOut</a></li>
                      
                  	<%
                        }
                  	%>
                          <li><a href="/Semi_F_GDCC/customer/GDCC/rooms.jsp">Rooms</a></li>
                          <li><a href="/Semi_F_GDCC/customer/GDCC/notice.jsp">Notice</a></li>
                          <li><a href="/Semi_F_GDCC/customer/GDCC/direction.jsp">Direction</a></li>
                          <li><a href="/Semi_F_GDCC/customer/GDCC/reservation.jsp">Reservation</a></li>
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
<br><br>
<!----------------------  템플릿 ------------------------>
<section class="section blog-post-entry bg-light" id="next">
 	<h1>MY QnA</h1>
	<div class="container">
	      
	       <table border="1">
	           <tr>
	               <th>NO.</th>
	               <th>이메일</th>
	               <th>제목</th>
	               <th>내용</th>
	               <th>작성일</th>
	               <th>수정일</th>
	               <th>&nbsp;</th>
	           </tr>
	           <%
	               for(HashMap m : list) {
	           %>
	               <tr>
	                   <td><%=(Integer)(m.get("qnaNo"))%></td>
	                   <td><%=(String)(m.get("cusMail"))%></td>
	                   <td><%=(String)(m.get("qnaTitle"))%></td>
	                   <td>
						   <%
						     String qnaContent = (String)(m.get("qnaContent"));
						     if (qnaContent != null && qnaContent.length() > 5) { // 내용길이가 5글자보다 크면
						         out.print(qnaContent.substring(0, 5) + "...");	  // 5글자까지 출력 + "..."
						     } else {
						         out.print(qnaContent);
						     }
						   %>
					   </td>
	                   <td><%=(String)(m.get("createDate"))%></td>
	                   <td><%=(String)(m.get("updateDate"))%></td>
	                   <td>
	                       <a class="update" href="/Semi_F_GDCC/customer/GDCC/updateQnAForm.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">수정</a>
	                       <br>
	                       <a class="delete" href="/Semi_F_GDCC/customer/GDCC/deleteQnAAction.jsp?qnaNo=<%=(Integer)(m.get("qnaNo"))%>">삭제</a>
	                   </td>
	               </tr>
	           <%
	               }
	           %>
	       </table>
	</div>
</section>
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