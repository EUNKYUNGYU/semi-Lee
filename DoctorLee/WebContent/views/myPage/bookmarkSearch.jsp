<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList,com.kh.DoctorLee.hospital.model.vo.Hospital,com.kh.DoctorLee.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 	
	String contextPath = request.getContextPath();
 %>

<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="resources/css/myPage/bookmark.css">
<meta charset="UTF-8">
<title>검색 후 화면</title>
</head>
<body>
	<jsp:include page="../common/navi.jsp"/>
	
	<%// System.out.println(hosList); %>
	
	<h2 align="center">병원 즐겨찾기 페이지 </h2> <br><hr>
		
		<div id="search-form">	
			<br>
			<form action="<%=contextPath %>/selectHos.mk" id="insert-form" method="post">
			<h3>검색하실 병원 이름을 입력해주세요</h3> <br>	
			<input type="text" name="hosName" id="hosName" >
			<button type="submit" id="search">검색</button><br><br>
			<table id="text-area">
				<thead>
				<tr>
					<th>검색된 병원 이름</th>
				</tr>
				<tbody>
			<c:choose>
			<c:when test="${empty requestScope.hosList || empty requestScope.hosName || requestScope.hosname eq ' ' }">
			
				<tr>
					<td>검색된 목록이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${requestScope.hosList}" var="h">
				
					<tr>
						<td align="center" class="searched">${h.hosName}</td>
						
					</tr>
				</c:forEach>
		
		
			
			</c:otherwise>
			</c:choose>
				</tbody>
			</table>
		
		</div>
		</form>
		<script>
			$(function(){
				$('#text-area > tbody > tr').click(function(){
					const hn = $(this).children().eq(0).text();
					const mno = ${sessionScope.loginUser.memNo};
					location.href="<%=contextPath%>/insert.bm?hn=" + hn+"&mno="+mno;
					
				})
			});
		</script>
		<form>
			<input type="hidden" name = "hn" id=hn>
			<input type="hidden" name = "mno" id=mno>
		</form>
		<jsp:include page="../common/footer.jsp"/>
		
		
		
</body>
</html>