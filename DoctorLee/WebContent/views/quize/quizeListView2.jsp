<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.DoctorLee.quize.model.vo.Quize,java.util.ArrayList"%>
    
<% 
	ArrayList<Quize> list = (ArrayList<Quize>)request.getAttribute("list");
	String alertMsgPoint = (String)session.getAttribute("alertMsg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈게시판</title>


<style>

* {
	border: 0.5px solid skyblue;
	box-sizing: border-box;
}

body{
	margin : 0;
}

header {
	width: 100vw;
	height: 120px;
}

main {
	width: 100%;
	height: auto; 
	min-height: 1000px;
	line-height: 30px;
}

main > section, main > aside, main > div{
	float: left;
}

aside {
	width: 15%;
	height: auto;
	float: left;
	margin : 20px auto;
	display: flex;
	justify-content: center;
	padding: 0;
}

section{
	width: 70%;
	height: auto; 
	min-height: 1000px;
	float: left;
	padding: 20px;
}

#contentTitle{
	width : 100%;
	height : 100px;
	padding: 20px;
	font-size : 30px;
	line-height : 200%;
}

#content{
	width : 100%;
	height : auto;
}

article{
	
	width: 95%;
	height: auto;
	margin : 20px;
	background-color: rgb(230, 230, 230);

}

#quizeHeader {
	width: 100%;
	height: 70px;
	text-align: center;
	line-height: 70px;
}

#quizeHeader>div {
	float: left;
}

#title {
	width: 70%;
	height: 100%;
	font-size: 30px;
}

#vote, #deadline {
	width: 15%;
	height: 100%;
}

#quizeContent {
	width: 100%;
	height: 300px;
	line-height: 30px;
}

#quizeFooter {
	width: 100%;
	height:70px;
}

#quizeFooter  >div {
	float: left;
	line-height: 70px;
}

#quizeFooter1 {
	width: 75%;
	height: 100%;
}

#quizeFooter2 {
	width: 25%;
	height: 100%;
	text-align: center;
}

#page, #search{
	width : 100%;
	height : 100px;
	padding: 20px;
}

footer {
	width: 100%;
	height: auto;
}

a {
	text-decoration: none;
	color: #1E376F;
}

button {
	background-color: #1E376F;s
	border-radius: 7px;
	color: white;
	width: 60px;
	height: 30px;
	margin-left: 10px;
}


</style>
</head>
<body>

	<header>
		<%@ include file ="../common/nav2.jsp" %>
	</header>
	
	
	<main>
	
		<aside>
			<%@ include file ="../common/cmNavi.jsp" %>
		</aside>
		
		<section>
			
			<div id="contentTitle">
				페이지 제목 영역
			</div>
			
			<div id="content">
				
				<article>
					<div id="quizeHeader">
						<div id="title">제목</div>
						<div id="vote">0명 투표 중</div>
						<div id="deadline">0일 남음</div>
					</div>
					<div id="quizeContent">
						내용
						<br>
						<form method="post" action="<%= contextPath %>/choice.qz" >
							<input type="radio" name="choice" value="1" id="choice1" checked> 
							<label for="choice1">1</label><br> 
										
							<input type="radio" name="choice" value="2" id="choice2"> 
							<label for="choice2">2</label><br> 
										
							<input type="radio" name="choice" value="3" id="choice3"> 
							<label for="choice3">3</label><br> 
										
							<input type="radio" name="choice" value="4" id="choice4"> 
							<label for="choice4">4</label><br> 
							</form>
						</div>
						<div id="quizeFooter">
							<div id="quizeFooter1">
								<button type="submit" id="quizeButton" class="btn btn-default">제출
							</div>
								
							<div id="quizeFooter2">
								<a href="#">정답 확인하기 &gt;</a>
							</div>
						</div>
						
		
				</article>
			</div>
			
			<div id="page">
				페이지바 영역
			</div>
		
			<div id="search">
				검색 영역
			</div>
		
		</section>
		
		<aside>
			오른쪽 사이드바 : 
			<br> 지금은 여백
			<br> 나중에 광고 넣을 수도 있음
		</aside>
		
	</main>
	
	
	<footer>
		푸터 영역
	</footer>


</body>
</html>