<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
	// 세션에서 고객 mail가져오기
	HashMap<String,Object> login = (HashMap<String,Object>)(session.getAttribute("loginCustomer"));
%>
<%
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<-- reviewNo updateGolfReviewForm.jsp param");
	
	// reviewNo에 따라GolfReview 출력하는 메서드
	HashMap<String, Object> m = ReviewDAO.selectGolfReviewOne(rsvNo);
	System.out.println(m + "<-- m updateGolfReviewForm.jsp param");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
	@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
    .rate { display: inline-block;border: 0;margin-right: 15px;}
	.rate > input {display: none;}
	.rate > label {float: right;color: #ddd}
	.rate > label:before {display: inline-block;font-size: 1rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
	.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
	.rate input:checked ~ label, 
	.rate label:hover,.rate label:hover ~ label { color: #f73c32 !important;  } 
	.rate input:checked + .rate label:hover,
	.rate input input:checked ~ label:hover,
	.rate input:checked ~ .rate label:hover ~ label,  
	.rate label:hover ~ input:checked ~ label { color: #f73c32 !important;  } 
</style>
<body>
<div>
<h1>골프리뷰 수정</h1>
<form method="post" action="/Semi_F_GDCC/customer/action/updateGolfReviewAction.jsp">
	<table>
		<tr>
			<th>rsvNo :</th>
			<td><input type="text" value="<%=rsvNo%>" name="rsvNo"></td>
		</tr>
		<tr>
			<td>평점</td>
			<!-- 별점 매기기 참고 -> https://eunyoe.tistory.com/235 -->
			<td>
			<fieldset class="rate">
            	<input type="radio" id="rating10" name="reviewScore" value="10"><label for="rating10" title="5점"></label>
            	<input type="radio" id="rating9" name="reviewScore" value="9"><label class="half" for="rating9" title="4.5점"></label>
           		<input type="radio" id="rating8" name="reviewScore" value="8"><label for="rating8" title="4점"></label>
            	<input type="radio" id="rating7" name="reviewScore" value="7"><label class="half" for="rating7" title="3.5점"></label>
                <input type="radio" id="rating6" name="reviewScore" value="6"><label for="rating6" title="3점"></label>
                <input type="radio" id="rating5" name="reviewScore" value="5"><label class="half" for="rating5" title="2.5점"></label>
                <input type="radio" id="rating4" name="reviewScore" value="4"><label for="rating4" title="2점"></label>
                <input type="radio" id="rating3" name="reviewScore" value="3"><label class="half" for="rating3" title="1.5점"></label>
                <input type="radio" id="rating2" name="reviewScore" value="2"><label for="rating2" title="1점"></label>
                <input type="radio" id="rating1" name="reviewScore" value="1"><label class="half" for="rating1" title="0.5점"></label>
            </fieldset>
            </td>
		</tr>
		<tr>
			<th>제목 :</th>
			<td><input type="text" value="<%=(String)(m.get("reviewTitle"))%>" name="reviewTitle"></td>
		</tr>
		<tr>
			<th>내용 :</th>
			<td><textarea  style="width: 550px; height: 300px;"
						 name="reviewContent"><%=(String)(m.get("reviewContent"))%></textarea></td>
		</tr>

		<tr>
			<td><button type="submit">수정</button></td>
		</tr>
	</table>
		
</form>		
</div>
</body>
</html>