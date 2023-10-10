<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.member.model.vo.Member" %>
<%
Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 첫 페이지 </title>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<br><br>
	<form action="<%= contextPath %>/list.di" id="login-form" method="post">
    		 	
    		 	<button name="memNo" value=<%=loginUser.getMemNo()%>>다이어리 보러가기</button>
    	
   	</form>

</body>
</html>