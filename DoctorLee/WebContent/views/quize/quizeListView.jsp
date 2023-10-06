<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.DoctorLee.quize.model.vo.Quize,
				 java.util.ArrayList"%>
    
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

#quizewrap {
	width: 600px;
	height: 1000px;
}

#quizeboard {
	background-color: rgb(218, 218, 218);
	width: 95%;
	height: 45%;
	margin-left: 2.5%;
	margin-right: 2.5%;
	margin-top: 2.5%;
	margin-bottom: 2.5%;
}

#quizeHeader {
	width: 100%;
	height: 70px;
	text-align: center;
	line-height: 70px;
}

#content {
	width: 100%;
	height: 300px;
	line-height: 30px;
}

#footer {
	width: 100%;
	height: 70px;
}

#quizeHeader>div {
	float: left;
}

#title {
	width: 70%;
	height: 100%;
	font-size: 30px;
}

#vote, #endDate {
	width: 15%;
	height: 100%;
}

#footer>div {
	float: left;
	height: 100%;
	line-height: 70px;
}

#footer1 {
	width: 75%;
}

#footer2 {
	width: 25%;
	text-align: center;
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

* {
	box-sizing: border-box;
	border: 1px solid palevioletred;
}

#header {
	width: 1800px;
	height: 200px;
}

section {
	width: 1800px;
	height: 2300px;
}

section>div, section>aside {
	float: left;
}

#contentWrap {
	width: 1400px;
}

aside {
	width: 300px;
	height: 100%;
	float: left;
	padding-left: 15px;
	padding-right: 15px;
}

#boardHeader, #boardArticle, #page, #search {
	float: left;
	width: 1400px;
	padding-left: 10px;
	padding-right: 10px;
}

#boardHeader {
	height: 100px;
	font-size: 50px;
}

#boardArticle {
	height: 1800px;
}

#page {
	height: 200px;
}

#search {
	height: 200px;
}

footer {
	width: 1800px;
	height: 300px;
}
</style>
</head>
<body>

	<header id="header">
		<%@ include file ="../common/nav2.jsp" %>
		<% System.out.println(loginUser);
		 %>
	</header>
	<section>
		<aside></aside>
		<div id="contentWrap">


			<header id="boardHeader">게시판이름</header>
			<article id="boardArticle">
				게시판 형태
				<div id="boardContent">

					<div id="quizewrap">
						<div id="quize">
							<h1>퀴즈게시판</h1>
						</div>
						<div id="quizeboard">

							<div id="board">
								<% if(list.isEmpty()) { %>

								<% } else { %>
								<% for(Quize q : list) { %>
								<div id="quizeHeader">
									<div id="title"><%= q.getQuizeTitle() %></div>
									<div id="vote"><%= q.getVote() %></div>
									<div id="deadline"><%= q.getDeadline() %>일 남음
									</div>
								</div>
								<div id="content">
									퀴즈 내용 <br>
									<%= q.getQuizeContent() %>
									<br>
									<form method="post" action="<%= contextPath %>/choice.qz" >
										<input type="radio" name="choice" value="1" id="choice1"
											checked> <label for="choice1"><%= q.getChoice1() %></label>
										<br> <input type="radio" name="choice" value="2"
											id="choice2"> <label for="choice2"><%= q.getChoice2() %></label>
										<br> <input type="radio" name="choice" value="3"
											id="choice3"> <label for="choice3"><%= q.getChoice3() %></label>
										<br> <input type="radio" name="choice" value="4"
											id="choice4"> <label for="choice4"><%= q.getChoice4() %></label>
										<br>
								</div>
								<div id="footer">
									<div id="footer1">
										<button type="submit" id="quizeButton" class="btn btn-default">제출
										<input type="hidden" id="memNo" value="<%= loginUser.getMemNo() %>">
										<input type="hidden" id="quizeNo" value="<%= q.getQuizeNo() %>">
										<% if(loginUser != null){ %>
										<% } %>
									</div>
									</form>
									<script>

											
									</script>
									<div id="footer2">
										<a href="<%= contextPath %>/detail.qz?qno=<%= q.getQuizeNo()%>">정답 확인하기 &gt;</a>
									</div>
								</div>

							</div>

						</div>
						<% } %>
						<% } %>

					</div>


				</div>
			</article>
			<div id="page">페이지바 영역</div>
			<div id="search">검색 영역</div>
		</div>
	</section>
	<footer> 푸터 영역 </footer>


</body>
</html>