<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.board.model.vo.Board,java.util.ArrayList, com.kh.DoctorLee.common.model.vo.PageInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
			<c:if test="${(loginUser ne null) and (memId eq loginUser.memId) }">
				<div id="contentTitle">
					나의 게시글
				</div>
			</c:if>
			
			<div id="content">
				<article>
					<div id="userWrap">
						<div id="userThubnail">사진</div>
						<div id="userInforWrap">
							<div id="userId">${ nickname }<span style="color: gray;">(${ memId })</span></div>
							<div id="userBoard">
								<a href="" class="messageList">작성글${ pi.listCount }&nbsp;&nbsp;</a>
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
					  <c:choose>
						  <c:when test="${ list eq null }">
							    <tr>
								  <td colspan="5" style="text-align: center">작성한 게시글이 없습니다</td>
							    <tr>
						    </c:when>
						    <c:otherwise>
							    <c:forEach var="b" items="${ requestScope.list }">
								    <tr>
								    <td scope="col" width="10%">${ b.boardNo }</th>
									<c:choose>
										<c:when test="${ loginUser ne null }">				
											<td scope="col" width="50%" style="text-align: center">
												<a href="<%=contextPath%>/detail.bo?boardNo=${ b.boardNo }&memNo=${ loginUser.memNo }">${ b.boardTitle }</a>
											</td>     
									    </c:when>
									    <c:otherwise>
										    <td scope="col" width="50%" style="text-align: center" id="boardTitleTd">
												<a href="<%=contextPath%>/detail.bo?boardNo=${ b.boardNo }&memNo=0">${ b.boardTitle }</a>
											</td>
									    </c:otherwise>
								    </c:choose>
								    <td scope="col" width="20%">${ b.createDate }</th>
								    <td scope="col" width="10%">${ b.views }</th>
								    <td scope="col" width="10%">추천수</th>
								    </tr>
							    </c:forEach>
							</c:otherwise>
						</c:choose>
					  </tbody>
					</table>
					
					<script>
						
						$(function(){
						
							$('tr > td').click(function(){
								location.href = '<%=contextPath%>/detail.bo?boardNo=' + $(this).attr('name');
							})
							
						})
						
						
					
					</script>
					
					<c:if test="${ (loginUser ne null) and (memId eq loginUser.memId) }">
					<div id="buttonWrap">
						<div id="buttonWrap1">
							<input type="checkbox" name="allCheck" id="allCheck"><label for="allCheck">&nbsp;&nbsp;전체선택</label>
						</div>
						<div id="buttonWrap2">
							<a href="#" id="deleteAllButton" type="button" class="btn btn-light">삭제</a>
						</div>
					</div>
					</c:if>
				</article>
			</div>
			
			<div id="page">
				<c:if test="${pi.currentPage ne 1 }">
		        	<button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.mbo?memNo=${ memNo }&cpage=${ pi.currentPage - 1 }'">&lt;</button>
		        </c:if>
		       <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }">
		        	<c:choose>
		        	<c:when test="${ pi.currentPage ne i }">
		          		<button class="btn btn-light" onclick="location.href='<%= contextPath%>/list.mbo?cpage=${ i }&memNo=${ memNo }'">${ i }</button>
		         	</c:when>
		         	<c:otherwise>
		         		<button disabled class="btn btn-default">${ i }</button>
		         	</c:otherwise>
		         </c:choose>
		         </c:forEach>
		        
		        <button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.mbo?cpage=${ pi.currentPage + 1 }&memNo=${ memNo }'">&gt;</button>
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