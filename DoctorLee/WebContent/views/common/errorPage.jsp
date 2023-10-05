<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String error = (String)request.getAttribute("error");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러창</title>
	<style>
		h1{
			color: red;
			margin-top: 100px;
			text-align: center;
			font-size: 33px;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<h1><%= error %></h1>

	<script type="text/javascript">
	
		$(function(){
			alert('<%= error %>');	
		})
		
		
	
	</script>
</body>
</html>