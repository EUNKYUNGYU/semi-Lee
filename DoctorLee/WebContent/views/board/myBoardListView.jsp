<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.board.model.vo.Board,java.util.ArrayList"%>
    
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 게시글 리스트 전체보기</title>
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

#content{
	width : 100%;
	height : auto;
}

article{width: 95%; height: auto; margin : 20px;}
					
#userWrap{height: 100px;}

#userWrap > div{float: left; }

#userThubnail{width: 10%; height: 100%;}

#userInforWrap{width: 70%; height: 100%; padding: 5px;}

#userId{height: 60%; padding: 10px; font-size: 25px; font-weight: bold;}

#userBoard{height: 40%; padding: 5px 10px;}
					
#typeWrap{height: 50px; padding: 7px;}

#buttonWrap{height: 50px;}

#buttonWrap > div{float: left; }

#buttonWrap1{width: 90%; height:100%; padding:10px;}

#buttonWrap2{width: 10%; height:100%; padding:5px; text-align: right;}

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

#boardTable{
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
		<aside id="aside1" class="aside">
			<%@ include file ="../common/cmNavi.jsp" %>	
		</aside>
		
		<section id="section">
			
			<div id="contentTitle">
				나의 게시글
			</div>
			
			<div id="content">
				<article>
					<div id="userWrap">
						<div id="userThubnail">사진</div>
						<div id="userInforWrap">
							<div id="userId">유저 ID</div>
							<div id="userBoard">
								<a href="" class="messageList">작성글6&nbsp;&nbsp;</a>
								<a href="" class="messageList">댓글단 글25&nbsp;&nbsp;</a>
								<a href="" class="messageList">추천한 글13</a>							
							</div>
						</div>
					</div>
					<br>
					
					
					<table id="boardTable" class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col" width="">게시글 번호</th>
					      <th scope="col">제목</th>
					      <th scope="col">작성일</th>
					      <th scope="col">조회수</th>
					      <th scope="col">추천수</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
						  <td colspan="5"  style="text-align: center">작성한 게시글이 없습니다</th>
					    <tr>
					      <td scope="col" width="10%">게시글 번호</th>
					      <td scope="col" width="40%">제목</th>
					      <td scope="col" width="20%">작성일</th>
					      <td scope="col" width="10%">조회수</th>
					      <td scope="col" width="10%">추천수</th>
					    </tr>
					  </tbody>
					</table>
					
					<div id="buttonWrap">
						<div id="buttonWrap1">
							<input type="checkbox" name="allCheck" id="allCheck"><label for="allCheck">&nbsp;&nbsp;전체선택</label>
						</div>
						<div id="buttonWrap2">
							<a href="#" id="deleteAllButton" type="button" class="btn btn-light">삭제</a>
						</div>
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
		
		<aside id="aside2" class="aside">
		</aside>
		
	</main>
	
	
	<footer>
		<%@ include file ="../common/footer.jsp" %>
	</footer>


</body>
</html>