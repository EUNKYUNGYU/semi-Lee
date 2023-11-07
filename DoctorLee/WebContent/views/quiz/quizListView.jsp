<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kh.DoctorLee.quiz.model.vo.Quiz,java.util.ArrayList, com.kh.DoctorLee.common.model.vo.PageInfo"%>
    
<% 
	ArrayList<Quiz> list = (ArrayList<Quiz>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈게시판</title>
<link rel="stylesheet" href="resources/css/quiz/quizListView.css">
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
			
			<!-- 퀴즈가 없을 경우 -->
			<c:choose>
			<c:when test="${ empty list }">
				<div id="content">
					<article>
						퀴즈가 존재하지 않습니다.
					</article>				
				</div>
			</c:when>	
			
			<c:otherwise>	
			<!-- 퀴즈가 있을 경우 반복문으로 출력 -->
			<c:forEach var="q" items="${ requestScope.list}">		
				<div id="content">
				
				<article>
					<div id="quizHeader">
						<div id="title">${ q.quizTitle }</div>
						<div id="vote">${ q.vote }명 투표 중</div>
						
						<div id="deadline">
						<!-- 퀴즈의 제출 기한이 지난 경우 -->
						<c:choose>
						<c:when test="${ q.deadline lt 0 }">
							기한 종료
						</c:when>
						<c:otherwise>
						<!-- 퀴즈의 제출 기한이 남은 경우, 몇 일 남았는지 보이게 -->
							${ q.deadline }일 남음
						</c:otherwise>
						</c:choose>
						</div>
					</div>
					
					<form method="post" action="<%= contextPath %>/choice.qz">
					<div id="quizContent">
					${ q.quizContent }
						
					<br><br>
					<input type="radio" name="choice" value="1" id="choice1" checked> 
					<label for="choice1">${ q.choice1 }</label><br> 
					<input type="radio" name="choice" value="2" id="choice2"> 
					<label for="choice2">${ q.choice }</label><br> 
					<input type="radio" name="choice" value="3" id="choice3"> 
					<label for="choice3">${ q.choice3 }</label><br> 
					<input type="radio" name="choice" value="4" id="choice4"> 
					<label for="choice4">${ q.choice4 }</label><br> 
					</div>
					
					<!-- 퀴즈 정답 제출 / 정답 확인하기 버튼-->		
					<div id="quizFooter">
							
						<div id="quizFooter1">
						<!-- 1. 로그인을 했을 때만 답 제출 가능 -->
						<c:choose>
						<c:when test="${ loginUser ne null }">
							
							<c:choose>
							<c:when test="${ q.deadline lt 0 }">
							<!-- 2. 퀴즈 제출 기한이 아닐 경우 alert('퀴즈 제출 기한이 아닙니다.') -->
								<a class="btn btn-primary" href='javascript:void(0);' onclick="alert('퀴즈 제출 기한이 아닙니다.');">제출</a>
							
							<!-- 
								2. 퀴즈 제출 기한일 경우만 제출 가능
								- 답안을 낸 적이 없다면 -> 제출 가능 -> 정답일 경우 : 500포인트 획득
														 -> 오답일 경우 : 포인트 획득 실패
								- 답안을 낸 적이 있다면 -> 제출 불가능	
								위의 과정을 choice.qz(QuizChoiceController)에서 수행
							-->
							</c:when>
							<c:otherwise>
								<button type="submit" id="quizButton1" class="quizButton1 btn btn-primary">제출
								<input type="hidden" id="memNo" name="memNo" value="${ loginUser.memNo }">
								<input type="hidden" id="quizNo" name="quizNo" value="${ q.quizNo }">
							</c:otherwise>
							</c:choose>
								
						</c:when>
						<c:otherwise>
						<!-- 1. 로그인 안 했을 경우 제출 버튼 눌렀을 시 alert('로그인 후 이용 가능합니다.') -->
								<button type="button" id="quizButton2" class="quizButton2 btn btn-primary" >제출
					   	</c:otherwise>
					   	</c:choose>
						</div>	
					</form>
				   	
							
					<div id="quizFooter2">
						<!-- 1. 로그인하지 않았을 경우 정답 확인하기 버튼을 눌렀을 때 확인 불가능 -->
						<c:choose>
							<c:when test="${ loginUser eq null }">
									<a href='javascript:void(0);' onclick="alert('로그인 후 이용 가능합니다.');"
									class="buttonAnswerCheck">정답 확인하기 &gt;</a>
							
							<!-- 1. 로그인 했을 경우 
								- 제출 기한이 지나지 않았다면 answerExist.qz(QuizAnswerExistController)에서 정답을 제출한 적이 있는지 확인 후
									- 제출 한 적 있다면 : quizDetail.jsp로 포워딩하여 답을 보여줌
									- 제출 한 적 없다면 : alert('답을 먼저 제출해주십시오')
								- 제출 기한이 지났을 경우 퀴즈 답을 제출 한적 없더라도 답을 보여줌
							 -->
							 </c:when>
							 <c:otherwise>
								<!-- 2. 제출 기한 지남 -->
								<c:choose>
								<c:when test="${ q.deadline lt 0 }">
									<a href="<%= contextPath %>/answerExist.qz?qno=${ q.quizNo }&memNo=${ loginUser.memNo }&due=false"
									class="buttonAnswerCheck">정답 확인하기 &gt;</a>
								</c:when>
								<c:otherwise>	
								<!-- 2. 제출 기한이 남은 경우-->
									<a href="<%= contextPath %>/answerExist.qz?qno=${ q.quizNo }&memNo={ loginUser.memNo }&due=true"
									class="buttonAnswerCheck">정답 확인하기 &gt;</a>
								</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				</article>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</div>
			
			<div id="page">
				<div id="upWrap">
					<a href="#header" class="btn btn-light">^</a>
				</div>
			</div>
			
			
			<script>
			
			  $(function(){
				  
			      $('.quizButton2').click(function(){
			    	  alert('로그인 후 이용 가능합니다.');
			      });   
							
			 });
			  
			</script>
			
			<div id="page">
				<c:if test="${ pi.currentPage ne 1 }" >
		        	<button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.qz?cpage=${ pi.currentPage - 1 }'">&lt;</button>
				</c:if>	         
		       
		       <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }" >
		       <c:choose>
		       		<c:when test="${ pi.currentPage ne i }"> 
		          		<button class="btn btn-light" onclick="location.href='<%= contextPath%>/list.qz?cpage=${ i }'">${ i }</button>
		         	</c:when>
		         	<c:otherwise>
		         		<button disabled class="btn btn-default">${ i }</button>
		         		</c:otherwise>
		        </c:choose>
		         </c:forEach>
		         <c:if test="${ pi.currentPage ne pi.maxPage }" >
		        <button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.qz?cpage=${ pi.currentPage + 1 }'">&gt;</button>
				</c:if>
			</div>
		</section>
		
		<aside class="aside" id="aside2">
		</aside>
		
	</main>
	<br clear="both">
	
	<footer>
		<%@ include file ="../common/footer.jsp" %>
	</footer>


</body>
</html>