<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.board.model.vo.Board, java.util.ArrayList"%>
    
<% 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성하기</title>

<link rel="stylesheet" href="resources/css/board/boardEnrollForm.css">

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
				게시글 작성
			</div>
			<div id="content">
				<article>
					<form action="<%= contextPath %>/insert.bo" method="post">
					<input type="hidden" name="memNo" value="<%= loginUser.getMemNo()%>">
					<div id="boardCategoryWrap">
						<select name="category" id="boardCategory">
							<% if("admin".equals(loginUser.getMemId())) { %>
							<option value="10">공지사항</option>
							<% } %>
							<option value="20">자유게시판</option>
                            <option value="30">정보게시판</option>
                            <option value="40">익명게시판</option>
                        </select>
					</div>
					<div id="boardHeader">
						<input type="text" placeholder="제목을 입력해주세요" name="boardTitle" required>		
					</div>
					<div id="fileWrap">
						<input type="file" name="file">
					</div>
					<div id="boardContent">
					<hr>
						<textarea id="boardContent" placeholder="내용을 입력해주세요" name="boardContent" required></textarea>
					<hr>
					</div>
					<button type="submit" class="btn btn-primary" id="buttonWrite">글 작성</button>
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