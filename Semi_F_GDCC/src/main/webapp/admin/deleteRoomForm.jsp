<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 아이디 비밀번호 체크
	String checkId = request.getParameter("checkId");
	
	// checkId가 널값일 떄
	if(checkId == null){
		checkId = "";
	}
	String ck = request.getParameter("ck");
	System.out.println("ck: " + ck);
	
	if(ck == null){
		ck = "";
	}
	String msg = null;
	if(ck.equals("T")){
		msg = "삭제 할수 있는 비밀번호 입니다.";
	}else if(ck.equals("F")){
		msg = "삭제 할 수 없는 비밀번호 입니다. 비밀번호를 다시 확인해주세요.";
	}
	
	System.out.println("checkId: " + checkId);
	
	int roomNo = Integer.parseInt("roomNo");
	System.out.println("roonNo: " + roomNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>룸 삭제</title>
</head>
<body>
	<form method="post" action="/Semi_F_GDCC/admin/deleteCkRoomAction.jsp">
		<div>
			룸 정보를 정말 삭제하시겠습니까?
			삭제하실려면 아이디와 비밀번호를 입력해주세요.
			아이디와 비밀번호 입력후 비교하기 버튼을 눌러주세요.
		</div>
		<input type="text" name="checkId">
		<input type="password" name="checkPw">
		<button type="submit">비교하기</button>
		<input type="text" name="roomNo" style="display:none;">
	</form>
	<%
		if(ck.equals("T")){
	%>
		<form method="post" action="/Semi_F_GDCC/admin/deleteRoomAction.jsp">
			<button type="submit">삭제하기</button>
		</form>
	<%
		}
	%>
</body>
</html>