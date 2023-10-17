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
<title>I예약 내역 홈페이지</title>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<h2 align="center"><%=loginUser.getMemName() %>님의 예약 내역 보기</h2><br><hr><br>
	<div id="outer">
		<table>
			
		</table>
	</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>