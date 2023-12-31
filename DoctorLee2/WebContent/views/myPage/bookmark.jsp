<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.member.model.vo.Member,com.kh.DoctorLee.hospital.model.vo.Hospital" %>
<%@ page import="java.util.ArrayList,com.kh.DoctorLee.mpBoard.model.vo.Bookmark" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//Member loginUser = (Member)session.getAttribute("loginUser");
	//Hospital hos = (Hospital)request.getAttribute("hos");
	//ArrayList<Bookmark> list = (ArrayList<Bookmark>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 즐겨찾기</title>

	<link rel="stylesheet" href="resources/css/myPage/bookmark.css">
	
</head>
<body>
	<jsp:include page="../common/navi.jsp"/>
	
		<div id="bookmark">
			<div id="area">
				<%@ include file="../common/myPageNavi.jsp" %>
			 <% //System.out.println(loginUser1);%>
			</div>
			<div id="bookmark-main-area">
				<h3 >${sessionScope.loginUser.memName }님의 즐겨찾기</h3>
				<br><hr><br><br>
				<table id="bk-info">
					<c:choose>
					<c:when test="${empty requestScope.list }">
					
					<thead>
						<tr>
							<th>병원이름</th>
						</tr>
						
					</thead>
					<tbody>
						
							<tr>
							<th>즐겨찾기 목록이 없습니다</th>
							</tr>
						
					</tbody>
					</c:when>
					<c:otherwise>
					<thead>
						<tr>
							<th>병원이름</th>
						</tr>
						
					</thead>
					<% for(Bookmark bk : list){ %>
					<tbody>
						
						
						<tr>
							<td><input type="radio" value="<%= bk.getHospitalName() %>" name="bookmark"><%= bk.getHospitalName() %></td>
							
						</tr>
						
					</tbody>
					</c:otherwise>
					</c:choose>
				</table>
					
				<%} %>
				<hr>
				<div id="insertBk">
					<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_A32B41EB090AC3DCA70DEA8131E49CDB.jpg&type=l340_165" alt="즐겨찾기 이미지" ><br>
					<a href="<%=contextPath%>/enrollForm.bk">즐겨찾기 추가</a>
					<button type="submit" id="deleteBtn">즐겨찾기 삭제</button>
					
				</div>
					
				
			</div>
		</div>
		
	
	
		<script>
			$(function(){
				$('#deleteBtn').click(function(){
					str='';
					$('input[name=bookmark]').filter(':checked').each(function(){
						str += $(this).val() + '';
						const cn = str;
						const mno = ${sessionScope.loginUser.memNo};
						
						location.href="<%=contextPath%>/del.bm?cn="+cn+"&mno="+mno;
					});
					
				});
			})
		</script>
		<form>
			<input type="hidden" name = "cn" id=cn>
			<input type="hidden" name = "mno" id=mno>
		</form>
	<%@ include file="../common/footer.jsp" %>
	

</body>
</html>