<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.message.model.vo.Message,java.util.ArrayList, com.kh.DoctorLee.common.model.vo.PageInfo"%>
    
<% 
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	String type = String.valueOf(request.getAttribute("type"));
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	System.out.println("메세지 리스트뷰에서 type" + type);
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
	text-align: center;
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
		<aside id="aside1" class="aside">
			<%@ include file ="../common/cmNavi.jsp" %>	
		</aside>
		
		<section id="section">
			
			<div id="contentTitle">
				쪽지함
			</div>
			
			<div id="content">
				<article>
					<div id="typeWrap">
						<a href="<%= contextPath %>/list.ms?cpage=1&memNo=<%= loginUser.getMemNo() %>&type=receiver" class="messageList">받은 쪽지함&nbsp;&nbsp;</a>
						<a href="<%= contextPath %>/list.ms?cpage=1&memNo=<%= loginUser.getMemNo() %>&type=sender" class="messageList">보낸 쪽지함</a>
					</div>
					
					<form action="#" method="get">
					<div id="buttonWrap">
						<div id="buttonWrap1">
							<button type="button" class="btn btn-light" id="msgDelButton">삭제
						</div>
						<div id="buttonWrap2">
							<a href="<%= contextPath %>/views/message/messageEnrollForm.jsp" class="btn btn-primary">쪽지 보내기</a>
						</div>
					</div>
					<hr>
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col"><input type="checkbox" id="allCk"></th>
					      <% if(type.equals("receiver")) { %>
					      	<th scope="col">보낸 사람</th>
					      <% } else { %>
					      	<th scope="col">받는 사람</th>
					      <% } %>
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
						      <th><input type="checkbox" class="checkMsg" value="<%= m.getMessageNo() %>"></th>
						      <td scope="row"><%= m.getReceiver() %></td>
						      <td name="<%= m.getMessageNo() %>"><%= m.getMessageTitle()%></td>
						      <td><%= m.getSendDate() %></td>
						    </tr>
						    </form>
						  <% } %>
  					  <% } %>
					  </tbody>
					</table>
				</article>
			</div>
			
			
			<script>
				$(function(){
					
					// 제목 클릭 했을 시 메세지 상세보기 페이지로 이동
					$('tr > td').click(function(){
        				location.href = '<%=contextPath%>/detail.ms?messageNo=' + $(this).attr('name') + '&type=<%= type %>';
        			});
	        			
					// #allCk 체크시 체크 박스 전체 체크, 해제시 전체 해제
	        		$('#allCk').click(function(){
	        			var allChecked = $('#allCk').is(':checked'); 
	        			if(allChecked) $('input:checkbox').prop('checked',true);
	        			else $('input:checkbox').prop('checked',false);
	        			
	        		});
					
					// 체크 박스 하나라도 선택 해제 시 #allCk 해제
					// 체크 박스 전체 누르면 #allCk 체크
	        		$('.checkMsg').click(function(){
						var allChecked = $('#allCk').is(':checked'); 
						var checkArr = new Array();

						/*
						allCk = checkArr.is(':checked');
						checkArr = $('.checkMsg');
						var tag= [];
					    for (var i = 0; i < checkArr.length; i++) {
					        if (checkArr[i].checked == true) {
					            tag.push(checkArr[i];
					            sum++;
					        }
								console.log(tag);
					    }
	        			
						*/
					});
				
			})
		
			</script>
			
			<div id="page">
				<%if(currentPage != 1) {%>
		        <button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.ms?cpage=<%= currentPage - 1%>&memNo=<%= loginUser.getMemNo() %>&type=<%= type%>'">&lt;</button>
		        <% }%>
		         
		       
		        <% for(int i = startPage; i <= endPage; i++){%>
		         	<% if(currentPage != i) { %>
		          		<button class="btn btn-light" onclick="location.href='<%= contextPath%>/list.ms?cpage=<%= i %>&memNo=<%= loginUser.getMemNo() %>&type=<%= type%>'"><%= i %></button>
		         	
		         	<% } else { %>
		         		<button disabled class="btn btn-default"><%= i %></button>
		         		<% } %>
		         <% } %>
		        
		        <% System.out.println(maxPage); %>
		        <%if(currentPage != maxPage) { %>
		        <button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.ms?cpage=<%= currentPage + 1%>&memNo=<%= loginUser.getMemNo() %>&type=<%= type%>'">&gt;</button>
		        <% } %>
			</div>
		
			<div id="search">
				검색 영역
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