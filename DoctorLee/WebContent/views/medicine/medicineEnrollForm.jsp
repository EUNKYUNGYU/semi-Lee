<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약품 등록 페이지</title>
<style >
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
		<h2 align="center">약품 등록 페이지</h2>
		<form action="<%=contextPath%>/insert.med" method="post">
			
			추가할 약품 이름:  <input type="text" name="medName" id="medName" required>
						  <input type="button" value="중복확인" id="check_medicine">
						  
						  <br><br>
			추가할 약품 설명: <input type="text" name="preInfo" id="preInfo" placeholder="      33자 이내로 입력하세요.">
						 <span id="piCount">0</span> / 33
						<br><br>
			
			추가할 주의점  :<input type="text" name="cauction" id="cauction" placeholder="      66자 이내로 입력하세요.">
						<span id="caCount">0</span> / 66
						<br><br>
						
			<button type="submit" id="enrollMed">등록하기</button>
							
						 
						  
		
		</form>
	
	</div>
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
	
	
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>