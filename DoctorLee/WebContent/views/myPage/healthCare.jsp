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
		height : 1200px;
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
						<h3 align="center"><%=loginUser.getMemName() %>님의 건강상태</h3>
						<hr>
						<br>
						
						
						
				
				</div>
				<%} %>
			</div>
			<%@ include file="../common/footer.jsp" %>

		
	
	
</body>
		
</html>