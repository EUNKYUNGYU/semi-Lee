<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.member.model.vo.Member,com.kh.DoctorLee.hospital.model.vo.Hospital" %>
    
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Hospital hos = (Hospital)request.getAttribute("hos");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 즐겨찾기</title>
<style>
	div{
		box-sizing : border-box;
	}
	#bookmark{
		width : 1000px;
		height : 900px;
		margin : auto;
	}
	#bookmark_main{
		width : 80%;
		height : 100%;
		float : left;
	}
	#bookmark > div{
		height : 100%;
	}
	#bookmark_main > div{
		height : 100%;
		float : left;
	}
	#area{
		width : 20%;
		float : left;
	}
	#bk-info{
		width : 60%;
		margin : auto;
	}
	#bk-info td, #bk-info th{
		
		padding : 8px;
		text-align : center;
	}
	#bk-info th {
		font-size : 23px;
		color : skyblue;
	}
	#insertBk > img{
		margin-top : 50px;
		margin-left : 250px;
	}
	#insertBk > a {
		margin-left : 350px;
		
	}
	
	
	
	
</style>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<% if(loginUser == null) {%>
		<form action="<%=contextPath %>/login.me" method="post">
			<button type="submit">로그인하러가기</button>
		</form>
	<% } else { %>
		<div id="bookmark">
			<div id="area">
				<%@ include file="../common/myPageNavi.jsp" %>
			</div>
			
			<div id="bookmark_main">
				<h3 align="center"><%=loginUser.getMemName() %>님의 즐겨찾기</h3>
				<br><hr><br><br>
				<table id="bk-info">
					<% if(hos == null){ %>
					<thead>
						<tr>
							<th>병원이름</th>
						</tr>
						
					</thead>
					<tbody>
						
							<tr>
							<th>즐겨찾기 목록이 없습니다</th>
							</tr>
						
					</tbody>
					<%} else{ %>
					<thead>
						<tr>
							<th>병원이름</th>
						</tr>
						
					</thead>
					<tbody>
						
						<% for(int i = 1; i <= 1 ; i++){ %>
						<tr>
							<td><%= hos.getHosName() %></td>
						</tr>
					</tbody>
				</table>
					<%} %>
				<%} %>
				<hr>
				<div id="insertBk">
					<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_A32B41EB090AC3DCA70DEA8131E49CDB.jpg&type=l340_165" alt="즐겨찾기 이미지" ><br>
					<a href="<%=contextPath%>/enrollForm.bk">즐겨찾기 추가</a>
					<a href="#">즐겨찾기 삭제</a>
					
				</div>
					
				
			</div>
		</div>
		
	
	<% } %>
	<%@ include file="../common/footer.jsp" %>
	

</body>
</html>