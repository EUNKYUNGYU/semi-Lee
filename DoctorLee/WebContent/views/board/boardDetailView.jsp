<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, com.kh.DoctorLee.board.model.vo.Board"%>
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<style>
* {
	box-sizing: border-box;
	border: 1px solid rgb(186, 175, 238);
}

#header {
	width: 1800px;
	height: 200px;
}

section {
	width: 1800px;
	height: auto; 
	min-height: 800px;
}

section > div , section > aside{
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
	height: auto; 
	min-height: 500px;
}

#buttonWrap {
	height: 50px;
	margin-left : 1200px;
}

#boardTable {
	width : 1100px;
   	border-spacing: 10px;
	
}

footer {
	width: 1800px;
	height: 300px;
}
</style>
</head>
<body>


	<header id="header"> 헤더 영역 </header>
	<section>
		<aside>
			<%@ include file="../common/cmNavi.jsp"%>
		</aside>
		<div id="contentWrap">


			<header id="boardHeader">게시판이름</header>
			
			<article id="boardArticle">
				
				<div id="boardContent">
					
					
				</div>
				
			</article>
			
		</div>
	</section>
	
	<footer> 푸터 영역 </footer>


</body>
</html>