<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리 영상 등록 페이지</title>

<!--style-->
<link rel="stylesheet" href="resources/css/cou/couVideoEnroll.css">

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
                <%@ include file="../common/couNavi.jsp"%>
            </div>

            <!--비디오 자세히 보기-->
            <div id="video-list">
                
                <div class="enrollVideo" align="center">
                    <form action="insertVideo.cou" method="post">
                        <table align="center">
                            <br>
                            <h3>영상 게시하기</h3>
                            <br>

                            <tr>
                                <th width="150">제목</th>
                                <td><input type="text" name="title" id="title" required></td>
                            </tr>

                            <tr>
                                <th>채널명</th>
                                <td><input type="text" name="channel" id="channel" required></td>
                            </tr>

                            <tr>
                                <th>영상 주소</th>
                                <td><input type="text" name="address" id="address" required></td>
                            </tr>
                        </table>

                        <div>
                            <button type="submit" id="submitBtn">등록하기</button>
                        </div>
                        <br><br>
                    </form>
                    
                </div>
    
            </div>
        </div>
    
        </div>

        <div id="footer">
            <jsp:include page="../common/footer.jsp"/>
        </div>

</body>
</html>