<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.medicine.model.vo.Medicine" %>
<%
	Medicine med = (Medicine)request.getAttribute("med");
%>
<style>
	#medName-area {
		border : 1px solid black;
		width : 500px;
		margin-left : 700px;
		height : 30px;
		
	}
	#info-area{
		border : 1px solid black;
		width : 500;
		margin-left : 700px;
		height : 60px;
	}
	#cauction-area {
		border : 1px solid black;
		width : 500;
		margin-left : 700px;
		height : 100px;
	}
	.back {
		margin-left : 700px;
		margin-bottom : 50px;
	}
	
	
</style>
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
		<div id = "medName-area" align="center">약품명 : <%= med.getMedName() %></div>

		<div id= "info-area" align="center">pre-info : <%=med.getPreInfo() %></div>

		<div id= "cauction-area" align="center">주의사항 : <%=med.getCauction() %></div>
	</div>

	
	<button type="button"  onclick="history.back();" class="back">뒤로가기</button>
	
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>