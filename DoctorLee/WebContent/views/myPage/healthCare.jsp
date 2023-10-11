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
<title>건강관리 </title>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	
	<h2 align="center">건강 관리 </h2>
	<br>
	<hr>
	<br><br><br>
	<% if(loginUser == null) {%>
		<form action="<%=contextPath %>/login.me" method="post">
			<button type="submit">로그인하러가기</button>
		</form>
	<% } else { %>
		<div id="wraper">
			<div id="healthCare">
				<div id="area">
					<%@ include file="../common/myPageNavi.jsp" %>

				</div>
				<div id="healthCare_main"></div>

			</div>

		</div>
	
	<%} %>

		
</body>
</html>