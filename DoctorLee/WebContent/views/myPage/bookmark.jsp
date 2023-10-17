<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.member.model.vo.Member,com.kh.DoctorLee.hospital.model.vo.Hospital" %>
<%@ page import="java.util.ArrayList,com.kh.DoctorLee.mpBoard.model.vo.Bookmark" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Hospital hos = (Hospital)request.getAttribute("hos");
	ArrayList<Bookmark> list = (ArrayList<Bookmark>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 즐겨찾기</title>
<style>
	div{
		box-sizing : border-box;
	}
	#bookmark{
		width : 1000px;
		height : 900px;
		margin : auto;
	}
	#bookmark_main{
		width : 80%;
		height : 100%;
		float : left;
	}
	#bookmark > div{
		height : 100%;
	}
	#bookmark_main > div{
		height : 100%;
		float : left;
	}
	#area{
		width : 20%;
		float : left;
	}
	#bk-info{
		width : 60%;
		margin : auto;
	}
	#bk-info td, #bk-info th{
		
		padding : 8px;
		text-align : center;
	}
	#bk-info th {
		font-size : 23px;
		color : skyblue;
	}
	#insertBk > img{
		margin-top : 50px;
		margin-left : 250px;
	}
	#insertBk > a {
		margin-left : 350px;
		
	}
	.delete {
		margin : auto;
		padding : 0;
		float : left;
		display : inline-block;
		
	}
	.delete:hover{
		cursor : pointer;
	}
	
	
	
	
</style>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	<%// System.out.println(list); %>
	<% if(loginUser == null) {%>
		<form action="<%=contextPath %>/login.me" method="post">
			<button type="submit">로그인하러가기</button>
		</form>
	<% } else { %>
		<div id="bookmark">
			<div id="area">
				<%@ include file="../common/myPageNavi.jsp" %>
			 <% //System.out.println(loginUser1);%>
			</div>
			<div id="bookmark_main">
				<h3 align="center"><%=loginUser.getMemName() %>님의 즐겨찾기</h3>
				<br><hr><br><br>
				<table id="bk-info">
					<% if(list == null){ %>
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
					<%} else{ %>
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
					<%} %>
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
		
	
	<% } %>
		<script>
			$(function(){
				$('#deleteBtn').click(function(){
					str='';
					$('input[name=bookmark]').filter(':checked').each(function(){
						str += $(this).val() + '';
						const cn = str;
						const mno = <%=loginUser.getMemNo()%>;
						console.log(cn);
						console.log(mno);
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