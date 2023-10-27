<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.board.model.vo.Board, java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% 
	Board b = (Board)request.getAttribute("b");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>

<link rel="stylesheet" href="resources/css/board/boardUpdateForm.css">
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
				게시글 수정
			</div>
			<div id="content">
				<article>
					<form action="<%= contextPath %>/update.bo" method="post">
						<input type="hidden" name="memNo" value="<%= loginUser.getMemNo()%>">
						<input type="hidden" name="boardNo" value="<%= b.getBoardNo() %>">
					<div id="boardCategoryWrap">
						<select name="boardType" id="boardCategory">
							<% if("admin".equals(loginUser.getMemId())) { %>
							<option value="10">공지사항</option>
							<% } %>
							<option value="20">자유게시판</option>
                            <option value="30">정보게시판</option>
                            <option value="40">익명게시판</option>
                        </select>
					</div>
					<div id="boardHeader">
						<input type="text" placeholder="제목을 입력해주세요" name="boardTitle" value="<%= b.getBoardTitle() %>" required>		
					</div>
					<div>
						<input type="file" name="file">
					</div>
					<hr>
					<div id="boardContent">
						<textarea id="boardContent" placeholder="내용을 입력해주세요" name="boardContent"required><%= b.getBoardContent() %>
						</textarea>
					<hr>
					</div>
					<button type="submit" class="btn btn-primary">글 수정</button>
				</form>
				</article>
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