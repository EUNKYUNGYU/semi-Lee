<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.DoctorLee.quize.model.vo.Quize, java.util.ArrayList, com.kh.DoctorLee.quize.model.vo.QuizeAnswer"%>
    
<% 
	ArrayList<Quize> list = (ArrayList<Quize>)request.getAttribute("list");
	QuizeAnswer answer = (QuizeAnswer)request.getAttribute("answer");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js">
</script>

<style>

* {
	border: 0.5px solid skyblue;
	box-sizing: border-box;
}

body{
	margin : 0;
}

#header {
	width: 100vw;
	height: 120px;
}

main {
	width: 100%;
	height: auto; 
	line-height: 30px;
}

main > section, main > aside, main > div{
	float: left;
}

#aside {
	width: 20%;
	height: auto;
	float: left;
	margin : 20px auto;
	display: flex;
	justify-content: center;
	padding: 0;
}

#section{
	width: 60%;
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
	margin : 20px auto;
	background-color: rgb(230, 230, 230);
}

#quizeHeader {
	width: 100%;
	height: 70px;
	padding: 20px;
	font-size : 30px;
	font-weight : 600;
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
	height: 80px;
	line-height: 30px;
	padding: 20px;
	color : darkblue;
	font-size : 25px;
	font-weight : bold;
}

#quizeFooter {
	width: 100%;
	height:auto;
	padding: 20px;
}

#quizeFooter  >div {
	float: left;
	line-height: 70px;
}

#quizeFooter1 {
	width: 75%;
	height: 100%;
	padding: 20px;
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

form{
	padding: 20px 0px;
}

a {
	text-decoration: none;
	color: #1E376F;
}

button {
	background-color: #1E376F;
	border-radius: 7px;
	color: white;
	width: 60px;
	height: 30px;
	margin-left: 10px;
}

</style>
</head>
<body>

	<header id="header">
		<%@ include file ="../common/nav2.jsp" %>
	</header>
	
	
	<main>
	
		<aside id="aside">
			<%@ include file ="../common/cmNavi.jsp" %>
		</aside>
		
		<section id="section">
			
			<div id="contentTitle">
				퀴즈 게시판
			</div>
			<div id="content">
				<article>
					<div id="quizeHeader">
						<div id="title"><%= answer.getQuizeTitle() %></div>		
					</div>
					<div id="quizeContent">	
						정답 : <%= answer.getAnswer() %>번 <br>
					</div>
					<div id="quizeFooter">
						<%= answer.getAnswerDetail() %>
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
		
		<aside id="aside">
			오른쪽 사이드바 : 
			<br> 지금은 여백
			<br> 나중에 광고 넣을 수도 있음
		</aside>
		
	</main>
	<br clear="both">
	
	<footer>
		<%@ include file ="../common/footer.jsp" %>
	</footer>


</body>
</html>