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
<title>쪽지 작성</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

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
	min-height: 1000px;
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

#content{width : 100%; height : auto; border: 1px solid rgb(230, 230, 230); border-radius: 10px; padding: 20px;}

article{width: 95%; height: auto; margin : 20px;}

#typeWrap{height: 50px; padding: 7px;}

#buttonWrap{height: 60px;}

#buttonWrap > div{float: left;}

#buttonWrap1{width: 10%;}

#messageTitleWrap{height: 50px;}

#messageTitleWrap > div{float: left;}

#messageTitleText{width: 10%; font-weight: bold;}

#messageTitleDiv{width: 90%;}

#messageTitle{width: 50%; border: none; border-bottom: 1px solid #CCC; outline:none; padding:0;}

#receiverWrap{height: 50px;}

#receiverWrap > div{float: left;}

#receiverText{width: 10%; font-weight: bold;}

#receiver{width: 90%;}

#messageReceiver{width: 50%; border: none; border-bottom: 1px solid #CCC; outline:none; padding:0;}

#messageContentWrap{width: 100%; height: auto; min-height: 350px;}

#messageContent{width: 100%; height: auto; min-height: 400px; resize:none; border: none; outline:none; padding:20px;}

#messageLenWrap > div {float: left;}

#messageLen{width: 95%; text-align: right;}

#messageLenMax{width: 5%;}

#back{width : 100%; height : 100px; padding: 40px 20px;}

footer {width: 100%; height: auto;}

.messageList {text-decoration: none;color: black;}

table{background-color: rgb(232, 238, 253); border-radius: 7px;}

</style>
</head>
<body>

	<header id="header">
		<%@ include file ="../common/nav2.jsp" %>
	</header>
	<main>
		<aside id="aside1" class="aside">
			<%@ include file ="../common/cmNavi.jsp" %>	
		</aside>
		
		<section id="section">
			
			<div id="contentTitle">
				쪽지쓰기
			</div>
			
			<div id="content">
				<article>
					<form method="post" action="<%= contextPath %>/insert.ms">
					<input type="hidden" name="senderNo" value="<%= loginUser.getMemNo() %>">
					<div id="buttonWrap">
						<div id="buttonWrap1">
							<button type="submit" class="btn btn-primary">보내기</a>
						</div>
					</div>
					<div id="messageTitleWrap">
						<div id="messageTitleText">
							쪽지 제목
						</div>
						<div id="messageTitleDiv">
							<input type="text" id="messageTitle" name="messageTitle" placeholder="제목을 입력해주세요">
						</div>
					</div>
					<div id="receiverWrap">
						<div id="receiverText">
							받는 사람
						</div>
						<div id="receiver">
							<input id="messageReceiver" name="receiverId" type="text" placeholder="받을 사람의 ID를 입력해주세요">
						</div>
					</div>
					
					<hr>
					<div id="messageContentWrap">
						<textarea id="messageContent" name="messageContent"></textarea>
					</div>
					</form>
					<hr>
					<div id="messageLenWrap">
						<div id="messageLen">
							0
						</div>
						<div id="messageLenMax">
							&nbsp;/&nbsp;1000
						</div>
					</div>
					
				</article>
			<div id="back" align="right">
				<a href="<%= contextPath %>/list.ms?memNo=<%= loginUser.getMemNo() %>&type=receiver" id="backButton" class="btn btn-light">돌아가기</a>
			</div>
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