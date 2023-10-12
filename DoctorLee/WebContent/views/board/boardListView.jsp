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
<title>게시글 리스트 전체보기</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<style>

* {
	border: 1px solid skyblue;
	box-sizing: border-box;
}

body{margin : 0;}

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

main > section, main > aside, main > div{float: left;}

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

	<header id="header">
		<%@ include file ="../common/nav2.jsp" %>
	</header>
	<main>
		<aside id="aside">
			<%@ include file ="../common/cmNavi.jsp" %>	
		</aside>
		
		<section id="section">
			
			<div id="contentTitle">
				게시판
			</div>
			
			<div id="content">
				<article>
					<hr>
					<table align="center" id="BoardTable" class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col" width="15%"></th>
					      <th scope="col" width="40%" style="text-align: center">제목</th>
					      <th scope="col" width="10%">작성자</th>
					      <th scope="col" width="15%" style="text-align: center">작성일</th>
					      <th scope="col" width="10%" style="text-align: center">조회수</th>
					      <th scope="col" width="10%" style="text-align: center">추천수</th>
					    </tr>
					  </thead>
					  
							<% if(list == null) { %>
						
						<tbody>
							<tr>
								<td colspan="6">조회된 게시글이 없습니다.</td>
							</tr>
							<% } else { %>
							<% for(Board b : list) { %>
							<tr>
								<td class="tableCenter" align="center"><%= b.getBoardNo() %></td>
								<td scope="row"><%= b.getBoardTitle() %></td>
								<td class="tableCenter"><%= b.getWriter() %></td>
								<td class="tableCenter" align="center"><%= b.getCreateDate() %></td>
								<td class="tableCenter" align="center"><%= b.getViews() %></td>
								<td class="tableCenter" align="center">0</td>
							</tr>
							<% } %>
							<% } %>
						</tbody>
					</table>
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
	<br clear="both">
	
	<footer>
		<%@ include file ="../common/footer.jsp" %>
	</footer>


</body>
</html>