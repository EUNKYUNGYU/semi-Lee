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
<title>쪽지함</title>
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

#aside {
	width: 20%;
	height: auto;
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
	margin : 20px;
}

#typeWrap{
	height: 50px;
	padding: 7px;
}
#buttonWrap{
	height: 50px;
}

#buttonWrap > div{
	float: left;
}

#buttonWrap1{
	width: 10%;
}

#buttonWrap2{
	width: 30%;
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

.messageList {
	text-decoration: none;
	color: black;
	
}

table{
	background-color: rgb(232, 238, 253);
	border-radius: 7px;
}

.notReadStyle{color: skyblue;}

</style>
</head>
<body>

	<header>
		<%@ include file ="../common/nav2.jsp" %>
	</header> 
	<main>
		<aside id="aside">
			<%@ include file ="../common/cmNavi.jsp" %>	
		</aside>
		
		<section id="section">
			
			<div id="contentTitle">
				쪽지함
			</div>
			
			<div id="content">
				<article>
					<div id="typeWrap">
						<a href="<%= contextPath %>/list.ms?memNo=<%= loginUser.getMemNo() %>&type=receiver" class="messageList">받은 쪽지함&nbsp;&nbsp;</a>
						<a href="<%= contextPath %>/list.ms?memNo=<%= loginUser.getMemNo() %>&type=sender" class="messageList">보낸 쪽지함</a>
					</div>
					
					<div id="buttonWrap">
						<div id="buttonWrap1">
							<button type="button" class="btn btn-light">삭제
						</div>
						<div id="buttonWrap2">
							<a href="<%= contextPath %>/views/message/messageEnrollForm.jsp" class="btn btn-primary">쪽지 보내기</a>
						</div>
					</div>
					<hr>
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col"><input type="checkbox"></th>
					      <th scope="col">보낸 사람</th>
					      <th scope="col">제목</th>
					      <th scope="col">날짜</th>
					    </tr>
					  </thead>
					  <tbody id="messageList">
					  <% if(list == null) { %>
					    <tr>
						  <th colspan="4" style="text-align: center">받은 메세지가 없습니다</th>
						</tr>
						    
					  <% } else { %>
					  	<% for(Message m : list){ %>
						<% if(m.getReadStatus().equals("N")){%>
							<tr class="notReadStyle">
						<% } else { %>
						     <tr>
						<% } %>
							<form action="<%= contextPath %>/delete.ms" method="get">
						      <th><input type="checkbox" class="chkMsg" name="checkMsg" value=""></th>
						    </form>
						      <td scope="row"><%= m.getReceiver() %></td>
						      <td name="<%= m.getMessageNo() %>"><%= m.getMessageTitle()%></td>
						      <td><%= m.getSendDate() %></td>
						    </tr>
						  <% } %>
  					  <% } %>
					  </tbody>
					</table>
				</article>
			</div>
			
			
			<script>
        		$(function(){
        			
        			$('tr > td').click(function(){
        				
        				location.href = '<%=contextPath%>/detail.ms?messageNo=' + $(this).attr('name');
        				console.log(mNo);
        			
        			});
        			
        			$(".chkMsg:checked").each(function(idx){

        			    console.log(idx + "번째 = " + $(this).val());
        			    
        			});
        			
        			$('input[type=checkbox]:checked').attr('name')
        			console.log($('#checkMsg').is(':checked'));
        			
        		})
		
			</script>
			
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