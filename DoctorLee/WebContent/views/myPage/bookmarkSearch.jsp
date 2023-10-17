<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList,com.kh.DoctorLee.hospital.model.vo.Hospital,com.kh.DoctorLee.member.model.vo.Member"%>
<%
 	ArrayList<Hospital> hosList = (ArrayList<Hospital>)request.getAttribute("hosList");
	Member loginUser = (Member)session.getAttribute("loginUser");
 %>
 <style>
 	h3 {
		text-align : center;
	}
	#hosName{
		margin-left : 610px;
		width : 700px;
		height : 30px;
		border-radius : 5px;
		padding : 0;
		
		
		
	}
	#search{
		height : 35px;
		
		
		
		
	}
	#text-area{
		height : 600px;
		border : 1px solid black;
		width : 700px;
		margin-left : 610px;
	}
	#text-area > tbody > tr>td:hover {
		font-size : 20px;
	}
	#text-area td,#text-area th{
		border : 1px solid black;
		padding : 0px;
	}
	#tr> button{
		float :left;
	}
 </style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 후 화면</title>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
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
			<% if(hosList.isEmpty()){ %>
				<tr>
					<td>검색된 목록이 없습니다.</td>
				</tr>
			<%}else {%>
				<% for(Hospital hos : hosList) { %>
					<tr>
						<td align="center" class="searched"><%= hos.getHosName() %></td>
						
					</tr>
			<%}%>
		
		
			<%}%>
			<% System.out.println(loginUser.getMemNo()); %>
				</tbody>
			</table>
		
		</div>
		</form>
		<script>
			$(function(){
				$('#text-area > tbody > tr').click(function(){
					const hn = $(this).children().eq(0).text();
					const mno = <%= loginUser.getMemNo()%>;
					location.href="<%=contextPath%>/insert.bm?hn=" + hn+"&mno="+mno;
					
				})
			});
		</script>
		<form>
			<input type="hidden" name = "hn" id=hn>
			<input type="hidden" name = "mno" id=mno>
		</form>
		<%@ include file="../common/footer.jsp" %>
		
		
</body>
</html>