<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 예약 페이지</title>
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

    /*우측 클리닉 영역*/
    #cli-cate, #cli-part{
        width: 1400px;
        margin-left: 80px;
    }

    #cli-cate{
        border: 1px solid rebeccapurple;
        height: 200px;
        margin-top: 30px;
    }

    #cli-part{
        border: 1px solid saddlebrown;
        height: auto;
        margin-top: 50px;
    }

    #cli-list{
        border: 1px solid red;
        width: 1300px;
        list-style: none;
        height: auto;
    }

    #cli-inner{
        border: 1px solid blue;
        width: 1200px;
        height: auto;
    }

    #cli-inner > li {
        float: left;
    }

    .cli-box{
        border: 1px solid red;
        width: 580px;
    }

    .cli-img > img{
        width: 110px;
        height: 130px;
        border: 1px solid blue;
        margin-top: 30px;
        padding: 10px;
    }

    .cli-des{
        border: 1px solid pink;
        width: 350px;
        margin-left: 10px;
        padding: 10px;
    }

    .cli-content > div {
        float: left;
    }

    .cate{
        opacity: 0;
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

            <!--클리닉 출력 영역 div-->
            <div id="cli-content">

                <!--클리닉 카테고리 영역 div-->
                <div id="cli-cate">
                    <input type="radio" name="cate" value="피부"> 피부
                </div>

                <!--클리닉 내용 출력 영역 div-->
                <div id="cli-part">
                    <ul id="cli-list">
                        <div id="cli-inner">
                            <li class="cli-box">
                                <div class="cli-content" align="left">
                                    <div class="cli-img">
                                        <img src="https://i.pinimg.com/736x/47/a6/48/47a64863fece924aaf2cc07fa6cfc6e7.jpg" alt="">
                                    </div>
                                    
                                    <div class="cli-des">
                                        <h4>클리닉명</h4>
                                        <p>클리닉 장소</p>
                                        <p>별점</p>
                                        <h4>가격</h4>
                                    </div>
                                    <br clear="both">
                                </div>
                            </li>
                            

                            <li class="cli-box">
                                <div class="cli-content" align="left">
                                    <div class="cli-img">
                                        <img src="https://i.pinimg.com/736x/47/a6/48/47a64863fece924aaf2cc07fa6cfc6e7.jpg" alt="">
                                    </div>
                                    
                                    <div class="cli-des">
                                        <h4>클리닉명</h4>
                                        <p>클리닉 장소</p>
                                        <p>별점</p>
                                        <h4>가격</h4>
                                    </div>
                                    <br clear="both">
                                </div>
                            </li>
                            <br clear="both">

                            
                        </div>
                    </ul>
                </div>
            </div>

        </div>

    </div>

</body>
</html>