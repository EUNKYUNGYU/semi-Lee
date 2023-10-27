<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.cou.model.vo.*, com.kh.DoctorLee.common.model.vo.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리: 영상 목록 페이지</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>

<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />


<!--w3c bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!--style-->
<link rel="stylesheet" href="resources/css/cou/couVideoList.css">

</head>
<body>

    <!--상단 네비게이션 메뉴 div-->
    <%@ include file="../common/nav2.jsp"%>

    <br><br><br>

    <!--전체를 감싸는 div-->
    <div class="outer">

    <!--하단 내용 영역을 감싸는 div-->
    <div class="content">

        <!--좌측 메뉴 div-->
        <div class="left-menu">
            <%@ include file="../common/couNavi.jsp"%>
        </div>
    

        <!--심리 영상 내용 출력 영역 div-->
        <div id="video-list">

			<c:if test="${ !empty loginUser && loginUser.memId eq 'admin' }">
                <div id="button-area" align="right">
                    <button type="button" onclick="location.href='<%=contextPath%>/couVideoEnroll.cou'">등록하기</button>
                </div>
            </c:if>

            <c:choose>
            	<c:when test="${ empty list }">
            		<div clss=list-content" align="center">
            			등록된 영상이 없습니다.
            		</div>
            	</c:when>
            	
            	<c:otherwise>
            		
            		<c:forEach var="c" items="${ list }">
            			<div class="list-content" align="center">
                    	<br>

			                <input type="hidden" value="${ c.videoAddress}">
		
		                    <input type="hidden" value="${ c.videoNo }">
		
		                    <input type="hidden" value="${ c.channelName }">
		
							<c:if test="${ !empty loginUser && loginUser.memId eq 'admin' }">
		                        <div class="emoji" align="right">
		                            <span class="material-symbols-outlined edit">
		                                edit
		                            </span>
		
		                            <span class="material-symbols-outlined delete">
		                                delete
		                            </span>
		                        </div>
		                    </c:if>
		                        		
			                <div class="list-img">
			                    <img src="https://img.youtube.com/vi/${ c.videoAddress }/maxresdefault.jpg" alt="">
			                </div>
			                <div class="list-des">
			                    <p class="video-title">${c.videoTitle}</p>
			                    <p class="video-channel">${c.channelName}</p>
			                </div>
		                    <br>
			            </div>
            		</c:forEach>
            	
            	</c:otherwise>
            </c:choose>

            <br>
            <div class="paging-area" align="center">
            	<c:if test="${  pi.currentPage != 1 }">
                    <button class="btn btn-light" onclick="location.href='<%=contextPath%>/couVideoList.cou?cpage=${ pi.currentPage -1}'">&lt</button>
                </c:if>
                
                <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage}">
                
                	<c:choose>
                	
                		<c:when test="${ pi.currentPage != i }">
                			<button class="btn btn-light" onclick="location.href='<%=contextPath%>/couVideoList.cou?cpage=${ i }'">${ i }</button>
                		</c:when>
                		
                		<c:otherwise>
                			<button class="btn btn-light" disabled>${ i }</button> 
                		</c:otherwise>
                	
                	</c:choose>
                
                </c:forEach>
                
                <c:if test="${ pi.currentPage != pi.maxPage }">
                	<button class="btn btn-light" onclick="location.href='<%=contextPath%>/couVideoList.cou?cpage\${ pi.currentPage + 1 }'">&gt</button>
                </c:if>
                
            </div>

        </div>
    </div>

    </div>

    <footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>


    <script>
        $(function(){

            // 썸네일 클릭 시 해당 영상 주소로 이동
            $('.list-img').click(function(){
                const address = $(this).parent().children().eq(1).val();
                
                // console.log(this);
                location.href = 'https://www.youtube.com/watch?v='+address;
            })

            // 영상 제목 클릭 시 해당 영상 주소로 이동
            $('.video-title').click(function(){
                const address = $(this).parents().children().eq(3).val();
                
                // console.log($(this).parents().children().eq(3).val());
                location.href = 'https://www.youtube.com/watch?v='+address;
            })

            // 채널명 클릭 시 해당 채널로 이동
            $('.video-channel').click(function(){
                const address = $(this).parents().children().eq(5).val();
                console.log(address);
                location.href = 'https://www.youtube.com/results?search_query='+address; 
            })

            // 클릭 시 영상 수정 페이지로 이동
            $('.edit').click(function(){
                console.log('수정');

                const videoNo = $('.list-content').children().eq(2).val();

                location.href = '<%=contextPath%>/updateVideo.cou?cvno='+videoNo;
            })

            // 클릭 시 영상 삭제
            $('.delete').click(function(){

                const videoNo = $('.list-content').children().eq(2).val();

                var result  = confirm('영상을 삭제하겠습니까?');

                if(result){
                    location.href='<%=contextPath%>/deleteVideo.cou?cvno='+videoNo;
                } else {

                }
            })
        })
    </script>

</body>
</html>