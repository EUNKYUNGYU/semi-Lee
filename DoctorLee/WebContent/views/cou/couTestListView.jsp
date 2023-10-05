<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리 : 성향 테스트 목록 페이지</title>
<style>
        .outer{
            width: 1800px;
            margin-left: 50px;
        }

        /*상단 네비*/
        #navi{
            height: 100px;
            background-color: white;
        }

        .content > div{
            float: left;
        }

        /*하단 내용 영역을 감싸는 div*/
        .content{
            margin-top: 50px;
            height: 1400px;
        }

        /*좌측 메뉴 영역 div*/
        #cou_navi{
            height: 1350px;
        }

        #left-menu{
            margin-left: 200px;
        }

        #cou-test{
            background-color: skyblue;
            pointer-events: none;
            font-weight: 800;
        }

        /*성향 테스트 내용 출력 영역 div*/
        #test-list{
            width: 1000px;
            margin-left: 100px;
        }


        /*성향 테스트 목록 컨텐츠*/
        .thumbnail{
            background-color: bisque;
            width: 1000px;
            border-radius: 10px;
            margin-bottom: 10px;
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
</body>
</html>