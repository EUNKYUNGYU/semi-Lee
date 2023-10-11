<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.message.model.vo.Message,java.util.ArrayList"%>
    
<% 
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 상세보기</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

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
	min-height: 1000px;
	line-height: 30px;
}

main > section, main > aside, main > div{
	float: left;
}

#aside {
	width: 15%;
	height: auto;
	margin : 20px auto;
	display: flex;
	justify-content: center;
	padding: 0;
}

#section{
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
}

#typeWrap{
	height: 50px;
	padding: 7px;
}

#buttonWrap{height: 50px;}

#buttonWrap > div{float: left;}

#buttonWrap1{width: 10%;}

#buttonWrap2{width: 30%;}

#MessageTitleWrap{height: 50px;}

#MessageTitleWrap > div{float: left;}

#MessageTitle1{width: 10%; font-weight: bold;}

#MessageTitle2{width: 30%;}

#senderWrap{height: 50px;}

#senderWrap > div{float: left;}

#senderWrap1{width: 10%; font-weight: bold;}

#senderWrap2{width: 30%;}

#sendDateWrap{height: 50px;}

#sendDateWrap > div{float: left;}

#sendDateWrap1{width: 10%; font-weight: bold;}

#sendDateWrap2{width: 30%;}

#messageContentWrap{height: auto; min-height: 400px;}

#page, #search{
	width : 100%;
	height : 100px;
	padding: 20px;
}

footer {
	width: 100%;
	height: auto;
}

.messageList {
	text-decoration: none;
	color: black;
	
}

table{
	background-color: rgb(232, 238, 253);
	border-radius: 7px;
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
				&lt;&nbsp;&nbsp;쪽지함
			</div>
			
			<div id="content">
				<article>
					
					<div id="buttonWrap">
						<div id="buttonWrap1">
							<button type="button" class="btn btn-light">삭제
						</div>
						<div id="buttonWrap2">
							<button type="button" class="btn btn-primary">보내기
						</div>
					</div>
					<div id="MessageTitleWrap">
						<div id="MessageTitle1">
							쪽지 제목
						</div>
						<div id="MessageTitle2">
							제목입니다~~
						</div>
					</div>
					<div id="senderWrap">
						<div id="senderWrap1">
							보낸 사람 
						</div>
						<div id="senderWrap2">
							동이 
						</div>
					</div>
					<div id="sendDateWrap">
						<div id="sendDateWrap1">
							받은 시간
						</div>
						<div id="sendDateWrap2">
							2023-08-25 [14:23] 
						</div>
					</div>
					<hr>
					<div id="messageContentWrap">
						<p> 읽은 쪽지!

							어쩌구 저쩌구
							동이가 쪽지를 보냈어요~~~
							받은 쪽지 상세보기 화면입니다!

							받은 쪽지 화면이에요~~~~~~
					</div>
					<hr>
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
	
	
	<footer>
		<%@ include file ="../common/footer.jsp" %>
	</footer>


</body>
</html>