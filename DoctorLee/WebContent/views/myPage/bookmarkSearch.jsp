<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList,com.kh.DoctorLee.hospital.model.vo.Hospital"%>
<%
 	ArrayList<Hospital> hosList = (ArrayList<Hospital>)request.getAttribute("hosList");
 %>
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
	#text-area{
		height : 300px;
		border : 1px solid black;
		width : 700px;
		margin-left : 610px;
	}
 </style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 후 화면</title>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<% System.out.println(hosList); %>
	
	<h2 align="center">병원 즐겨찾기 페이지 </h2> <br><hr>
		
		<div id="search-form">	
			<br>
			
			<h3>검색하실 병원 이름을 입력해주세요</h3> <br>	
			<input type="text" name="hosName" id="hosName">
			<button type="submit" id="search">검색</button><br><br>
			<div id="text-area">검색된 목록</div>
		</div>
		<script>
		<% if(hosList == null){ %>
			$(function(){
				$('#text-area').html('검색된 목록이 없습니다.');
			})
		<%}else {%>
			<% for(Hospital hos : hosList) { %>
				$('#text-area').html(<%=hos.getHosName()%>)
			<%}%>
		
		
		<%}%>
		</script>
</body>
</html>