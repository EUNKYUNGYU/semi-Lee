<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.cli.model.vo.*, java.util.ArrayList" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 상세보기</title>
<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<!--style-->
<link rel="stylesheet" href="resources/css/cou/couResDetail.css">


</head>
<body>

    <!--상단 네비게이션 메뉴 div-->
    <%@ include file="../common/nav2.jsp"%>
    <br><br><br>

    <!--전체를 감싸는 div-->
    <div class="outer">

        <!--하단 내용 영역을 감싸는 div-->
        <div class="content" align="center">

            <!--클리닉 출력 영역 div-->
            <div id="cli-content" align="left">

                <input type="hidden" name="cliNo" value="${c.cliNo}">

				<c:if test="${ !empty loginUser }">
                    <div id="res-btn" align="right">
                        <button class="btn btn-primary" type="button" id="resBtn" onclick="location.href='<%=contextPath%>/cliRes.cli?cno=${ c.cliNo}'">예약하기</button>
                    </div>
                </c:if>

                <!--클리닉 간단 정보 출력 영역 div-->
                <div id="cli-top" >
                    <h4>${ c.cliName }</h4>
                    <p>${ c.hosNo }</p>
                    <span class="material-symbols-outlined">grade</span>
                    <span>${ c.scope }</span>
                    <p>${ c.cliPrice }원</p>
                </div>

                <!--클리닉 상세 정보 출력 영역 div-->
                

                <!--클리닉 후기 출력 영역 div-->
                <div id="cli-bottom">
                    <h4>후기</h4>
                    
                    <c:if test="${ !empty loginUser && result gt 0 && result2 eq 0 }">
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">후기 작성</button>
                    </c:if>
                    
                    <div id="rev-border">
                        <ul id="rev-list">
                        	<c:forEach var="r" items="${list}">
                        		<li class="rev-content">

	                                <div class="revScope">
	                                	<span class="star">⭐</span>
	                                    <span>${ r.cliScope }</span>
	                                </div>
	
	                                <div class="reContent">
	                                    <p>${r.revContent}</p>
	                                </div>
	
	                                <div class="revNickName">
	                                   <p>${ r.nickName }</p>
	                                </div>
	
	                                <div class="revDate">
	                                  <p>${r.createDate}</p>
	                                </div>
                                </li>
                        	</c:forEach>
                            
                        </ul>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <footer>
        <jsp:include page="../common/footer.jsp"/>
    </footer>

    <!--리뷰 작성 모달창-->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">리뷰 작성하기</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

				<form action="revInsert.cli" method="post">
                <!-- Modal body -->
                <div class="modal-body">

                    <div id="scope">
                        <h6>별점</h6>
                        <input type="hidden" name="memNo" value="${ loginUser.memNo }">
                        <input type="hidden" name="cliNo" value="${c.cliNo}">
                        <fieldset>
                            <input type="radio" name="reviewStar" value="5" id="rate1" checked><label
                                for="rate1">★</label>
                            <input type="radio" name="reviewStar" value="4" id="rate2"><label
                                for="rate2">★</label>
                            <input type="radio" name="reviewStar" value="3" id="rate3"><label
                                for="rate3">★</label>
                            <input type="radio" name="reviewStar" value="2" id="rate4"><label
                                for="rate4">★</label>
                            <input type="radio" name="reviewStar" value="1" id="rate5"><label
                                for="rate5">★</label>
                        </fieldset>
                    </div>

                    <div id="rev">
                        <h6>리뷰 작성</h6>
                        <textarea name="revContent" id="revContent" cols="30" rows="10" style="resize: none;"></textarea>
                    </div>
                </div>
            
      
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                <button id="insertRev" type="submit" class="btn btn-primary">등록하기</button>
	                </div>
				</form>
            </div>
        </div>
      </div>

</body>
</html>