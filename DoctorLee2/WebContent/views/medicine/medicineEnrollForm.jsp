<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약품 등록 페이지</title>
<link rel="stylesheet" href="resources/css/medicine/medicine.css">

</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<div class="outer">
		<br>
		<h2 class="med-enrollForm">약품 등록 페이지</h2>
		<form id="medEnroll-form"action="<%=contextPath%>/insert.med" method="post">
			
			추가할 약품 이름:  <input type="text" name="medName" id="medName-enroll" required>
						  <button type="button"  id="check_medicine" onclick="medCheck();">중복확인</button>
						 <br><br>
			추가할 약품 설명: <input type="text" name="preInfo" id="preInfo-enroll" placeholder="      33자 이내로 입력하세요.">
						 <span id="piCount">0</span> / 33
						<br><br>
			추가할 주의점  :<input type="text" name="cauction" id="cauction-enroll" placeholder="      66자 이내로 입력하세요.">
						<span id="caCount">0</span> / 66
						<br><br>
						
			<button type="submit" id="enrollMed" disabled>등록하기</button>
							
						 
						  
		
		</form>
	
	</div>
	<script>
		$(function(){
			
			$('#preInfo-enroll').keyup(function(){
				 console.log($(this).val().length);
	             $('#piCount').text($(this).val().length);
			})
		})
		$(function(){
			$('#cauction-enroll').keyup(function(){
				 console.log($(this).val().length);
	             $('#caCount').text($(this).val().length);
			})
		});
		function medCheck(){
			const $medName = $('#medEnroll-form input[name=medName]');
			//console.log($medName.val());
			$.ajax({
				url : 'check.med',
				data : {checkMed : $medName.val()},
				success : function(result){
					if(result =='NNNNN'){
						
						alert('이미 존재하는 약품명입니다.');
						$medName.val('').focus();
					}
					else{
						if(confirm('등록가능합니다.등록하시겠습니까?')){
							$medName.attr('readonly',true);
							
							$('#medEnroll-form button[type=submit]').removeAttr('disabled');
						}else{
							$medName.focus();
						}
						}
					},
					error : function(){
						alert('오류남');
					}
				
			});
		}
		
		
	</script>
	
	
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>