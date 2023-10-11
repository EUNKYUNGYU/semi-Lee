<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.hospital.model.vo.Hospital" %>
<%
	Hospital hos = (Hospital)request.getAttribute("hos");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
    <script>

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          locale: 'ko',
          firstDay: 1,
          titleFormat: function (date) {
            year = date.date.year;
            month = date.date.month + 1;

            return year + "년 " + month + "월";
          },
          headerToolbar: {
        	  left: 'prev',
        	  center: 'title',
        	  right: 'next'
          },
          expandRows: true
        });
        calendar.render();
      });

    </script>
<style>
	  .hos_wrap{margin: auto;}
	  
	  #hos_info, #hos_rsvt, #hos_review{
	  	display: inline-block; 
	  	width: 30%;
	  	margin: 0 20px;
	  	}
	  
	  #hos_info{}
	  #hos_info>h3{color: #1E376F; display: inline-block;}
	  #hos_info>span{color: #000; display: inline-block; margin-left: 25px; font-weight: bold;}
	  #hos_info>p{margin-bottom: 30px;}
	  #hos_info h4{font-size: 15px;}
	  
	  #hos_rsvt{}
	  
	  #hos_review{}
		
	  #star a{color: gray; font-size: 3rem; text-decoration: none;}
	  #star a.on{color: yellow; font-size: 3rem;}
  
</style>
<title>병원 상세</title>
</head>
<body>
    <%@ include file="../common/nav2.jsp" %>
	<br><br><br><br>
    <!-- 병원 상세페이지 -->
	<div class="hos_wrap">
        
        <!-- 병원 정보 -->
        <div id="hos_info">
			
			<h3><%= hos.getHosName() %></h3><span><%= hos.getTreatDep() %></span>
			
			<!-- 현재 대기자 5명 -->
			
			<p>
				<%= hos.getHosInfo() %>
			</p>
			
			<div id="hos_info_address">
				<div class="icon">
					<b><i class="fa-solid fa-location-dot"></i></b>
				</div>
				<h4>
					<%= hos.getHosAddress() %>
				</h4>
			</div>
			<div id="hos_info_date">
				<div class="icon">
					<b><i class="fa-solid fa-clock"></i></b>
				</div>
				<h4>
					- 진료일자 :  <%= hos.getTreatDate() %> 
				</h4>
				<h4>
					- 진료시작 : <%= hos.getTreatBegin() %>
				</h4>
				<h4>
					- 진료마감 : <%= hos.getTreatEnd() %>
				</h4>
			</div>
			<div id="hos_info_tel">
				<div class="icon">
					<b><i class="fa-solid fa-phone"></i></b>
				</div>
				<h4>
					<%= hos.getHosTel() %>
				</h4>
			</div>
			
        </div>

        <!-- 진료 예약 -->
        <div id="hos_rsvt">
				
			<div id="calendar"></div>
			<form action="" method="post" id="rsvt_form">
				<table>
					<tr>
						<th>예약시간</th>
						<td>
							<select name="rsvt_time">
								<% for(int i = 8; i <= 22; i++) { %>
									<option>
										<%= i %>시
									</option>
								<% } %>
							</select>
						</td>
					</tr>
					<tr>
						<th>예약자명</th>
						<td>
							<input type="text" name="">
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<input type="text" name="">
						</td>
					</tr>
					<tr>
						<th>특이사항</th>
						<td>
							<input type="text" name="">
						</td>
					</tr>
					<tr>
						<th>의료진</th>
						<td>
							<select name="rsvt_doc">
								<option>길동이</option>
							</select>
						</td>
					</tr>			
				</table>

				<div id="rsvt_btn">
					<% if(loginUser != null) { %>
						<button type="submit" class="btn btn-primary">예약접수</button>
					<%} else{ %>
						<button type="submit" class="btn btn-primary" disabled>예약접수</button>
					<%} %>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
					  비회원 진료예약
					</button>
					
				</div>
				
			</form>
			
			
			</div>
			<!-- 진료 예약 끝 -->
				


		<!-- 병원 리뷰 -->
		<div id="hos_review">
			  
			 
			 <p id="star">
			 	<a href="#none" value="1">★</a>
			 	   <a href="#none" value="2">★</a>
				   <a href="#none" value="3">★</a>
				   <a href="#none" value="4">★</a>
				   <a href="#none" value="5">★</a>
			 </p>

			<script>
				$('#star a').click(function(){
					$(this).parent().children('a').removeClass('on');
					$(this).addClass('on').prevAll('a').addClass('on');
					//console.log($(this).attr('value'));
				})
			 </script>
		
				<table>
				
					<tr>
						<td>후기 내용</td>
						<td>후기 작성자</td>
					</tr>
				
				</table>
		
		
		</div>
		
		
		
		
	</div>
	<!-- 랩 끝 -->

    <%@ include file="../common/footer.jsp" %>

</body>
</html>