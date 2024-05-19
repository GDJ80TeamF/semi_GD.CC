<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 메인페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}

	
	HashMap<String,Object> loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
	String adminName = (String) loginAdmin.get("adminName");
	String adminMail = (String) loginAdmin.get("adminMail");
	
	//프로필  부르기 
	HashMap<String,Object> m = AdminDAO.selectMyPage(adminMail);
	
	
%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300&display=swap" rel="stylesheet">

<link rel="stylesheet" href="./style.css">
<header>

        <div class="header">
           
            <div class="user-info"> 
            <img src="/Semi_F_GDCC/admin/upload/<%=(String) m.get("adminProfile") %>" alt="User Icon">
                <span> &nbsp;<%=adminName%>님 안녕하세요 :) &nbsp;</span>
                
            	<a href="/Semi_F_GDCC/admin/action/adminLogoutAction.jsp" type="button" class="btn btn-success"> 로그아웃</a>
            
            </div>
        </div>
</header>

</body>
</html>