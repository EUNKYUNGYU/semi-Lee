<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.board.model.vo.Board, java.util.ArrayList"%>
    
<% 
	Board b = (Board)request.getAttribute("b");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js">
</script>

<style>

* {
	box-sizing: border-box;
}

body{margin : 0;}

#header {width: 100vw; height: 100px;}

main {width: 100%; height: auto;  line-height: 30px;}

main > section, main > aside, main > div{float: left;}

.aside {height: auto; float: left; margin: 20px auto; display: flex; justify-content: center; padding: 0;}

#aside1{width :25%}

#aside2{width :15%}

#section{width: 60%; height: auto;  min-height: 1000px; float: left; padding: 20px;s}

#contentTitle{width : 100%; height : 100px; padding: 20px; font-size : 30px; font-weight: bold; line-height : 200%;}

#content{width : 100%; height : auto; border: 1px solid rgb(230, 230, 230); border-radius: 10px; padding: 0px 0px 20px 0px;}

article{width: 95%; height: auto; margin: 20px auto; }

#boardHeader {width: 100%; height: 70px; padding: 20px; font-size: 30px; font-weight : 600;}

#boardHeader>div {float: left;}

#title {width: 70%; height: 100%; font-size: 30px;}

#writerInfoWrap{width: 100%; height: 120px; padding: 10px;}

#writerInfoWrap > div {float: left;}

#writerThumbnail{width: 10%; height: 100%; }

#user_photo2{width: 100px; height: 100px;}

#writerId{width: 90%; height: 100%; padding-left: 10px; font-size : 15px; font-weight : bold; line-height : 100px;} 

#boardInfor {width: 100%; height: 50px; line-height: 30px; padding: 10px; color : gray; font-size : 12px;}

#boardInfor > div{float: left;}

#boardDate{width: 80%;}

#commentCount{width: 20%; text-align: right;}

#boardContent{width:100%; height: auto; padding: 10px;}

#boardlikeWrap{width:100%; height:30px; line-height: 30px; padding-left: 10px; color : gray;font-size : 12px;}

#commentWrap {width: 100%; height: auto;}

#commentWrap > div{float: left;}

#commentOption{width:100%; height:30px; font-size: 18px; font-weight: 600; padding:0 10px;}

#commentOption > a{color : gray; font-size : 12px; padding:0 10px;}

#commentContentBox{width: 100%; height: auto;}

#commentContentBox > div{float: left;}

#commentWriteMemId{width: 100%; height: 30px; font-weight: bold; font-size: 13px; padding: 0 10px;}

#commentContent{width: 100%; height: 30px; font-size: 11px; padding: 0 10px;}

#commentCreateDate{width: 100%; height: 30px; font-size: 10px; color: gray; padding: 0 10px;}

#commentCreateDate > a{color: gray;}

#commentInsertBox{width: 100%; height: 100px; border: 0.5px solid darkgray; border-radius: 10px; background-color: white; padding: 5px; height: 95%;}

#commentWriter{width: 100%; height: 30px; font-size : 15px; font-weight: 600; padding:0 10px;}

#commentContent{width: 100%; height: 30px;background-color: transparent; resize: none; outline: 0; border: 0; padding:0 10px;}

#submitWrap{float: right; margin: -36px 10px -36px 0px;}

#submitWrap > a{color : gray; font-size : 12px; padding:0 10px;}

#page{width : 100%; height : 80px; padding: 20px;}

#page > div {float: left;}

#writeWrap{width: 80%;}

#upWrap{width: 20%; text-align: right;}

footer {width: 100%; height: auto;}

a {text-decoration: none;}
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
				<%= b.getBoardName() %>
			</div>
			<div id="content">
				<article>
					<div id="boardHeader">
						<div id="title"><%= b.getBoardTitle() %></div>		
					</div>
					<div id="writerInfoWrap">
						<div id="writerThumbnail">
							<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMTlfMjA1%2FMDAxNjE2MDgwOTM1MDIx.JZKXWzM8gscL4K0VtyQuYki9jetacIhoppgLJ0PlxEcg.iqtKX-tjRe6nSqfieZ6uYV1QS-4S2LewzhkIAVyic4kg.PNG.wnsghks1017%2Fimage.png&type=a340" alt="회원사진" id="user_photo2" >
                        
						</div>
						<div id="writerId">
							<% if("익명게시판".equals(b.getBoardName())) { %>
								익명
							<% } else { %>
								<%= b.getWriter() %>
							<% } %>
						</div>
					</div>
					<div id="boardInfor">	
						<div id="boardDate">
							2023.09.05&nbsp;&nbsp;20:53&nbsp;&nbsp;&nbsp;&nbsp;조회 <%= b.getViews() %>
						</div>
						<div id="commentCount">
							댓글&nbsp;&nbsp;<%= b.getComments() %>
						</div>
					</div>
					<hr clear="both">
					<div id="boardContent">
						<%= b.getBoardContent() %>
					</div>
					<div id="boardlikeWrap">
						좋아요 <%= b.getLikes() %> 댓글 <%= b.getComments() %>
					</div>	
					<hr clear="both">
					
					<!-- 댓글 하나도 없을 시 등록 순 최신순 버튼 비활성화 -->
					
					<div id="commentWrap">
						<div id="commentOption">
							댓글 <a>등록순</a> <a>최신순</a>
						</div>
						<div id="commentContentBox">
							<div id="commentWriteMemId">
								댓글 단 유저 id
							</div>
							<div id="commentContent">
								댓글 내용입니다
							</div>
							<div id="commentCreateDate">
								2023.10.17 13:14&nbsp;&nbsp;
								<a href="#">답글 쓰기</a>
							</div>
						</div>						
						<div id="commentInsertBox">
							<div id="commentWriter">유저ID</div>
							<textarea id="commentContent" placeholder="댓글을 남겨보세요"></textarea>
							<div id="submitWrap"><a href="#">등록</a></div>
						</div>
					</div>
				
				</article>
			</div>
			
			<div id="page">
				<div id="writeWrap">
					<% if(loginUser != null) { %>
						<a class="btn btn-primary" href="<%= contextPath %>/views/board/boardEnrollForm.jsp" >글 쓰기</a>
						<% if(loginUser.getNickName().equals(b.getWriter())) { %>
							<a class="btn btn-light" href="<%= contextPath %>/updateForm.bo?boardNo=<%= b.getBoardNo() %>">수정</a>
							<a class="btn btn-light" href="<%= contextPath %>/delete.bo?boardNo=<%= b.getBoardNo() %>">삭제</a>
						<% } %>
					<% } %>
				</div>
				<div id="upWrap">
					<a class="btn btn-light">^</a>
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