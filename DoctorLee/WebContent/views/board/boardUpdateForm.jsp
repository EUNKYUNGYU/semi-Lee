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
	border: 0.5px solid skyblue;
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

#content{width : 100%; height : auto;}

article{width: 95%; height: auto; margin: 20px auto; border: 1px solid rgb(230, 230, 230); border-radius: 10px; padding: 20px;}

#boardCategoryWrap{width:100%; height:auto;}

#boardCategory{width:50%; height:30px;}

#boardHeader {width: 100%; height: auto; padding: 5px; font-size: 30px; font-weight : 600;}

#boardTitle {float: left; width: 50%; height:30px;}

#title {width: 70%; height: 100%; font-size: 30px;}

#boardInfor {width: 100%; height: 50px; line-height: 30px; padding: 10px; color : gray; font-size : 12px;}

#boardInfor > div{float: left;}

#boardDate{width: 80%;}

#boardContent{width: 100%; height: auto; min-height: 400px; resize:none; border: none; outline:none; padding:20px;}

#submitWrap{float: right; margin: -36px 10px -36px 0px;}

#submitWrap > a{color : gray; font-size : 12px; padding:0 10px;}

#page, #search{width : 100%; height : 100px; padding: 20px;}

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