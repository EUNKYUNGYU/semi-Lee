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
        margin-left: 200px;
        width: 1400px;
    }

    .content > div{
        float: left;
    }

    /*우측 클리닉 영역*/
    #cli-cate, #cli-part{
        width: 1350px;
        margin-left: 25px;
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
        width: 1200px;
        list-style: none;
        height: auto;
    }

    #cli-inner{
        border: 1px solid blue;
        width: 1100px;
        height: auto;
    }

    #cli-inner > li {
        float: left;
    }

    .cli-box{
        border: 1px solid red;
        width: 450px;
        margin-left: 50px;
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
        width: 350px;
        margin-left: 10px;
        padding: 10px;
        margin-top: 10px;
        margin-bottom: 10px;
    }

    .cli-content > div {
        float: left;
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

            <!--클리닉 출력 영역 div-->
            <div id="cli-content">

                <!--클리닉 카테고리 영역 div-->
                <div id="cli-cate" align="left">
                    <input type="radio" class="cate" name="cate" id="skin1"><label for="skin1">피부 관리</label>
                    <input type="radio" class="cate" name="cate" id="skin2"><label for="skin2">피부 진료</label>
                    <input type="radio" class="cate" name="cate" id="body"><label for="body">몸매 관리</label>
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