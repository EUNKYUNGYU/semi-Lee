<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList,com.kh.DoctorLee.medicine.model.vo.Medicine,com.kh.DoctorLee.member.model.vo.Member" %>
<%
	ArrayList<Medicine> medList = (ArrayList<Medicine>)request.getAttribute("medList");
	Member loginUser = (Member)session.getAttribute("loginUser");
	String medName = request.getParameter("medName");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dd</title>
<link rel="stylesheet" href="resources/css/medicine/medicine.css">
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	
	<h2 align="center">약품 검색 페이지 </h2> <br><hr>
		
		<div id="search-form">	
			<br>
			
			<%
				System.out.println(medName); //검색한 약품 이름이 뭔지 확인하기 위함. 아무것도 안치면 공백으로 감
			%>
			
			<h3>검색하실 약품 이름을 입력해주세요</h3> <br>	
			<form action="<%=contextPath%>/select.med" id="search-form" method="post">
			<input type="text" name="medName" id="medName" >
			<button type="submit" id="search">검색</button><br><br>
			<table id="text-area1" class="medList-area">
				<thead>
				<tr>
					<th>검색된 약품 이름</th>
				</tr>
				<tbody>
				<% if(medList.isEmpty()|| medName.isEmpty() || medName.equals(" ")){%>
				<tr>
					<td>검색된 목록이 없습니다.</td>
				</tr>
				<% } else {%>
				<% for (Medicine med : medList){ %>
					<tr>
						<td align = "center"><%= med.getMedName() %></td>
					</tr>
				<%}%>
				
				<%}%>
				<br><br>
				
				</tbody>
			</table>
			</form>
			<%if(loginUser.getMemId().equals("admin")){ %>
					<a href="<%=contextPath%>/enrollForm.med" class="insert-med">약품 추가하기 </a>
				<%} %>
		</div>
		
		<script>
			$(function(){
				$('.medList-area>tbody>tr').click(function(){
					const mname = $(this).children().eq(0).text();
					//console.log(mname);
    				location.href="<%=contextPath%>/detail.med?mname="+ mname;
				})
			});
		</script>
		<form>
			<input type="hidden" name = "mname" id=mname>
		</form>
		<%@ include file="../common/footer.jsp" %>

</body>
</html>