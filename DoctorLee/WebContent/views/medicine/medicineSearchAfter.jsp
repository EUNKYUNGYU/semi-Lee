<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList,com.kh.DoctorLee.medicine.model.vo.Medicine" %>
<%
	ArrayList<Medicine> medList = (ArrayList<Medicine>)request.getAttribute("medList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
 <style>
 	h3 {
		text-align : center;
	}
	#medName{
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
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	
	<h2 align="center">약품 검색 페이지 </h2> <br><hr>
		
		<div id="search-form">	
			<br>
			
			<h3>검색하실 약품 이름을 입력해주세요</h3> <br>	
			<form action="<%=contextPath%>/select.med" id="search-form" method="post">
			<input type="text" name="medName" id="medName" >
			<button type="submit" id="search">검색</button><br><br>
			<table id="text-area">
				<thead>
				<tr>
					<th>검색된 약품 이름</th>
				</tr>
				<tbody>
				<% if(medList.isEmpty()){%>
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
				</tbody>
			</table>
			</form>
		
		</div>
		
		<%@ include file="../common/footer.jsp" %>

</body>
</html>