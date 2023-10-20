<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.DoctorLee.quize.model.vo.Quize, java.util.ArrayList, com.kh.DoctorLee.quize.model.vo.QuizeAnswer"%>
    
<% 
	ArrayList<Quize> list = (ArrayList<Quize>)request.getAttribute("list");
	QuizeAnswer answer = (QuizeAnswer)request.getAttribute("answer");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈 정답 확인</title>

<link rel="stylesheet" href="resources/css/quize/quizeDetail.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js">
</script>

</head>
<body>

	<header id="header">
		<%@ include file ="../common/nav2.jsp" %>
	</header>
	
	
	<main>
	
		<aside class="aside" id="aside1">
			<%@ include file ="../common/cmNavi.jsp" %>
		</aside>
		
		<section id="section">
			
			<div id="contentTitle">
				퀴즈 게시판
			</div>
			<div id="content">
				<article>
					<div id="quizeHeader">
						<div id="title"><%= answer.getQuizeTitle() %></div>		
					</div>
					<div id="quizeContent">	
						정답 : <%= answer.getAnswer() %>번 <br>
					</div>
					<div id="quizeFooter">
						<%= answer.getAnswerDetail() %>
					</div>
				
				</article>
			</div>
			<div id="back" align="right">
				<a href="<%= contextPath %>/list.qz?cpage=1" id="backButton" class="btn btn-primary">돌아가기</a>
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