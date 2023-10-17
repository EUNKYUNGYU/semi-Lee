<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.hospital.model.vo.*, java.util.ArrayList, com.kh.DoctorLee.reservation.model.vo.*, com.kh.DoctorLee.review.model.vo.*" %>
<%
	Hospital hos = (Hospital)request.getAttribute("hos");
	ArrayList<Doctor> docList = (ArrayList<Doctor>)request.getAttribute("docList");
	ArrayList<Review> reviewList = (ArrayList<Review>)request.getAttribute("reviewList");
	//Reservation rsvt = (Reservation)request.getAttribute("selectRsvt");
	
	int hosTreatBegin = Integer.parseInt(hos.getTreatBegin().replaceAll(":00", ""));
	int hosTreatEnd = Integer.parseInt(hos.getTreatEnd().replaceAll(":00|:30", ""));
	
	//int checkRsvtResult = (int)request.getSession().getAttribute("checkRsvtResult");
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
<style>

	.hos_wrap{margin: auto;}
	.hos_wrap > div{float: left;}
	.box{float: left;}
	
	#hos_info, #hos_rsvt, #hos_review{
		display: inline-block;
		width: 30%;
		margin: 0 10px 30px 20px;
		}
	
	#hos_info{}
	#hos_info>h2{color: #1E376F; display: inline-block;}
	#hos_info>span{color: #000; display: inline-block; margin-left: 25px; font-weight: bold;}
	#hos_info>p{margin-bottom: 30px;}
	#hos_info h4{font-size: 18px;}
	#hos_info i{font-size: 25px;}
	#hos_info div{margin-bottom: 20px;}
	
	#hos_rsvt{}
	#rsvt_btn{width: 100%; text-align: center;}
	#rsvt_btn>button{width: 45%;}
	
	#hos_review{}
	#hos_review>table{text-align: center; margin-bottom: 20px;}
	
	#star{text-align: center;}
	#star input{display: none;}
	#star label{font-size: 3rem;}
	
	#review_btn>button{width: 100%;}
	#review_box>input{width: 100%; margin-bottom: 20px;}

       .yellow {
           color: yellow;
       }
       
  	 #star label:hover{
    	text-shadow: 0 0 0 #f0f0f0; /* 마우스 호버 */
	}
	#star label:hover ~ label{
	    text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
	}
	#star input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */	
	}
	

</style>
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
     	  console.log(this);
     	  console.log(info);
     	  
     	  /*
          $(this).on('click', function (e) { 
              $(this).css("background-color", '#FFFFFF'); //기존 이벤트제목 배경색 투명처리.
              $(this).css("background-color", '#F3F781'); 
            });
     	  */
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
     	 
	}

     });
       
     calendarG.render();
   });
 	
   
</script>
<title>병원 상세</title>
</head>
<body>
    <%@ include file="../common/nav2.jsp" %>
	<br><br><br><br>
    <!-- 병원 상세페이지 -->
	<div class="hos_wrap">
        
        <!-- 병원 정보 -->
        <div id="hos_info">
			
			<h2><%= hos.getHosName() %></h2><span><%= hos.getTreatDep() %></span>
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
					<i class="fa-solid fa-location-dot"></i>
				</div>
				<h4>
					<%= hos.getHosAddress() %>
				</h4>
			</div>
			<div id="hos_info_date">
				<div class="icon">
					<i class="fa-solid fa-clock"></i>
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
					<i class="fa-solid fa-phone"></i>
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
				<table id="rsvt_form" class="table table-bordered">
					<tr>
						<th>예약시간</th>
						<td>
							<select name="rsvtH">
								<% for(int i = hosTreatBegin; i <= hosTreatEnd; i++) { %>
									<option>
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
							<% if(docList.isEmpty()){ %>
								<option>
									등록된 의료진이 없습니다.
								</option>
							<%} else {%>
							<% for(Doctor d : docList){ %>
								<option value="<%= d.getDocNo() %>">
									<%= d.getDocName() %>
								</option>
								<%} %>
							<%} %>
							</select>
						</td>
					</tr>			
				</table>

				<div id="rsvt_btn">
					<% if(loginUser != null) { %>
						<button onclick="return rsvt();"
						class="btn btn-primary">예약접수</button>
					<% } else{ %>
						<button onclick="loginUserIsNull();" class="btn btn-primary">예약접수</button>
					<% } %>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#guestRsvtModal">
					  비회원 진료예약
					</button>
					<script>
						function loginUserIsNull(){
							alert('로그인 후 이용 가능한 서비스');
							location.href = '<%= contextPath %>/login.me';
							
						};
						
						/*
						var rsvt = {
							date: window.rsvt_date,
							h: $rsvtH,
							mi: $rsvtM,
							name: $('input[name=rsvtName]').val(),
							info: $('input[name=rsvtInfo]').val(),
							doc: $('select[name=rsvtDoc] option:selected').val(),
							hno: hosNo
						}
						console.log(rsvt);
						*/
						
						function rsvt(){
							
							var str = '';
							if(window.rsvt_date == str){
								alert('날짜를 선택해주세요.');
								
							} else if($('input[name=rsvtName]').val() == str){
								alert('예약자명을 입력해주세요');
								
							} else {
								$.ajax({
									url: 'hosRsvt.mem',
									type: 'post',
									// async : true,
									data: {
										rsvtDate: window.rsvt_date,
										rsvtH: $('select[name=rsvtH] option:selected').text().replaceAll('\t', '').replaceAll('\n', ''),
										rsvtM: $('select[name=rsvtM] option:selected').text().replaceAll('\n', '').replaceAll('\t', ''),
										rsvtName: $('input[name=rsvtName]').val(),
										rsvtInfo: $('input[name=rsvtInfo]').val(),
										rsvtDoc: $('select[name=rsvtDoc] option:selected').val(),
										hno: hosNo
									},
									success: function(result){
										console.log(result);
										
										var check = <%= request.getAttribute("checkRsvtResult") %>;
										console.log(check);
										
										if(check > 0){
											alert('다른 날짜(시간)를 선택해주세요');
											
										} else{
										
											if(result != null){
												
												$('#rsvtModal').modal('show');
												$('#rsvtModal .modal-title').children().eq(0).filter('b').text(result['rsvtName']);
												$('#rsvtModal .modal-body').children().eq(0).append(result['rsvtNo']);
												$('#rsvtModal .modal-body').children().eq(1).append(result['rsvtDate'] + "," + result['rsvtTime']);
											}
										}
										// 성공 시 
										//data-toggle="modal" data-target="#rsvtModal" 추가해서 모달 띄우기
									},
									error: function(){
										alert('현재 예약 불가');
										// console.log(hosNo);
										// console.log(rsvt_date);
										// console.log(hosNo);
										// console.log(rsvtDate);
									}
								});
								return false;
							}
							return true;
					}
					
					function loginUserIsNull(){
						alert('로그인 후 이용 가능한 서비스');
						location.href = '<%= contextPath %>/login.me';
						
					};
					
	
					
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
			      <div class="modal-footer">
			        <button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
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
			    
       			<div id="calendarGuest" height="400px;"></div>
			
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
									<% if(d.getDocName() == null){ %>
										<option>
											등록된 의료진이 없습니다.
										</option>
									<%} else {%>
									<option value="<%= d.getDocNo() %>">
										<%= d.getDocName() %>
									</option>
									<%} %>
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
				
			    </div>
			  </div>
			</div>
			
		</div>
		<!-- 진료 예약 끝 -->

		<!-- 병원 리뷰 -->
		<div id="hos_review">
		
			  <!-- a태그에 value속성 못씀 -->
			 <div id="star">
		 	    <input type="radio" id="star1" class="star_input" value="1">
		 	   	<label for="star1" class="star_label">★</label>
		 	   	
		 	    <input type="radio" id="star2" class="star_input" value="2">
		 	   	<label for="star2" class="star_label">★</label>
		 	   	
		 	   	<input type="radio" id="star3" class="star_input" value="3">
		 	   	<label for="star3" class="star_label">★</label>
		 	   	
		 	   	<input type="radio" id="star4" class="star_input" value="4">
		 	   	<label for="star4" class="star_label">★</label>
		 	   	
		 	   	<input type="radio" id="star5" class="star_input" value="5">
		 	   	<label for="star5" class="star_label">★</label>
			</div>
			
			<div id="review_box">
				<input type="text" maxlength="500" placeholder="후기 내용을 입력해주세요.">
			</div>
			
			<script>
				$('.star_label').click(function(){
					$(this).removeClass('.yellow');
					$(this).prevAll('yellow').addClass('yellow');
					//console.log($(this).attr('value'));
				});

			 </script>
		
				<table class="table table-bordered">
				
					<tr>
						<td>후기 내용</td>
						<td>후기 작성자</td>
					</tr>
					<% if(reviewList.isEmpty()) { %>
						<tr>
							<td colspan="2">해당 병원의 후기가 존재하지 않습니다.</td>
						</tr>
					<% } else{ %>
						<% for(Review r : reviewList){ %>
							<tr>
								<td><%= r.getContent() %></td>
								<% if(r.getReviewWriter() == null){ %>
									<td>USER</td>
								<%} else { %>
									<td><%= r.getReviewWriter() %></td>
								<%} %>
							</tr>
						<%} %>
					<%} %>
				</table>
				
				<div id="review_btn">
					<button type="submit" class="btn btn-primary">리뷰등록</button>
				</div>
		
		</div>
	</div>
	<!-- 랩 끝 -->
	
	<div class="box">
    	<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>