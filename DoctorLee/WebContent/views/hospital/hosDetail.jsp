<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>병원 상세</title>
<style>

	  .hos_wrap{margin: 0 auto;}
	  
	  #hos_info, #hos_rsvt, #hos_review{display: inline-block;}
	  
</style>
</head>
<body>
    <%@ include file="../common/nav.jsp" %>
<br><br><br><br><br><br><br><br><br>
    <!-- 병원 상세페이지 -->
	<div class="hos_wrap">
        
        
        <!-- 병원 정보 -->
        <div id="hos_info">
			
			<h3>좋은병원</h3>
			<span>치과</span>
			
			<!-- 현재 대기자 5명 -->
			
			<p>
				병원소개글 .....................................
			</p>
			
			<div id="hos_info_address">
				<div class="icon">
					<i class="fa-solid fa-location-dot"></i>
				</div>
				<h4>
					서울특병수
				</h4>
			</div>
			<div id="hos_info_date">
				<div class="icon">
					<i class="fa-solid fa-clock"></i>
				</div>
				<h4>
					- 월~금
					- 09:00
				</h4>
			</div>
			<div id="hos_info_tel">
				<div class="icon">
					<i class="fa-solid fa-phone"></i>
				</div>
				<h4>
					022-303-202
				</h4>
			</div>
			
        </div>

        <!-- 진료 예약 -->
        <div id="hos_rsvt">
				
			<table id="cal">
				
			
			
			
			</table>

			<form action="" method="post" id="rsvt_form">
				<table>
					<tr>
						<th>예약시간</th>
						<td>
							<select name="rsvt_time">
								<% for(int i = 8; i >= 22; i++) { %>
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
				
					<button type="submit" class="btn btn-primary">예약접수</button>
					
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
					  비회원 진료예약
					</button>
					
				</div>
				
			</form>
			
			<!-- Button to Open the Modal -->

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
			
			
			</div>
			<!-- 진료 예약 끝 -->
				


		<!-- 병원 리뷰 -->
		<div id="hos_review">
			
			<form action="" method="post" id="scope_form">
				<input type="radio" name="review_scope" value="5" id="scope5">
				<label for="scope5">★</label>
				
				<input type="radio" name="review_scope" value="4" id="scope4">
				<label for="scope4">★</label>
		
				<input type="radio" name="review_scope" value="3" id="scope3">
				<label for="scope3">★</label>

				<input type="radio" name="review_scope" value="2" id="scope2">
				<label for="scope2">★</label>
	
				<input type="radio" name="review_scope" value="1" id="scope1">
				<label for="scope1">★</label>
			
		
				<table>
				
					<tr>
						<td>후기 내용</td>
						<td>후기 작성자</td>
					</tr>
				
				</table>
		
			</form>
		
		</div>
		
		
		
		
	</div>
	<!-- 랩 끝 -->

    <%@ include file="../common/footer.jsp" %>

</body>
</html>