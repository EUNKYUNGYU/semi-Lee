<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕 나는 즐겨찾기 추가 페이지야</title>

<link rel="stylesheet" href="resources/css/myPage/bookmark.css">

</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<% //System.out.println(hosList); %>
	
	<h2 class="bookmark-main">병원 즐겨찾기 페이지 </h2> <br><hr>
		<form action="<%=contextPath %>/selectHos.mk" id="insert-form" method="post">
		<div id="search-form">	
			<br>
			
			<h3>검색하실 병원 이름을 입력해주세요</h3> <br>	
			<input type="text" name="hosName" id="hosName">
			<button type="submit" id="search">검색</button><br><br>
			<div id="text-area">
				
				
			</div>
		</div>
				
			</form>
			
			
			
		
		
	
	
	
	
	<%@ include file="../common/footer.jsp" %>
	

</body>
</html>