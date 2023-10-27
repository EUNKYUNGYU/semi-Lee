<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리 : 성향 테스트 목록 페이지</title>

<!--style-->
<link rel="stylesheet" href="resources/css/cou/couTestList.css">

</head>
<body>

    <!--상단 네비게이션 메뉴 div-->
    <%@ include file="../common/nav2.jsp"%>

    <br><br><br>

    <!--전체를 감싸는 div-->
    <div class="outer">

        <!--하단 내용 영역을 감싸는 div-->
        <div class="content" align="center">

            <!--좌측 메뉴 div-->
            <div id="left-menu">
                <%@ include file="../common/couNavi.jsp" %>
            </div>

            <!--성향 테스트 목록 출력 영역 div-->
            <div id="test-list" align="center">

				<c:if test="${ !empty loginUser && loginUser.memId eq 'admin' }">
                    <div id="button-area" align="right">
                        <button type="button" onclick="location.href='<%=contextPath%>/couVideoEnroll.cou'">등록하기</button>
                    </div>
                </c:if>

                <div class="thumbnail" align="center">
                    <br>
                    <img src="https://images.ktestone.com/main-thumbnail/gardenflower-thumb.png" alt="">
                    <p> 3 / 색깔로 보는 나의 성향 </p>
                    <p>색깔로 나의 성향을 알 수 있다고?</p>
                    <br>
                </div>
                <div class="thumbnail" align="center">
                    <br>
                    <img src="https://images.ktestone.com/main-thumbnail/gardenflower-thumb.png" alt="">
                    <p> 2 / 색깔로 보는 나의 성향 </p>
                    <p>색깔로 나의 성향을 알 수 있다고?</p>
                    <br>
                </div>
                <div class="thumbnail" align="center">
                    <br>
                    <img src="https://images.ktestone.com/main-thumbnail/gardenflower-thumb.png" alt="">
                    <p> 1 / 색깔로 보는 나의 성향 </p>
                    <p>색깔로 나의 성향을 알 수 있다고?</p>
                    <br>
                </div>
            </div>

        </div>

    </div>

    <footer>
        <jsp:include page="../common/footer.jsp"/>
    </footer>
</body>
</html>