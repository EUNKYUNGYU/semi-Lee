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
<title>게시판 작성</title>
<style>
* {
	box-sizing: border-box;
	border: 1px solid paleturquoise;
}

#header {
	width: 1800px;
	height: 200px;
}

section {
	width: 1800px;
	height: 2300px;
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
	height: 1800px;
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


			<header id="boardHeader">게시글작성</header>
			
			<article id="boardArticle">
				<form>
				
				<div id="boardContent">
				
				<div id="buttonWrap">
					<button type="submit">게시글 등록</button>
				</div>
				
					<table align="center" id="boardTable">
						<thead>
							<tr>
								<th>
									<select style="width:900px; height:50px" name="category" id="">
										<option value="20">자유게시판</option>
                            			<option value="30">정보게시판</option>
                            			<option value="40">익명게시판</option>
                        			</select>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th colspan="2" height="70">
									<input style="width:900px; height:50px" type="text" placeholder="제목을 입력해주세요" name="boardTitle">
								</th>
							</tr>
							<tr>
								<th colspan="2" height="70">
									<input style="width:900px; height:300px" type="text" placeholder="내용을 입력해주세요" name="boardTitle">
								</th>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			</article>
			
		</div>
	</section>
	
	<footer> 푸터 영역 </footer>


</body>
</html>