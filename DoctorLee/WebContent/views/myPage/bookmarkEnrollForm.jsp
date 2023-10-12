<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕 나는 즐겨찾기 추가 페이지야</title>

<style>
	h3 {
		text-align : center;
	}
	#hosName{
		margin-left : 610px;
		width : 700px;
		height : 30px;
		border-radius : 5px;
		padding : 0;
		
		
		
	}
	#search{
		height : 35px;
		
		
		
		
	}
	
</style>

</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<h2 align="center">병원 즐겨찾기 페이지 </h2> <br><hr>
	<form id="bkEnroll-form" action="<%= contextPath %>/select.bk" method="post">
		<div id="search-form">	
			<br>
			<h3>검색하실 병원 이름을 입력해주세요</h3> <br>	
			<input type="text" name="hosName" id="hosName">
			<button type="submit" id="search">검색</button>
		</div>
		
	</form>
	
	
	
	<%@ include file="../common/footer.jsp" %>
	

</body>
</html>