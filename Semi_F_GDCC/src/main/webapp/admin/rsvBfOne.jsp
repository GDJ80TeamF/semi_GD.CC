<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*"%>
<%
	//로그인 인증분기
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>
<%
	//예약번호 가져오기
	int rsvBfNo = Integer.parseInt(request.getParameter("rsvBfNo"));
		System.out.println(rsvBfNo + "<===rsvBfOne.rsvBfNo");
		
	//예약 상세보기 출력
	HashMap<String,Object> rsvOne = RsvBfDAO.rsvBfOne(rsvBfNo);
		System.out.println(rsvOne + "<==rsvBfOne.rsvOne");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{
	text-align:center;
}
/* 테이블 전체 스타일 */
table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  background-color: #ffffff;
  margin-bottom: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  text-align:center;
}


/* 테이블 셀 스타일 */
td {
  padding: 15px;
  text-align: left;
  border-bottom: 1px solid #f2f2f2;
}

/* 짝수 행 배경색 지정 */
tr:nth-child(even) {
  background-color: #f2f2f2;
}

/* 링크 스타일 */
a {
  color: #007bff;
  text-decoration: none;
}

a:hover {
  color: #0056b3;
  text-decoration: underline;
}

div button {
  display: inline-block; /* 블록 요소에서 인라인-블록 요소로 변경 */
  vertical-align: middle; /* 버튼을 select 요소와 수직 정렬 */
  margin-left: 5px; /* select 요소와 버튼 사이의 간격 조정 */
  padding: 10px 20px;
  text-align: center;
  border: none;
  background-color: #007bff;
  color: white;
  border-radius: 5px;
  margin-bottom:10px;
}

div button:hover {
  background-color: #0056b3;
}


/* 입력 필드 스타일 */
input[type=text] {
  width: 40%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
</style>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<div>
		<h1>조식예약 상세보기</h1>
			<a href = "/Semi_F_GDCC/admin/rsvHotelList.jsp?table=rsv_bf">
				리스트로 돌아가기
			</a>
				<table>
					<tr>
						<th>
							예약NO
						</th>
						<td>
							<%=rsvOne.get("rsvBfNo") %>
						</td>
					</tr>
					<tr>
						<th>
							예약자MAIL
						</th>
						<td>
							<%=rsvOne.get("rsvMail") %>
						</td>
					</tr>
					<tr>
						<th>
							ROOMNO
						</th>
						<td>
							<%=rsvOne.get("roomNo") %>
						</td>
					</tr>
					<tr>
						<th>
							날짜
						</th>
						<td>
							<%=rsvOne.get("rsvDate") %>
						</td>
					</tr>
					<tr>
						<th>
							시간
						</th>
						<td>
							<%=rsvOne.get("rsvTime") %>
						</td>
					</tr>
					<tr>
						<th>
							인원
						</th>
						<td>
							<%=rsvOne.get("rsvMember") %>분
						</td>
					</tr>
					<tr>
						<th>
							메뉴
						</th>
						<td>
							<%
							int menu = (int) rsvOne.get("rsvMenu");
								switch(menu){
									case 1 : 
										out.print("우동");
										break;
									
									case 2 :
										out.print("연어");
										break;
										
									case 3 :
										out.print("딸기");
										break;
									
									case 4 :
										out.print("양갈비");
										break;
									
									case 5 :
										out.print("양다리");
										break;
										
									case 6 :
										out.print("수박");
										break;
										
									case 7 :
										out.print("안심");
										break;
										
									case 8 :
										out.print("등심");
										break;
										
									case 9 :
										out.print("등갈비");
										break;
										
									case 10 :
										out.print("대하");
										break;
										
									case 11:
										out.print("샤인머스켓");
										break;
										
									case 12:
										out.print("칠면조");
										break;
										
								}
							%>
						</td>
					</tr>
				</table>
	</div>
	</div>
</body>
</html>