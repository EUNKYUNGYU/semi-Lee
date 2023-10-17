<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.hospital.model.vo.*, java.util.ArrayList, com.kh.DoctorLee.reservation.model.vo.*" %>
<%
	Hospital hos = (Hospital)request.getAttribute("hos");
	ArrayList<Doctor> docList = (ArrayList<Doctor>)request.getAttribute("docList");
	Reservation rsvt = (Reservation)request.getAttribute("selectRsvt");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
    
    <script>
		var hosNo = location.search.substring(5);
        var rsvt_date = '';
        var guest_rsvt_date = '';
		
   		document.addEventListener('DOMContentLoaded', function() {
    	
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          locale: 'ko',
          firstDay: 1,
          headerToolbar: {
        	  left: 'prev',
        	  center: 'title',
        	  right: 'next'
          },
          dateClick: function(info){
        	  info.dayEl.style.backgroundColor = 'rgba(79, 137, 255, 0.4)';
        	  rsvt_date = info.dateStr;
        	  // console.log(info.dateStr);
			}

        });
          
        calendar.render();
        
        var calendarGuest = document.getElementById('calendarGuest');
        var calendarG = new FullCalendar.Calendar(calendarGuest, {
          initialView: 'dayGridMonth',
          locale: 'ko',
          firstDay: 1,
          headerToolbar: {
        	  left: 'prev',
        	  center: 'title',
        	  right: 'next'
          },
          dateClick: function(info){
        	  info.dayEl.style.backgroundColor = 'rgba(79, 137, 255, 0.4)';
        	  guest_rsvt_date = info.dateStr;
			}

        });
          
        calendarG.render();
      });
    	
      
    </script>
<style>
	  .hos_wrap{margin: auto;}
	  .hos_wrap > div{ float: left;}
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
			<% if(hos.getHosInfo() == null){ %>
				<p style="color: grey; font-size: 15px;">
					해당 병원의 소개글이 없습니다.
				</p>
			<%} else {%>
				<p>
					<%= hos.getHosInfo() %>
				</p>
			<%} %>
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
			
			<!-- <form action="hosRsvt.mem" method="post" id="rsvt_form"> -->
				<table id="rsvt_form">
					<tr>
						<th>예약시간</th>
						<td>
							<select name="rsvtH">
								<% for(int i = 8; i <= 22; i++) { %>
									<option value="<%= i %>">
										<%= i %>시
									</option>
								<% } %>
							</select>
							<select name="rsvtM">
								<option>00분</option>
								<option>30분</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>예약자명</th>
						<td>
							<input type="text" name="rsvtName" required>
						</td>
					</tr>
					<tr>
						<th>특이사항</th>
						<td>
							<input type="text" name="rsvtInfo">
						</td>
					</tr>
					<tr>
						<th>의료진</th>
						<td>
							<select name="rsvtDoc">
								<% for(Doctor d : docList){ %>
									<option value="<%= d.getDocNo() %>">
										<%= d.getDocName() %>
									</option>
								<%} %>
							</select>
						</td>
					</tr>			
				</table>

				<div id="rsvt_btn">
					<% if(loginUser != null) { %>
						<button onclick="rsvt();"
						class="btn btn-primary"
						data-toggle="modal" data-target="#rsvtModal">예약접수</button>
					<% } else{ %>
						<button onclick="loginUserIsNull();" class="btn btn-primary">예약접수</button>
					<% } %>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#guestRsvtModal">
					  비회원 진료예약
					</button>
					<script>
					/*
						var rsvtH = $('select[name=rsvtH] option:selected').text();
						var rsvtm = $('select[name=rsvtM] option:selected').text();
						
						rsvtH = rsvtH.replaceAll('\n', '');
						rsvtM = rsvtM.replaceAll('\t', '');
						var rsvt_time = rsvtH + rsvtM;
					*/
					
					function loginUserIsNull(){
						alert('로그인 후 이용 가능한 서비스');
						location.href = '<%= contextPath %>/login.me';
						
					};
					
					function rsvt(){
						
			        	 $.ajax({
			        		 url: 'hosRsvt.mem',
			        		 type: 'post',
			        		 // async : true,
			        		 data: {
			        			 rsvtDate: window.rsvt_date,
			        			 rsvtH: $('select[name=rsvtH] option:selected').text(),
			        			 rsvtM: $('select[name=rsvtM] option:selected').text(),
			        			 rsvtName: $('input[name=rsvtName]').val(),
			        		     rsvtInfo: $('input[name=rsvtInfo]').val(),
			        		     rsvtDoc: $('select[name=rsvtDoc] option:selected').val(),
			        		     hno: hosNo
			        		 },
			        		 success: function(result){
			        			 console.log(result);
			        			 // console.log(typeof(info.dateStr));
			        			 // console.log(new Date());
			        			 // console.log(rsvt_date);
			        			 //console.log(rsvtDate);
			        			 // var rsvtTime = result['rsvtTime'].replaceAll('\t', '');
			        			 // console.log(rsvtTime);
			        			 if(result != null){
				        			 $('#rsvtModal .modal-title').children().eq(0).filter('b').text(result['rsvtName']);
				        			 $('#rsvtModal .modal-body').children().eq(0).append(result['rsvtNo']);
				        			 $('#rsvtModal .modal-body').children().eq(1).append(result['rsvt_date'] + "," + result['rsvtTime']);
			        			 }/*
			        			 if(result['rsvtInfo'] != ""){
			        				 $('#rsvtModal .modal-body').children().eq(3).append(result['rsvtInfo']);
			        			 } else{
			        				 $('#rsvtModal .modal-body').children().eq(3).remove();
			        			 }
			        			 */
			        			 
			        		 },
			        		 error: function(){
			        			 alert('현재 예약 불가');
			        			 // console.log(hosNo);
			        			 // console.log(rsvt_date);
			        			 // console.log(hosNo);
			        			 console.log(rsvtDate);
			        		 }
			        	 });
					}
					
					</script>
				</div>
				

			<!-- 회원 예약 확인 팝업 -->
			<div class="modal" id="rsvtModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">
			        	<b></b>님의 예약이 완료되었습니다.
			        </h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
			        	<h5>
			        		예약번호 : 
			        	</h5>
			        	<h6>
			        		예약시간 :
			        	</h6>
			        	<span>
			        		특이사항 : 
			        	</span>
			      </div>
			
			
			    </div>
			  </div>
			</div>
			
			<!-- 비회원 예약 모달 -->
			<div class="modal" id="guestRsvtModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">비회원 진료 예약</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			    <div class="modal-body">
			    
       			<div id="calendarGuest" height="500px;"></div>
			
				<table id="rsvt_form">
					<tr>
						<th>예약시간</th>
						<td>
							<select name="guest_rsvtH">
								<% for(int i = 8; i <= 22; i++) { %>
									<option value="<%= i %>">
										<%= i %>시
									</option>
								<% } %>
							</select>
							<select name="guest_rsvtM">
								<option>00분</option>
								<option>30분</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>예약자명</th>
						<td>
							<input type="text" name="guest_rsvtName" required>
						</td>
					</tr>
					<tr>
						<th>특이사항</th>
						<td>
							<input type="text" name="guest_rsvtInfo">
						</td>
					</tr>
					<tr>
						<th>의료진</th>
						<td>
							<select name="guest_rsvtDoc">
								<% for(Doctor d : docList){ %>
									<option value="<%= d.getDocNo() %>">
										<%= d.getDocName() %>
									</option>
								<%} %>
							</select>
						</td>
					</tr>			
				</table>
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button onclick="guestRsvt();"
						class="btn btn-primary"
						data-toggle="modal" data-target="#rsvtModal">예약접수</button>
			        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			      </div>
				  <script>
				  
					  function guestRsvt(){
				        	 $.ajax({
				        		 url: 'hosRsvt.guest',
				        		 type: 'post',
				        		 data: {
				        			 rsvtDate: rsvt_date,
				        			 rsvtH: $('select[name=guest_rsvtH] option:selected').text(),
				        			 rsvtM: $('select[name=guest_rsvtM] option:selected').text(),
				        			 rsvtName: $('input[name=guest_rsvtName]').val(),
				        		     rsvtInfo: $('input[name=guest_rsvtInfo]').val(),
				        		     rsvtDoc: $('select[name=guset_rsvtDoc] option:selected').val(),
				        		     hno: hosNo
				        		 },
				        		 success: function(result){
				        			 console.log(result);
				        			 console.log(hosNo);
				        		 },
				        		 error: function(){
				        			 alert('현재 예약 불가');
				        		 }
				        	 });
						}
				  
				  </script>
			    </div>
			  </div>
			</div>
			
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
	<br clear="both">
	<footer id="footerWrap">
    <%@ include file="../common/footer.jsp" %>
	</footer>

</body>
</html>