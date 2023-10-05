<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 예약 페이지</title>
<style>
    .outer{
        width: 1800px;
        margin-left: 50px;
        border: 1px solid red;
    }

    /*상단 네비*/
    #navi{
        border: 1px solid pink;
        height: 100px;
    }

    /*하단 내용 영역을 감싸는 div*/
    .content{
        border: 1px solid green;
        height: 1050px;
        margin-top: 50px;
    }

    .content > div{
        float: left;
    }

    #cou_navi{
        height: 1000px;
    }

    .left-menu{
        margin-left: 200px;
    }

    /*우측 클리닉 영역*/
    #cli-cate, #cli-part, #res-part{
        width: 1000px;
        margin-left: 100px;
    }

    #cli-cate{
        border: 1px solid rebeccapurple;
        height: 200px;
    }

    #cli-part{
        border: 1px solid saddlebrown;
        height: auto;
        margin-top: 30px;
    }

    #cli-list{
        border: 1px solid red;
        width: 900px;
        list-style: none;
        height: auto;
    }

    #cli-inner{
        border: 1px solid blue;
        width: auto;
        height: 500px;
        margin-right: 30px;
        overflow: auto;
    }

    .cli-box{
        background-color: bisque;
        border-radius: 10px;
        width: 800px;
        margin-top: 5px;
        margin-bottom: 5px;
    }

    .cli-img > img{
        width: 110px;
        height: 130px;
        border: 1px solid blue;
        margin-top: 30px;
        padding: 10px;
        margin-left: 10px;
    }

    .cli-des{
        border: 1px solid pink;
        width: 500px;
        margin-left: 10px;
        padding: 10px;
        margin-top: 10px;
        margin-bottom: 10px;
    }

    .cli-content > div {
        float: left;
    }

    .cli-des > span{
        font-weight: 800;
    }

    /*카테고리 영역*/
    .cate{
        opacity: 0;
    }

    .cate > label{
        padding: 5px 10px;
    }

    input[type=radio]+label{
        color: black;
        border-radius: 10px;
        text-align: center;
        padding-top: 10px;
        padding-left: 10px;
        display: inline-block;
        font-size: 20px;
    }

    input[type=radio]:checked + label{
        color: blue;
        text-decoration: underline;
    }

    #cate-inner > ul{
        list-style: none;
        border: 1px solid red;
        display: flex;
    }

    /*날짜와 시간을 띄울 영역*/
    #res-part{
        border: 1px solid khaki;
        margin-top: 30px;
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
            <div class="left-menu">
                <%@ include file="../common/cliNavi.jsp"%>
            </div>

            <!--클리닉 출력 영역 div-->
            <div id="cli-content">

                <!--클리닉 카테고리 영역 div-->
                <div id="cli-cate" align="left">
                    <div id="cate-inner" align="center">
                        <ul>
                            <li><input type="radio" class="cate" name="cate" id="skin1"><label for="skin1">피부 관리</label></li>
                            <li><input type="radio" class="cate" name="cate" id="skin2"><label for="skin2">피부 진료</label></li>
                            <li><input type="radio" class="cate" name="cate" id="body1"><label for="body1">몸매 관리</label></li>
                            <li><input type="radio" class="cate" name="cate" id="skin3"><label for="skin3">피부 진료3</label></li>
                            <li><input type="radio" class="cate" name="cate" id="skin1"><label for="skin1">피부 관리</label></li>
                            <li><input type="radio" class="cate" name="cate" id="skin2"><label for="skin2">피부 진료</label></li>
                            <li><input type="radio" class="cate" name="cate" id="body1"><label for="body1">몸매 관리</label></li>
                        </ul>

                    </div>
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
                                        <span>클리닉명</span>
                                        <p>클리닉 장소</p>
                                        <p>별점</p>
                                        <span>가격</span>
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
                                        <span>클리닉명</span>
                                        <p>클리닉 장소</p>
                                        <p>별점</p>
                                        <span>가격</span>
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
                                        <span>클리닉명</span>
                                        <p>클리닉 장소</p>
                                        <p>별점</p>
                                        <span>가격</span>
                                    </div>
                                    <br clear="both">
                                </div>
                            </li>
                            
                        </div>
                    </ul>
                </div>

                <!--클리닉 예약 날짜 및 시간 띄우기 영역 div-->
                <div id="res-part">
                    <p>날짜와 시간을 띄울 곳 <br> 원하는 날짜 선택 시 시간을 선택할 수 있음</p>
                </div>

            </div>

        </div>

    </div>

</body>
</html>