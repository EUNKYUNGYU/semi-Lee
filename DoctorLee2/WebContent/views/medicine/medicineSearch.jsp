<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약품 검색</title>
<link rel="stylesheet" href="resources/css/medicine/medicine.css">
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	
	<h2 align="center">약품 검색 페이지</h2> <br><hr>
		
		<div id="search-form">	
			<br>
			<form action="<%=contextPath%>/select.med" id="search-form" method="post">
			<h3>검색하실 약품 이름을 입력해주세요</h3> <br>	
			<input type="text" name="medName" id="medName" >
			<button type="submit" id="search">검색</button><br><br>
			<div id="text-area"></div>
			</form>
		</div>
		<script>
			
		</script>
		
		<%@ include file="../common/footer.jsp" %>

</body>
</html>