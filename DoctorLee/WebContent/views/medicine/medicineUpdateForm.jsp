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
<title>Insert title here</title>
<style>
	.outer{
		margin-bottom : 150px;
		margin-left : 300px;
	}
	#updateName,#updatePreInfo,#updateCauction{
		width : 300px;
		
	}
	#updateName{
		height : 20px;
	}
	#updatePreInfo{
		height : 300px;
	}
	#updateCauction{
		height : 300px;
		margin-left : 20px;
	}
	.update-medicine{
		text-align : center;
	}
</style>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<div class="outer">
		<br>
		<h2 class="update-medicine">약품 수정 페이지</h2>
		<form id="medEnroll-form"action="<%=contextPath%>/update.med" method="post">
			<input type="hidden" name="mname" value="<%=med.getMedName() %>">
			수정할 약품 이름:  <input type="text" name="updateName" id="updateName" required placeholder="<%=med.getMedName() %>">
						  
						  
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
					$('#updatePreInfo').keyup(function(){
						 console.log($(this).val().length);
		             	$('#piCount').text($(this).val().length);
					})
				})
				$(function(){
					$('#updateCauction').keyup(function(){
						 console.log($(this).val().length);
		            	 $('#caCount').text($(this).val().length);
					})
				});
			</script>
							
						 
						  
		
		</form>
	
	</div>

</body>
</html>