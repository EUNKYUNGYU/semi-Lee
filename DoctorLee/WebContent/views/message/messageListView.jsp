<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.DoctorLee.quize.model.vo.Quize,java.util.ArrayList"%>
    
<% 
	ArrayList<Quize> list = (ArrayList<Quize>)request.getAttribute("list");
	String alertMsgPoint = (String)session.getAttribute("alertMsg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>


<style>

* {
	border: 0.5px solid skyblue;
	box-sizing: border-box;
}

body{
	margin : 0;
}

header {
	width: 100vw;
	height: 120px;
}

main {
	width: 100%;
	height: auto; 
	min-height: 1000px;
	line-height: 30px;
}

main > section, main > aside, main > div{
	float: left;
}

aside {
	width: 15%;
	height: auto;
	margin : 20px auto;
	display: flex;
	justify-content: center;
	padding: 0;
}

#section{
	width: 70%;
	height: auto; 
	min-height: 1000px;
	float: left;
	padding: 20px;
}

#contentTitle{
	width : 100%;
	height : 100px;
	padding: 20px;
	font-size : 30px;
	line-height : 200%;
}

#content{
	width : 100%;
	height : auto;
}

article{
	
	width: 95%;
	height: auto;
	margin : 20px;
	background-color: rgb(230, 230, 230);

}


#page, #search{
	width : 100%;
	height : 100px;
	padding: 20px;
}

footer {
	width: 100%;
	height: auto;
}

a {
	text-decoration: none;
	color: #1E376F;
}

button {
	background-color: #1E376F;s
	border-radius: 7px;
	color: white;
	width: 60px;
	height: 30px;
	margin-left: 10px;
}


</style>
</head>
<body>

	<header>
		<%@ include file ="../common/nav2.jsp" %>
	</header>
	
	
	<main>
	
		<aside>
			<%@ include file ="../common/cmNavi.jsp" %>
		</aside>
		
		<section>
			
			<div id="contentTitle">
				쪽지함
			</div>
			
			<div id="content">
				
				<article>
					
						
		
				</article>
			</div>
			
			<div id="page">
				페이지바 영역
			</div>
		
			<div id="search">
				검색 영역
			</div>
		
		</section>
		
		<aside>
			오른쪽 사이드바 : 
			<br> 지금은 여백
			<br> 나중에 광고 넣을 수도 있음
		</aside>
		
	</main>
	
	
	<footer>
		푸터 영역
	</footer>


</body>
</html>