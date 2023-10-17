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
<title>퀴즈 정답 확인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js">
</script>

<style>

* {
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

.aside {
	height: auto;
	float: left;
	margin : 20px auto;
	display: flex;
	justify-content: center;
	padding: 0;
}

#aside1{width :25%}

#aside2{width :15%}

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
	font-weight: bold;
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
	border: 1px solid rgb(230, 230, 230); border-radius: 10px;
	padding: 20px;
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
	font-size : 20px;
	font-weight : bold;
}

#quizeFooter {
	width: 100%;
	height:auto;
	padding: 20px;
}

#quizeFooter  >div {
	line-height: 70px;
}

#back{
	width : 100%;
	height : 100px;
	padding: 20px;
}

footer {
	width: 100%;
	height: auto;
}




</style>
</head>
<body>

	<header id="header">
		<%@ include file ="../common/nav2.jsp" %>
	</header>
	
	
	<main>
	
		<aside class="aside" id="aside1">
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
			<div id="back" align="right">
				<a href="<%= contextPath %>/list.qz" id="backButton" class="btn btn-primary">돌아가기</a>
			</div>
		
		</section>
		
		<aside id="aside2" class="aside">
		</aside>
		
	</main>
	<br clear="both">
	
	<footer>
		<%@ include file ="../common/footer.jsp" %>
	</footer>


</body>
</html>