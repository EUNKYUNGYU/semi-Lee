<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.message.model.vo.Message,java.util.ArrayList, com.kh.DoctorLee.common.model.vo.PageInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<% 
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	String type = String.valueOf(request.getAttribute("type"));
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	System.out.println("메세지 리스트뷰에서 type" + type + " list " +list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<link rel="stylesheet" href="resources/css/message/messageListView.css">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>

	<header id="headerMessageListView">
		<%@ include file ="../common/nav2.jsp" %>
	</header> 
	<main>
		<aside id="aside1" class="aside">
			<%@ include file ="../common/cmNavi.jsp" %>
		</aside>
		
		<section id="section">
			
			<div id="contentTitle">
				쪽지함
			</div>
			
			<div id="content">
				<article>
					<div id="typeWrap">
						<a href="<%= contextPath %>/list.ms?cpage=1&memNo=${ loginUser.memNo }&type=receiver" class="messageList">받은 쪽지함&nbsp;&nbsp;</a>
						<a href="<%= contextPath %>/list.ms?cpage=1&memNo=${ loginUser.memNo }&type=sender" class="messageList">보낸 쪽지함</a>
					</div>
					
					<form action="#" method="get">
					<div id="buttonWrap">
						<div id="buttonWrap1">
							<button type="button" class="btn btn-light" id="msgDelButton">삭제
						</div>
						<div id="buttonWrap2">
							<a href="<%= contextPath %>/sendCommon.ms" class="btn btn-primary">쪽지 보내기</a>
						</div>
					</div>
					<hr>
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col"><input type="checkbox" id="allCk"></th>
					      <c:choose>
						      <c:when test="${ 'receiver' eq type }" >
						      	<th scope="col">보낸 사람</th>
						      </c:when>
						      <c:otherwise>
						      	<th scope="col">받는 사람</th>
						      </c:otherwise>
					      </c:choose>
					      <th scope="col">제목</th>
					      <th scope="col">날짜</th>
					    </tr>
					  </thead>
					  
					  <tbody id="messageList">
					  <c:choose>
					  <c:when test="${ empty list }">
					    <tr>
						  <th colspan="4" style="text-align: center">받은 메세지가 없습니다</th>
						</tr>
					 </c:when>
					 <c:otherwise>
					
					  <c:forEach var="m" items="${ requestScope.list }">
					  	<c:choose>
						  	<c:when test="${ m.readStatus eq 'N' }">
								<tr class="notReadStyle">
							</c:when>
							<c:otherwise>
							     <tr>
							</c:otherwise>
						</c:choose>
						      <th><input type="checkbox" class="checkMsg" value="${ m.messageNo }"></th>
						      <c:choose>
							      <c:when test="${ 'receiver' eq type }" >
						      		<td scope="row">${ m.receiver }</td>
							      </c:when>
							      <c:otherwise>
							      	<td scope="row">${ m.sender }</td>
							      </c:otherwise>
					      	</c:choose>
						      <td name="${ m.messageNo }" class="messageTitleTd">${ m.messageTitle }</td>
						      <td>${ m.sendDate }</td>
						    </tr>
						    </form>
					 </c:forEach>
						    
					  </c:otherwise>
					  </c:choose>
					  </tbody>
					</table>
				</article>
			</div>
			
			
			<script>
				$(function(){
					
					console.log($('tr > td').eq(1));
					
					// 제목 클릭 했을 시 메세지 상세보기 페이지로 이동
					$('.messageTitleTd').click(function(){
        				location.href = '<%=contextPath%>/detail.ms?messageNo=' + $(this).attr('name') + '&type=${ type }';
        			});
	        			
					// #allCk 체크시 체크 박스 전체 체크, 해제시 전체 해제
	        		$('#allCk').click(function(){
	        			var allChecked = $('#allCk').is(':checked'); 
	        			if(allChecked) $('input:checkbox').prop('checked',true);
	        			else $('input:checkbox').prop('checked',false);
	        			
	        		});
					
					// 체크 박스 하나라도 선택 해제 시 #allCk 해제
					// 체크 박스 전체 누르면 #allCk 체크
	        		$('.checkMsg').click(function(){
						var allChecked = $('#allCk').is(':checked'); 
						var checkArr = new Array();

						/*
						allCk = checkArr.is(':checked');
						checkArr = $('.checkMsg');
						var tag= [];
					    for (var i = 0; i < checkArr.length; i++) {
					        if (checkArr[i].checked == true) {
					            tag.push(checkArr[i];
					            sum++;
					        }
								console.log(tag);
					    }
	        			
						*/
					});
				
			})
		
			</script>
			
			<div id="page">
				<c:if test="${ pi.currentPage ne 1 }">
			        <button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.ms?cpage=${ pi.currentPage - 1 }&memNo=${ loginUser.memNo }&type=${ type }'">&lt;</button>
			    </c:if>
		         
		       	<c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }">
		        	<c:choose>
		        	<c:when test="${ pi.currentPage ne i }">
		          		<button class="btn btn-light" onclick="location.href='<%= contextPath%>/list.ms?cpage=${ i }&memNo=${ loginUser.memNo }&type=${ type }'">${ i }</button>
		         	</c:when>
		         	<c:otherwise>
		         		<button disabled class="btn btn-default">${ i }</button>
		         	</c:otherwise>
		         </c:choose>
				</c:forEach>		         
		        
		        <c:if test="${pi.currentPage ne pi.maxPage }">
		        <button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.ms?cpage=${ pi.currentPage + 1 }&memNo=${ loginUser.memNo }&type=${ type }'">&gt;</button>
				</c:if>
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