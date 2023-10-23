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
<link rel="stylesheet" href="resources/css/message/messageEnrollForm.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

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
							<input type="text" id="messageTitle" name="messageTitle" placeholder="제목을 입력해주세요" required>
						</div>
					</div>
					<div id="receiverWrap">
						<div id="receiverText">
							받는 사람
						</div>
						<div id="receiver">
							<input id="messageReceiver" name="receiverId" type="text" placeholder="받을 사람의 ID를 입력해주세요" required>
						</div>
					</div>
					
					<hr>
					<div id="messageContentWrap">
						<textarea id="messageContent" name="messageContent" required maxlength="1000"></textarea>
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

	<script>
	    $(function(){
	        $('#messageContent').keyup(function(){
	            console.log($(this).val().length);
	            $('#messageLen').text($(this).val().length);
	        })
	    })
	</script>
	
</body>
</html>