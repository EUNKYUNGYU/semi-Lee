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

<link rel="stylesheet" href="resources/css/board/boardDetailView.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js">
</script>


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
						<div id="writeIdWrap">
							<div id="writerId">
								<% if("익명게시판".equals(b.getBoardName())) { %>
									익명
								<% } else { %>
									<a id="writerIdButton"><%= b.getWriter() %></a>
								<% } %>
							<div id="writeInfoHidden">
								<ul id="writeInfoHiddenUl">
									<li><a href="<%= contextPath %>/list.mbo?memNo=<%= b.getMemNo() %>&cpage=1" class="hiddenButton">게시글 보기</a></li>
									<% if(loginUser != null) { %>
										<li><a href="<%= contextPath %>/insertMem.ms?receiverId=<%= b.getMemId() %>&receiverNo=<%= b.getMemNo() %>&senderNo=<%= loginUser.getMemNo() %>" class="hiddenButton">쪽지 보내기</a></li>
									<% } %>
								</ul>
							</div>
							</div>
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
						<% if(loginUser != null) { %>
						<% System.out.println(b.getLikeMem()); %>
							<% if(b.getLikeMem() == 1) { %>
								<img src="resources/img/fullHeart.png" alt="빈하트" id="emptyHeart" >
							<% } else { %>
								<img src="resources/img/emptyHeart.png" alt="빈하트" id="emptyHeart" >
							<% } %>
								<a href="<%= contextPath %>/like.bo?memNo=<%= loginUser.getMemNo() %>&boardNo=<%= b.getBoardNo() %>">좋아요</a> <%= b.getLikes() %> 댓글 <%= b.getComments() %>
						<% } else { %>
							<img src="resources/img/emptyHeart.png" alt="빈하트" id="emptyHeart" >
					 		<a href='#' onclick="alert('로그인 후 이용 가능한 기능입니다.');">좋아요</a> <%= b.getLikes() %> 댓글 <%= b.getComments() %>
						<% } %>
						
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