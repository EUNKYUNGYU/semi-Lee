<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.member.model.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강관리 </title>
<link rel="stylesheet" href="resources/css/myPage/healthCare.css">
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<c:set var="heavy" value="90"/>
	<c:set var="thin" value="110"/>
	<c:set var="standard" value="${sessionScope.loginUser.height-sessionScope.loginUser.weight }"/>
	
	<h2 class="healthCareMain">${sessionScope.loginUser.memName}님의 건강 관리 페이지 </h2>
	<br>
	<hr>
	<br><br><br>
	
	
		
			<div id="healthCare">
				<div id="area">
					<%@ include file="../common/myPageNavi.jsp" %>

				</div>
				<div id="healthCare_main">
					<h3 align="center">${sessionScope.loginUser.memName }님의 정보입니다. </h3>
					<br>
					<hr>
					<br>
					<br>
						<table id="memInfo">
							<thead>
								<tr>
									<th>성함</th>
									<th>키</th>
									<th>몸무게</th>
								</tr>						
							</thead>
							<tbody>
								<tr>
									<td>${sessionScope.loginUser.memName }</td>
									<td>${sessionScope.loginUser.height }</td>
									<td>${sessionScope.loginUser.weight }</td>
								</tr>
							</tbody>
						</table>
						<br><br><hr><br>
						<h3 align="center">${sessionScope.loginUser.memName }님의 건강상태</h3> <br>
						<h5 align="center" id="healthCareInfo">정보</h5>
						
						<hr>
						<br>
						<c:choose>
							<c:when test="${standard < heavy }">
							<script>
								$(function(){
									//document.getElementById('healthCareInfo').innerHTML = '과체중입니다.';
									$('#healthCareInfo').html('과체중입니다.');
								})
							</script>
							</c:when>
						
						
							<c:when test="${standard > thin }">
								<script>
									$(function(){
										//document.getElementById('healthCareInfo').innerHTML = '저체중입니다.';
										$('#healthCareInfo').html('저체중입니다.');
									})
									
								</script>
							</c:when>
							
							<c:otherwise>
								<script>
									$(function(){
										//document.getElementById('healthCareInfo').innerHTML = '정상체중입니다';
										$('#healthCareInfo').html('정상체중입니다.');
									})
								</script>
							</c:otherwise>
						
						</c:choose>
						<h3 align="center">${sessionScope.loginUser.memName }님을 위한 운동 추천!</h3>
						<p id="recommendHealth" align="center">추천 운동</p>
						<c:choose>
							<c:when test="${standard < heavy }">
							<script>
								$(function(){
									//document.getElementById('healthCareInfo').innerHTML = '과체중입니다.';
									$('#recommendHealth').html('유산소 운동(줄넘기,산책,뜀걸음...등등)');
								})
							</script>
							</c:when>
						
						
						
							<c:when test="${standard > thin }">
								<script>
									$(function(){
										//document.getElementById('healthCareInfo').innerHTML = '저체중입니다.';
										$('#recommendHealth').html('근력 운동(턱걸이,벤치/레그 프레스..등등) 위주로 해주시면됩니다.');
									})
									
								</script>
							</c:when>
							
							<c:otherwise>
								<script>
									$(function(){
										//document.getElementById('healthCareInfo').innerHTML = '정상체중입니다';
										$('#recommendHealth').html('유산소 운동과 근력운동을 밸런스 있게 해주세요!');
									})
								</script>
							
							</c:otherwise>
						</c:choose>
						<br><hr><br>
						<h3 align="center">${sessionScope.loginUser.memName }님을 위한 추천 음식</h3>
						<h5 align="center" id="recommendFood">추천 음식 </h5>
							
						<br>
						<c:choose>
						<c:when test="${standard < heavy }">
							<script>
								$(function(){
									//document.getElementById('healthCareInfo').innerHTML = '과체중입니다.';
									$('#recommendFood').html('탄수화물은 되도록 적게 드시며 고 단백질 음식을 섭취하세용~');
								})
							</script>
						</c:when>
						
						<c:when test="${standard > thin }">
							
								<script>
									$(function(){
										//document.getElementById('healthCareInfo').innerHTML = '저체중입니다.';
										$('#recommendFood').html('최대한 세 끼를 잘 챙겨 드시면서 고 탄수화물 고 지방 음식을 드세요~');
									})
									
								</script>
						</c:when>
							
						<c:otherwise>
								<script>
									$(function(){
										//document.getElementById('healthCareInfo').innerHTML = '정상체중입니다';
										$('#recommendFood').html('모든 음식을 균형 있게 드시면서 지금 드시는 양을 유지하시는게 중요합니다~');
									})
								</script>
							
						</c:otherwise>
						
						
						
						</c:choose>
						
						
				
				</div>
				
			</div>
			<%@ include file="../common/footer.jsp" %>

		
	
	
</body>
		
</html>