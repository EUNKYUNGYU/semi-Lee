<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.message.model.vo.Message,java.util.ArrayList"%>
    
<% 
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list");
	Message m = (Message)request.getAttribute("m");
	int messageNo = (int)request.getAttribute("messageNo");
	System.out.println("메세지 디테일 뷰" +messageNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 상세보기</title>

<link rel="stylesheet" href="resources/css/message/messageDetailView.css">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
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
				쪽지함
			</div>
			
			<div id="content">
				<article>
					
					<div id="buttonWrap">
						<div id="buttonWrap1">
							<form action="<%= contextPath %>/delete.ms" method="post">
								<input type="hidden" name="messageNo" value="<%= messageNo%>">
								</input>
								<input type="hidden" name="memberNo" value="<%= loginUser.getMemNo() %>">
								</input>
								<input type="submit" class="btn btn-light" value="삭제">
								</input> 
							</form>
						</div>
						<div id="buttonWrap2">
							<a href="<%= contextPath %>/sendCommon.ms" class="btn btn-primary">답장하기</a>
						</div>
					</div>
					<div id="messageTitleWrap">
						<div id="messageTitleText">
							쪽지 제목
						</div>
						<div id="messageTitle">
							<%= m.getMessageTitle() %>
						</div>
					</div>
					<div id="senderWrap">
						<div id="senderText">
							보낸 사람 
						</div>
						<div id="sender">
							<%= m.getSender() %>
						</div>
					</div>
					<div id="sendDateWrap">
						<div id="sendDateText">
							받은 시간
						</div>
						<div id="sendDate">
							<%= m.getSendDate() %>
						</div>
					</div>
					<hr>
					<div id="messageContentWrap">
						<%= m.getMessageContent() %>
					</div>
					<hr>
				</article>
			</div>
			<div id="back" align="right">
				<a href="<%= contextPath %>/list.ms?memNo=<%= loginUser.getMemNo() %>&type=receiver" id="backButton" class="btn btn-light">돌아가기</a>
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