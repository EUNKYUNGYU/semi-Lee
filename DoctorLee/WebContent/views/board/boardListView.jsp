<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.board.model.vo.Board,java.util.ArrayList, com.kh.DoctorLee.common.model.vo.PageInfo"%>
    
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String type = String.valueOf(request.getAttribute("type"));
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<link rel="stylesheet" href="resources/css/board/boardListView.css">

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
			
			<div id="contentTitle">
				<% if("10".equals(type)) { %>
					공지사항
				<% } else if("20".equals(type)) { %>
					자유게시판 
				<% } else if("30".equals(type)) { %>
					정보게시판 
				<% } else if("40".equals(type)) { %>
					익명게시판
				<% } %>
			</div>
			
			<div id="content">
				<article>
					<table id="boardTable" class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col" width="10%" style="text-align: center">게시글 번호</th>
					      <th scope="col" width="30%" style="text-align: center">제목</th>
					      <th scope="col" width="10%">작성자</th>
					      <th scope="col" width="20%" style="text-align: center">작성일</th>
					      <th scope="col" width="10%" style="text-align: center">조회수</th>
					      <th scope="col" width="10%" style="text-align: center">좋아요</th>
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
					      <td scope="row" style="text-align: center"><%= b.getBoardNo() %></td>
					         <% if(loginUser != null){ %>
					      <td scope="row" style="text-align: center" name="<%= b.getBoardNo() %>&memNo=<%= loginUser.getMemNo() %>"><%= b.getBoardTitle() %></td>
					      <% } else { %>
					      <td scope="row" style="text-align: center" name="<%= b.getBoardNo() %>&memNo=0"><%= b.getBoardTitle() %></td>
					      <% } %>
					      <% if("40".equals(type)){ %>
					      	<td scope="row" width="10%">익명</td>
					      <% } else { %>
					      	<td scope="row" width="10%"><%= b.getWriter() %></td>
					      <% } %>
					      <td scope="row" width="20%" style="text-align: center"><%= b.getCreateDate() %></td>
					      <td scope="row" width="10%" style="text-align: center"><%= b.getViews() %></td>
					      <td scope="row" width="10%" style="text-align: center"><%= b.getLikes() %></td>
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
					
					<!-- 로그인 했을 경우에만 글 쓰기 버튼 보이게하기 --> 
					<% if(loginUser != null) { %>
						<div id="writeWrap">
						<a id="writeButton" class="btn btn-primary" href="<%= contextPath %>/views/board/boardEnrollForm.jsp" >글 쓰기</a>
						</div>
					<% } %>
				</article>
			</div>
			
			
			<div id="page">
				<%if(currentPage != 1) {%>
		        <button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.bo?cpage=<%= currentPage - 1%>&type=<%= type%>'">&lt;</button>
		        <% }%>
		         
		       
		        <% for(int i = startPage; i <= endPage; i++){%>
		         	<% if(currentPage != i) { %>
		          		<button class="btn btn-light" onclick="location.href='<%= contextPath%>/list.bo?cpage=<%= i %>&type=<%= type%>'"><%= i %></button>
		         	
		         	<% } else { %>
		         		<button disabled class="btn btn-default"><%= i %></button>
		         		<% } %>
		         <% } %>
		        
		        <% System.out.println(maxPage); %>
		        <%if(currentPage != maxPage) { %>
		        <button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.bo?cpage=<%= currentPage + 1%>&type=<%= type%>'">&gt;</button>
		        <% } %>
			</div>
		
			<div id="search">
				검색 영역
			</div>
		
		</section>
		
		<aside id="aside2" class="aside">
		</aside>
		
	</main>
	<clear both="br">
	
	<footer>
		<%@ include file ="../common/footer.jsp" %>
	</footer>


</body>
</html>