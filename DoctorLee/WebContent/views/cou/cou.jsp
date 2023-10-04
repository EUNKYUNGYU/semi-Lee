<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리 전체적인 틀</title>
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
                <%@ include file="../common/couNavi.jsp"%>
            </div>

            <!--비디오 자세히 보기-->
            <div id="video-list">
                
            </div>

        </div>

    </div>

</body>
</html>