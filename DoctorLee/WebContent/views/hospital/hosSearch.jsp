<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.hospital.model.vo.*, com.kh.DoctorLee.common.model.vo.PageInfo" %>
<%
	ArrayList<Hospital> list = (ArrayList<Hospital>)request.getAttribute("list");
	PageInfo pInfo = (PageInfo)request.getAttribute("pInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/hospital/hosSearch.css">
<title>병원 검색</title>
</head>
<body>
    <%@ include file="../common/nav.jsp" %>

	<!-- 병원 검색 메인페이지 -->
	<div class="sch_wrap">
	
        <!-- 병원 검색창-->
        <aside>

            <form action="hosSch.dy" method="get" id="sch_hos">
                <h3>병원 검색</h3>
				<br>
                <input type="text" name="sch_bar" id="sch_bar">
				
                <button type="submit">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </form>
            
            <script>
            	
            	document.getElementById('sch_bar').addEventListener('keyup', function(e){
            		
            		if(e.keycode == 13){
            			$('sch_hos button').click();
            		}
            	})
            
            
            </script>
            
            <ul class="sch_category">
                <li>
                    <a href="#none">주변 병원 검색</a>
                </li>
                <li>
                    <a href="#none">진료과로 검색</a>
                </li>
                <li>
                    <a href="#none">질병명으로 검색</a>
                </li>
            </ul>

        </aside>
		
		<% if(list.isEmpty()) {%>

		<%} else {%>
        <!-- 병원 리스트 -->
			<% for(Hospital h : list) { %>
	        <div id="hos_list">
	            <div class="hos">
					<!-- 병원 이미지 -->
	                <div class="hos_img">
	                    <img src="https://cdn-icons-png.flaticon.com/512/6743/6743757.png" alt="">
	                </div>
	                
	                <!-- 병원 정보 -->
	                <div class="hos_info">
	                    <h3>
							<%= h.getHosName() %>
						</h3>
	                    <p>
							<%= h.getHosAddress() %>
						</p>
	
	                    <h4>진료중</h4>
	                    <div class="hos_rsvt_btn">
	                        <button onclick="rsvtPage(<%= h.getHosNo()%>);">진료예약</button>
	                    </div>
	                </div>
	           	</div>
			</div>
	        <%} %>
		<%} %>
       	<script>
       	
            function rsvtPage(hno){
                location.href = '<%= contextPath %>/hosDetail.dy?hno=' + hno;
            };

            
       	</script>
       	
		<div id="pageing_bar">
			<!-- http://localhost:8765/DoctorLee/hosSch.dy?search=&hkey=병원 -->
			<% if(pInfo.getCurrentPage() != 1){ %>
				<button onclick="location.href='<%= contextPath %>/hosSch.dy?search=&hkeyP=<%= pInfo.getCurrentPage() + 1 %>'">&lt;</button>
			<%} %>
			<% for(int i = pInfo.getStartPage(); i <= pInfo.getEndPage(); i++) { %>
				<% if((pInfo.getCurrentPage() + 1) != i) {%>
					<button onclick="location.href='<%= contextPath %>/hosSch.dy?search=&hkeyP=<%= i %>'"><%= i %></button>
				<% } else { %>
					<button disabled><%= i %></button>
				<% } %>
			<% } %>
			<% if(pInfo.getCurrentPage() != pInfo.getMaxPage()){ %>
				<button onclick="location.href='<%= contextPath %>/hosSch.dy?search=&hkeyP=<%= pInfo.getCurrentPage() + 1 %>'">&gt;</button>
			<%} %>
		</div>
    
    
    </div>
    <!-- hos_wrap 끝 -->

		<!-- 지도 -->


    <%@ include file="../common/footer.jsp" %>

</body>
</html>