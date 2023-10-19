<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.board.model.vo.Board,java.util.ArrayList, com.kh.DoctorLee.common.model.vo.PageInfo"%>
    
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int memNo = (Integer)request.getAttribute("memNo");
	String memId = (String)request.getAttribute("memId");
	String nickname = (String)request.getAttribute("nickname");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 게시글 리스트 전체보기</title>

<link rel="stylesheet" href="resources/css/board/myBoardListView.css">

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


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
			
			<% if(loginUser != null && memId.equals(loginUser.getMemId())) { %>
			<div id="contentTitle">
				나의 게시글
			</div>
			<% } %>
			
			<div id="content">
				<article>
					<div id="userWrap">
						<div id="userThubnail">사진</div>
						<div id="userInforWrap">
							<div id="userId"><%= nickname %><span style="color: gray;">(<%= memId %>)</span></div>
							<div id="userBoard">
								<a href="" class="messageList">작성글<%= listCount %>&nbsp;&nbsp;</a>
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
					   <% if(list == null) { %>
					    <tr>
						  <td colspan="5" style="text-align: center">작성한 게시글이 없습니다</td>
					    <tr>
					    <% } else { %>
						<% for(Board b : list) { %>
					    <tr>
					      <td scope="col" width="10%"><%= b.getBoardNo() %></th>
					      
					      <% if(loginUser != null){ %>
					      <td scope="col" width="40%" name="<%= b.getBoardNo() %>&memNo=<%= loginUser.getMemNo() %>"><%= b.getBoardTitle() %></td>
					      <% } else { %>
                      	  <td scope="col" width="40%" name="<%= b.getBoardNo() %>&memNo=0"><%= b.getBoardTitle() %></td>
					      <% } %>
					      <td scope="col" width="20%"><%= b.getCreateDate() %></th>
					      <td scope="col" width="10%"><%= b.getViews() %></th>
					      <td scope="col" width="10%">추천수</th>
					    </tr>
					    <% } %>
						<% } %>
					  </tbody>
					</table>
					
					<script>
						
						$(function(){
						
							$('tr > td').click(function(){
								location.href = '<%=contextPath%>/detail.bo?boardNo=' + $(this).attr('name');
							})
							
						})
						
						
					
					</script>
					
					
					<% if(loginUser != null && memId.equals(loginUser.getMemId())) { %>
					<div id="buttonWrap">
						<div id="buttonWrap1">
							<input type="checkbox" name="allCheck" id="allCheck"><label for="allCheck">&nbsp;&nbsp;전체선택</label>
						</div>
						<div id="buttonWrap2">
							<a href="#" id="deleteAllButton" type="button" class="btn btn-light">삭제</a>
						</div>
					</div>
					<% } %>
				</article>
			</div>
			
			<div id="page">
				<%if(currentPage != 1) {%>
		        <button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.mbo?memNo=<%= memNo %>&cpage=<%= currentPage - 1%>'">&lt;</button>
		        <% }%>
		         
		       
		        <% for(int i = startPage; i <= endPage; i++){%>
		         	<% if(currentPage != i) { %>
		          		<button class="btn btn-light" onclick="location.href='<%= contextPath%>/list.mbo?cpage=<%= i %>&memNo=<%= memNo%>'"><%= i %></button>
		         	
		         	<% } else { %>
		         		<button disabled class="btn btn-default"><%= i %></button>
		         		<% } %>
		         <% } %>
		        
		        <% System.out.println(maxPage); %>
		        <%if(currentPage != maxPage) { %>
		        <button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.mbo?cpage=<%= currentPage + 1%>&memNo=<%= memNo%>'">&gt;</button>
		        <% } %>
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