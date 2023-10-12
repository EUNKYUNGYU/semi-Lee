<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.board.model.vo.Board, java.util.ArrayList"%>
    
<% 
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
	border: 0.5px solid skyblue;
	box-sizing: border-box;
}

body{margin : 0;}

#header {width: 100vw; height: 100px;}

main {width: 100%; height: auto;  line-height: 30px;}

main > section, main > aside, main > div{float: left;}

#aside {width: 20%; height: auto; float: left; margin: 20px auto; display: flex; justify-content: center; padding: 0;}

#section{width: 60%; height: auto;  min-height: 1000px; float: left; padding: 20px;s}

#contentTitle{width : 100%; height : 100px; padding: 20px; font-size : 30px; line-height : 200%;}

#content{width : 100%; height : auto;}

article{width: 95%; height: auto; margin: 20px auto; border: 1px solid rgb(230, 230, 230); border-radius: 10px; padding: 20px;}

#boardHeader {width: 100%; height: 70px; padding: 20px; font-size: 30px; font-weight : 600;}

#boardHeader>div {float: left;}

#title {width: 70%; height: 100%; font-size: 30px;}

#writerInfoWrap{width: 100%; height: 120px; padding: 10px;}

#writerInfoWrap > div {float: left;}

#writerThumbnail{width: 10%; height: 100%; }

#user_photo2{width: 100px; height: 100px; padding:none;}

#writerId{width: 90%; height: 100%; padding-left: 10px; font-size : 15px; font-weight : bold; line-height : 100px;} 

#boardInfor {width: 100%; height: 50px; line-height: 30px; padding: 10px; color : gray; font-size : 12px;}

#boardInfor > div{float: left;}

#boardDate{width: 80%;}

#commentCount{width: 20%; text-align: right;}

#boardContent{width:100%; height: auto; padding: 10px;}

#boardlikeWrap{width:100%; height:30;line-height: 30px;padding: 10px;color : gray;font-size : 12px;}

#commentWrap {width: 100%;}

#commentOption{width:100%; height:30; font-size: 18px; font-weight: 600; padding:0 10px;}

#commentOption > a{color : gray; font-size : 12px; padding:0 10px;}

#commentBox{border: 0.5px solid darkgray; border-radius: 10px; background-color: white; margin: 10px; padding: 5px; height: 95%;}

#commentWriter{font-size : 15px; font-weight: 600; padding:0 10px;}

#commentContent{background-color: transparent; width:100%; resize: none; outline: 0; border: 0; padding:0 10px;}

#submitWrap{float: right; margin: -36px 10px -36px 0px;}

#submitWrap > a{color : gray; font-size : 12px; padding:0 10px;}

footer {width: 100%; height: auto;}

a {text-decoration: none;}
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
				자유 게시판
			</div>
			<div id="content">
				<article>
					<div id="boardHeader">
						<div id="title">게시글 제목</div>		
					</div>
					<div id="writerInfoWrap">
						<div id="writerThumbnail">
							<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMTlfMjA1%2FMDAxNjE2MDgwOTM1MDIx.JZKXWzM8gscL4K0VtyQuYki9jetacIhoppgLJ0PlxEcg.iqtKX-tjRe6nSqfieZ6uYV1QS-4S2LewzhkIAVyic4kg.PNG.wnsghks1017%2Fimage.png&type=a340" alt="회원사진" id="user_photo2" >
                        
						</div>
						<div id="writerId">
							작성자 아이디
						</div>
					</div>
					<div id="boardInfor">	
						<div id="boardDate">
							2023.09.05&nbsp;&nbsp;20:53&nbsp;&nbsp;&nbsp;&nbsp;조회 203
						</div>
						<div id="commentCount">
							댓글&nbsp;&nbsp;3
						</div>
					</div>
					<hr>
					<div id="boardContent">
							내용입니다~~~~<br>
							어쩌구저쩌구<br>
							아아아아아아아ㅏ<br>
							<br>
							<br>
							내용!!!!
							<br>
							아아오오아아오오
							<br>
					</div>
					<div id="boardlikeWrap">
						좋아요 3 댓글 2
					</div>	
					<hr>
					<div id="commentWrap">
						<div id="commentOption">
							댓글 <a>등록순</a> <a>최신순</a>
						</div>
						<div id="commentBox">
							<div id="commentWriter">유저ID</div>
							<textarea id="commentContent" placeholder="댓글을 남겨보세요"></textarea>
							<div id="submitWrap">
								<a href="#">등록</a>
							</div>
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