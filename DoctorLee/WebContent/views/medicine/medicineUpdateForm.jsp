<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		margin-bottom : 150px;
		margin-left : 300px;
	}
	#medName,#preInfo,#cauction{
		width : 300px;
		
	}
	#medName{
		height : 20px;
	}
	#preInfo{
		height : 300px;
	}
	#cauction{
		height : 300px;
		margin-left : 20px;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">약품 수정 페이지</h2>
		<form id="medEnroll-form"action="<%=contextPath%>/update.med" method="post">
			
			수정할 약품 이름:  <input type="text" name="updateName" id="updateName" required>
						  
						  
						  <br><br>
			수정할 약품 설명: <input type="text" name="updatePreInfo" id="updatePreInfo" placeholder="      33자 이내로 입력하세요.">
						 <span id="piCount">0</span> / 33
						<br><br>
			
			수정할 주의점  :<input type="text" name="updateCauction" id="updateCauction" placeholder="      66자 이내로 입력하세요.">
						<span id="caCount">0</span> / 66
						<br><br>
						
			<button type="submit" id="updateMed">수정하기 </button>
			
			<script>
				$(function(){
					$('#preInfo').keyup(function(){
						 console.log($(this).val().length);
		             	$('#piCount').text($(this).val().length);
					})
				})
				$(function(){
					$('#cauction').keyup(function(){
						 console.log($(this).val().length);
		            	 $('#caCount').text($(this).val().length);
					})
				});
			</script>
							
						 
						  
		
		</form>
	
	</div>

</body>
</html>