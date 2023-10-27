<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.member.model.vo.Member" %>
<!DOCTYPE html>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<html>

<head>
<meta charset="UTF-8">
<title>첫페이지</title>
<style>
	#bookmark-btn{
		margin-top :100px;
	}
</style>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<br><br>
	<form action="<%= contextPath %>/main.bm" id="login-form" method="post">
    		 	<!-- list controller로 memNo 넘겨주기  -->
    		 	<button name="memNo" value=<%=loginUser.getMemNo()%> id="bookmark-btn">즐겨찾기 보러가기</button>
    	
   	</form>
   	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>