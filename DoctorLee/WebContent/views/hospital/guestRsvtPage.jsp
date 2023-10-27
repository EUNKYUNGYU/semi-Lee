<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.hospital.model.vo.*, java.util.ArrayList, com.kh.DoctorLee.reservation.model.vo.*, com.kh.DoctorLee.review.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Hospital hos = (Hospital)session.getAttribute("hos");
	int hosTreatBegin = Integer.parseInt(hos.getTreatBegin().replaceAll(":00", ""));
	int hosTreatEnd = Integer.parseInt(hos.getTreatEnd().replaceAll(":00|:30", ""));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 진료 예약</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="resources/js/reservation/guestRsvt.js"></script>
</head>
<body>
<!-- 비회원 예약 -->
<div id="guestRsvtModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
     <div class="modal-header">
       <h4 class="modal-title">비회원 진료 예약</h4>
       <button type="button" class="close" data-dismiss="modal">&times;</button>
     </div>

     <!-- Modal body -->
   <div class="modal-body">
   
<div id="calendarGuest"></div>

<table id="guest_rsvt_form" class="table table-bordered">
	<tr>
		<th>예약시간</th>
		<td>
			<select name="guest_rsvtH">
				<c:forEach var="i" begin="<%= hosTreatBegin %>" end="<%= hosTreatEnd %>" step="1">
					<option value="${ i }">
						${ i }시
					</option>
				</c:forEach>
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
			<input type="text" name="guest_rsvtName">
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
				<c:forEach var="d" items="${ docList }">
					<c:choose>
						<c:when test="${ empty d }">
							<option>
								등록된 의료진이 없습니다.
							</option>
						</c:when>
						<c:otherwise>
							<option value="${ d.docNo }">
								${ d.docName }
							</option>
						</c:otherwise>
					</c:choose>				
				</c:forEach>
			</select>
		</td>
	</tr>	
			
</table>
    </div>

     <!-- Modal footer -->
     <div class="modal-footer">
       <button onclick="guestRsvt();"
			class="btn btn-primary">예약접수</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div>
	
    </div>
  </div>
</div>

<!--  예약 확인 팝업 -->
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
        	<h6>
        		특이사항 : 
        	</h6>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>