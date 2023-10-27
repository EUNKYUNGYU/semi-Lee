<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.hospital.model.vo.*, com.kh.DoctorLee.common.model.vo.PageInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/hospital/hosSearch.css">
<script src="resources/js/hospital/hosSearch.js"></script>
<title>병원 검색</title>
</head>
<body>
    <jsp:include page="../common/nav.jsp"/>

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
		
		<c:choose>
			<c:when test="${ empty hosList }">
				<script>
					alert('조회된 병원이 없습니다.');				
				</script>
			</c:when>
			<c:otherwise>
				<c:forEach var="h" items="${ hosList }">
			        <div id="hos_list">
			            <div class="hos">
			                <div class="hos_img">
			                    <img src="https://cdn-icons-png.flaticon.com/512/6743/6743757.png" alt="병원 이미지">
			                </div>
			                <div class="hos_info">
			                    <h3>
			                    	${ h.hosName }
								</h3>
			                    <p>
									${ h.hosAddress }
								</p>
			                    <h4>진료중</h4>
			                    <div class="hos_rsvt_btn">
			                        <button onclick="rsvtPage(${ h.hosNo });">진료예약</button>
			                    </div>
			                </div>
			           	</div>
					</div>
				</c:forEach>
       		</c:otherwise>
       	</c:choose>
       	
       	<div class="paging_area">
       		<c:if test="${ requestScope.pi.currentPage ne 1 }">
       			<button class="btn btn-light" onclick="location.href='/DoctorLee/hosSearch.do?keyword=${ keyword }&page=${ requestScope.pi.currentPage - 1 } '">&lt;</button>
       		</c:if>
       		<c:forEach var="i" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }">
       			<c:choose>
       				<c:when test="${ keyword eq '' }">
		       			<button class="btn btn-info" onclick="location.href='hosSearch.do?keyword=&page=${ i }'">${ i }</button>       			
       				</c:when>
       				<c:otherwise>
       					<button class="btn btn-info" onclick="location.href='hosSearch.do?keyword=${ keyword }&page=${ i }'">${ i }</button>
       				</c:otherwise>
       			</c:choose>
       		</c:forEach>
       		<c:if test="${ requestScope.pi.currentPage ne maxPage }">
       			<button class="btn btn-light" onclick="location.href='/DoctorLee/hosSearch.do?keyword=${ keyword }&page=${ requestScope.pi.currentPage + 1 }'">&gt;</button>
       		</c:if>
       	</div>
		
    </div>
    <!-- hos_wrap 끝 -->

	<!-- 지도 -->

	<div class="footer_wrap">
    	<jsp:include page="../common/footer.jsp"/>
    </div>

</body>
</html>