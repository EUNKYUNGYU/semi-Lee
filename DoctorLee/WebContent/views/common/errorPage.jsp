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
</head>
<body>

	<script type="text/javascript">
	
		$(function(){
			alert('<%= error %>');	
		})
		
		
	
	</script>
</body>
</html>