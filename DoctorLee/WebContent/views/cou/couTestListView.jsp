<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리 : 성향 테스트 목록 페이지</title>
<style>
        .outer{
            border: 1px solid red;
            width: 1800px;
            margin-left: 50px;
        }

        /*상단 네비*/
        #navi{
            border: 1px solid pink;
            height: 100px;
        }

        /*하단 내용 영역을 감싸는 div*/
        .content{
            border: 1px solid green;
            height: 1000px;
            margin-top: 100px;
        }

        .content > div{
            float: left;
        }

        /*좌측 메뉴 영역 div*/
        #cou_navi{
            border: 1px solid orange;
            height: 100%;
            width: 225px;
        }

        /*성향 테스트 내용 출력 영역 div*/
        #test-content{
            border: 1px solid blue;
            height: 100%;
            width: 1260px;
        }

        #test-content > *{
            margin: 100px;
        }

        /*성향 테스트 목록 컨텐츠*/
        .thumbnail{
            border: 1px solid brown;
            width: 1400px;
            margin-left: 100px;
            border-radius: 10px;
        }
        
        .thumbnail > img{
            width: 300px;
            height: 300px;
        }
</style>
</head>
<body>

    <!--상단 네비게이션 메뉴 div-->
    <%@ include file="../common/nav.jsp"%>

    <!--전체를 감싸는 div-->
    <div class="outer">

        <!--하단 내용 영역을 감싸는 div-->
        <div class="content" align="center">

            <!--좌측 메뉴 div-->
            <div id="cou_navi">
                <%@ include file="../common/couNavi.jsp" %>
            </div>

            <!--성향 테스트 목록 출력 영역 div-->
            <div id="test-list" align="center">
                <div class="thumbnail" align="center">
                    <img src="https://images.ktestone.com/main-thumbnail/gardenflower-thumb.png" alt="">
                    <p> 1 / 색깔로 보는 나의 성향 </p>
                    <p>색깔로 나의 성향을 알 수 있다고?</p>
                </div>
                <div class="thumbnail" align="center">
                    <img src="https://images.ktestone.com/main-thumbnail/gardenflower-thumb.png" alt="">
                    <p> 1 / 색깔로 보는 나의 성향 </p>
                    <p>색깔로 나의 성향을 알 수 있다고?</p>
                </div>
                <div class="thumbnail" align="center">
                    <img src="https://images.ktestone.com/main-thumbnail/gardenflower-thumb.png" alt="">
                    <p> 1 / 색깔로 보는 나의 성향 </p>
                    <p>색깔로 나의 성향을 알 수 있다고?</p>
                </div>
                <div class="thumbnail" align="center">
                    <img src="https://images.ktestone.com/main-thumbnail/gardenflower-thumb.png" alt="">
                    <p> 1 / 색깔로 보는 나의 성향 </p>
                    <p>색깔로 나의 성향을 알 수 있다고?</p>
                </div>
                <div class="thumbnail" align="center">
                    <img src="https://images.ktestone.com/main-thumbnail/gardenflower-thumb.png" alt="">
                    <p> 1 / 색깔로 보는 나의 성향 </p>
                    <p>색깔로 나의 성향을 알 수 있다고?</p>
                </div>
            </div>

        </div>

    </div>
</body>
</html>