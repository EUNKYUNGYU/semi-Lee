<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강관리 </title>
<style>
	div{
		box-sizing : border-box;
	}
	#healthCare{
		width : 1000px;
		height : 900px;
		margin : auto;
	}
	#diary{
		width : 100%;
	}
	#healthCare_main{
		width : 80%;
		height : 100%;
		float: left;
	}
	#healthCare > div {
		height : 100%;
	}
	#heathCare_main > div{
		height : 100%;
		float : left;
	}
	#area{
		width : 20%;
		float : left;
	}
	#memInfo{
		width : 60%;
		margin : auto;
	}
	#memInfo td, #memInfo th{
		border : 1px solid black;
		padding : 8px;
		text-align : center;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<%
		int heavy = 90; // 로그인한 유저의 키 - 몸무게가 90 이하일 경우에는 비만
		int thin = 110; // 로그인한 유저의 키 - 몸무게가 110 이상일 경우에는 마름
		//로그인한 유저의 키 - 몸무게가 110 이하 90 이상일 경우에는 표준 
		int standard = loginUser.getHeight()-loginUser.getWeight();// 로그인한 유저의 키 빼기 몸무게의 변수
		//System.out.println(standard);
	%>
	<h2 align="center"><%=loginUser.getMemName() %>님의 건강 관리 페이지 </h2>
	<br>
	<hr>
	<br><br><br>
	<% if(loginUser == null) {%>
		<form action="<%=contextPath %>/login.me" method="post">
			<button type="submit">로그인하러가기</button>
		</form>
	<% } else { %>
		
			<div id="healthCare">
				<div id="area">
					<%@ include file="../common/myPageNavi.jsp" %>

				</div>
				<div id="healthCare_main">
					<h3 align="center"><%=loginUser.getMemName()%>님의 정보입니다. </h3>
					<br>
					<hr>
					<br>
					<br>
						<table id="memInfo">
							<thead>
								<tr>
									<td>성함</td>
									<td>키</td>
									<td>몸무게</td>
								</tr>						
							</thead>
							<tbody>
								<tr>
									<td><%=loginUser.getMemName() %></td>
									<td><%=loginUser.getHeight() %></td>
									<td><%=loginUser.getWeight() %></td>
								</tr>
							</tbody>
						</table>
						<br><br><hr><br>
						<h3 align="center"><%=loginUser.getMemName() %>님의 건강상태</h3> <br>
						<h5 align="center" id="healthCareInfo">정보</h5>
						
						<hr>
						<br>
						<% if(standard < heavy){ %>
							<script>
								$(function(){
									//document.getElementById('healthCareInfo').innerHTML = '과체중입니다.';
									$('#healthCareInfo').html('과체중입니다.');
								})
							</script>
						
						<% }else{ %>
						
							<% if(standard > thin) { %>
								<script>
									$(function(){
										//document.getElementById('healthCareInfo').innerHTML = '저체중입니다.';
										$('#healthCareInfo').html('저체중입니다.');
									})
									
								</script>
								
							
							<%} else{ %>
								<script>
									$(function(){
										//document.getElementById('healthCareInfo').innerHTML = '정상체중입니다';
										$('#healthCareInfo').html('정상체중입니다.');
									})
								</script>
							
							<%} %>
						<%} %>
						<h3 align="center"><%=loginUser.getMemName() %>님을 위한 운동 추천!</h3>
						<p id="recommendHealth" align="center">추천 운동</p>
						<% if(standard < heavy){ %>
							<script>
								$(function(){
									//document.getElementById('healthCareInfo').innerHTML = '과체중입니다.';
									$('recommendHealth').html('유산소 운동(줄넘기,산책,뜀걸음...등등)');
								})
							</script>
						
						<% }else{ %>
						
							<% if(standard > thin) { %>
								<script>
									$(function(){
										//document.getElementById('healthCareInfo').innerHTML = '저체중입니다.';
										$('recommendHealth').html('근력 운동(턱걸이,벤치/레그 프레스..등등) 위주로 해주시면됩니다.');
									})
									
								</script>
								
							
							<%} else{ %>
								<script>
									$(function(){
										//document.getElementById('healthCareInfo').innerHTML = '정상체중입니다';
										$('#recommendHealth').html('유산소 운동과 근력운동을 밸런스 있게 해주세요!');
									})
								</script>
							
							<%} %>
						<%} %>
						<br><hr><br>
						<h3 align="center"><%=loginUser.getMemName()%>님을 위한 추천 음식</h3>
						<h5 align="center" id="recommendFood">추천 음식 </h5>
							
						<br>
						<% if(standard < heavy){ %>
							<script>
								$(function(){
									//document.getElementById('healthCareInfo').innerHTML = '과체중입니다.';
									$('#recommendFood').html('탄수화물은 되도록 적게 드시며 고 단백질 음식을 섭취하세용~');
								})
							</script>
						
						<% }else{ %>
						
							<% if(standard > thin) { %>
								<script>
									$(function(){
										//document.getElementById('healthCareInfo').innerHTML = '저체중입니다.';
										$('#recommendFood').html('최대한 세 끼를 잘 챙겨 드시면서 고 탄수화물 고 지방 음식을 드세요~');
									})
									
								</script>
								
							
							<%} else{ %>
								<script>
									$(function(){
										//document.getElementById('healthCareInfo').innerHTML = '정상체중입니다';
										$('#recommendFood').html('모든 음식을 균형 있게 드시면서 지금 드시는 양을 유지하시는게 중요합니다~');
									})
								</script>
							
							<%} %>
						<%} %>
						
						
						
						
						
						
				
				</div>
				<%} %>
			</div>
			<%@ include file="../common/footer.jsp" %>

		
	
	
</body>
		
</html>