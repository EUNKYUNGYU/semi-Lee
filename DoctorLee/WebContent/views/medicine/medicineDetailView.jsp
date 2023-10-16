<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.medicine.model.vo.Medicine" %>
<%
	Medicine med = (Medicine)request.getAttribute("med");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약품 상세보기</title>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">약품 상세보기</h2>
		
		<br><br>
		<div id = "medName-area"><%= med.getMedName() %></div>

		<div id= "info-area"><%=med.getPreInfo() %></div>

		<div id= "cauction-area"><%=med.getCauction() %></div>
	</div>

	<br><br><br>
	<button type="button"  onclick="history.back();">뒤로가기</button>
	
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>