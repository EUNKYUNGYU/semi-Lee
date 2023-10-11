<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.DoctorLee.quize.model.vo.Quize,java.util.ArrayList"%>
    
<% 
	ArrayList<Quize> list = (ArrayList<Quize>)request.getAttribute("list");
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
	font-weight : 600;
	text-align: left;
	padding-left: 20px;
}

#vote, #deadline {
	width: 15%;
	height: 100%;
}

#quizeContent {
	width: 100%;
	height: 300px;
	line-height: 30px;
	padding: 20px;
}

#quizeFooter {
	width: 100%;
	height:70px;
}

#quizeFooter  >div {
	float: left;
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
	line-height: 70px;
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
	border-radius: 10px;
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
			
			<% if(list.isEmpty()) { %>
				<div id="content">
					퀴즈가 존재하지 않습니다.
				</div>
									
			<% } else { %>
			
			<!-- 퀴즈가 있을 경우 반복문으로 출력 -->			
			<% for(Quize q : list) { %>
			<div id="content">
				
				<article>
					<div id="quizeHeader">
						<div id="title"><%= q.getQuizeTitle() %></div>
						<div id="vote"><%= q.getVote() %>명 투표 중</div>
						<div id="deadline"><%= q.getDeadline() %>일 남음</div>
					</div>
					
					<form method="post"  action="<%= contextPath %>/choice.qz">
						<div id="quizeContent">
						<%= q.getQuizeContent() %>
						<br>
						
								<input type="radio" name="choice" value="1" id="choice1" checked> 
								<label for="choice1"><%= q.getChoice1() %></label><br> 
											
								<input type="radio" name="choice" value="2" id="choice2"> 
								<label for="choice2"><%= q.getChoice2() %></label><br> 
											
								<input type="radio" name="choice" value="3" id="choice3"> 
								<label for="choice3"><%= q.getChoice3() %></label><br> 
											
								<input type="radio" name="choice" value="4" id="choice4"> 
								<label for="choice4"><%= q.getChoice4() %></label><br> 
								
						</div>
							
						<div id="quizeFooter">
							
						<!-- 로그인을 했을 때만 정답 제출 가능 -->
						<% if(loginUser != null) { %>
							<div id="quizeFooter1">
								<button type="submit" id="quizeButton1" class="quizeButton1">제출
								<input type="hidden" id="memNo" name="memNo" value="<%= loginUser.getMemNo() %>">
								<input type="hidden" id="quizeNo" name="quizeNo" value="<%= q.getQuizeNo() %>">
								
							</div>		
							<!-- 로그인 안 했을 경우 제출 버튼 눌렀을 시 '로그인 후 이용 가능한 기능입니다' alert창 나옴 -->
						<% } else { %>
							<div id="quizeFooter1">
								<button type="button" id="quizeButton2" class="quizeButton2">제출
							</div>	
					   	<% } %>
						</form>
				   	
							
						<!-- 정답을 제출하지 않았을 경우 정답 확인하기 버튼을 눌렀을 때 확인 불가능 -->
						<% if(loginUser == null) { %>
						<div id="quizeFooter2">
							<a href='javascript:void(0);' onclick="alert('로그인 후 이용 가능한 기능입니다.');">정답 확인하기 &gt;</a>
						</div>
						<% } else { %>
						<div id="quizeFooter2">
							<a href="<%= contextPath %>/answerExist.qz?qno=<%= q.getQuizeNo()%>&memNo=<%= loginUser.getMemNo() %>">정답 확인하기 &gt;</a>
						</div>
						<% } %>
					</div>

				</article>
				<% } %>
			<% } %>
			</div>
			
			
			
			<script>
			  $(function(){
			   				
			      $('.quizeButton2').click(function(){
			    	  alert('로그인 후 이용 가능한 기능입니다');
			      });   
							
			 });
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