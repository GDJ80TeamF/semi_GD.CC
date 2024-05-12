<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	// 이번 달에 따라 메뉴 값을 설정
	int rsvMenu = 1; // 기본값은 1
	java.time.LocalDate currentDate = java.time.LocalDate.now();
	int currentMonth = currentDate.getMonthValue();
	for(int i=1; i<=12; i++) {
		if (currentMonth == i) { // 이번달이 i월인 경우
		    rsvMenu = i; // 메뉴 값을 i로 설정
		}   
	}
	System.out.println(rsvMenu+"<-- rsvMenu insertRsvForm.jsp param");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<div class="container">
	<div class="row">
	<div class="col"></div>          
		<div class="mt-5 col-7 bg-white border shadow-sm p-3 mb-5 bg-body-tertiary rounded">
		<h1>조식 예약</h1>
		<form method="post" action="/Semi_F_GDCC/customer/hotelBf/action/customerLoginAction.jsp">
        	<div class="mb-3 mt-3">
				<label for="rsvNo" class="form-label">예약 번호:</label>
				<input type="number" class="form-control" placeholder="예약 번호" name="rsvNo" min="1">
			</div>   
            <div class="mb-3">
            <%
           		java.time.LocalDate lastDayOfThirdMonth = java.time.LocalDate.now().plusMonths(3).withDayOfMonth(java.time.LocalDate.now().plusMonths(3).lengthOfMonth());
            %>
            	<label for="rsvDate" class="form-label">예약 날짜:</label>
                <input type="date" class="form-control" name="rsvDate" 
                        min="<%= java.time.LocalDate.now() %>"max="<%= lastDayOfThirdMonth %>">
            </div>
            <div class="mb-3">
            	<label for="rsvTime" class="form-label">예약 시간:</label>
                <select class="form-control" name="rsvTime">
                	<option value="" selected="selected">:::선택:::</option>
                    <option value="7">7시</option>
                	<option value="8">8시</option>
               		<option value="9">9시</option>
                    <option value="10">10시</option>
                    <option value="11">11시</option>
				</select>
			</div>
            <div class="mb-3">
            	<label for="rsvMember" class="form-label">예약 인원:</label>
            	<input type="number" class="form-control" placeholder="인원 수" name="rsvMember" min="1">
            </div>                  
            	<input type="hidden" value="<%=rsvMenu%>" name="rsvMenu">

            	<button type="submit" class="btn btn-primary">예약</button>
		</form>
        </div>
	<div class="col"></div>
    </div>
</div>
</body>
</html>