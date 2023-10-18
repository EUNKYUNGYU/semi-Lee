<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.member.model.vo.Member" %>
<%@ page import="java.util.ArrayList,com.kh.DoctorLee.mpReservation.model.vo.MpReservation" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<MpReservation> list = (ArrayList<MpReservation>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역 홈페이지</title>

<style>
	#rh-table{
			margin-left : 750px;
			margin-bottom : 50px;
			border : 1px solid black;
	}
	#rh-table th{
		padding-top : 12px;
		padding-bottom : 12px;
		text-align : left;
		
	}
	#rh-table th,#rh-table td {
		border : 1px solid black;
		padding : 8px;
	}
	.rh-btn {
		margin-left : 920px;
	}
</style>

</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<h2 align="center"><%=loginUser.getMemName() %>님의 예약 내역 보기</h2><br><hr><br>
	<div id="outer">
		<table id="rh-table">
			<thead>
				<tr>
					<th>예약한 병원</th>
					<th>예약한 날짜</th>
					<th>예약한 시간</th>
					<th>예약한 의사</th>
				</tr>
			</thead>
			
			<tbody>
			<% if(list.isEmpty()){ %>
				<tr>
					<td>공지사항이 존재하지 않습니다.</td>
				</tr>
			<% } else{ %>
				<% for(MpReservation mr : list){ %>
					
					<tr>
						
						<td><%= mr.getRsvtHos() %></td>
						<td><%= mr.getRsvtDate() %></td>
						<td><%= mr.getRsvtTime() %></td>
						<td><%= mr.getRsvtDoc() %></td>
						
					</tr>
				<%} %>
			<%} %>
			</tbody>
		</table>
		<button type="button"  onclick="history.back();" class="rh-btn">뒤로가기</button>
	</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>