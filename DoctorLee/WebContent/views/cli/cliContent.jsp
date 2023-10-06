<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 아이템</title>

<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" /><style>

    #cli-part{
        width: 1000px;
        border: 1px solid red;
    }

    /*영역 제목*/
    #title-part{
        height: 100px;
        border: 1px solid blue;
        line-height: 100px;
    }

    #title-part > span{
        font-size: 26px;
    }

    /*해당 카테고리 출력 영역*/
    #content-part{
        height: 850px;
        border: 1px solid green;
    }

    /*클리닉 출력 테두리*/
    .content-border{
        margin: 10px;
        border: 1px solid purple;
        height: 500px;
        overflow: auto;
    }

    /*클리닉 출력 리스트 ul*/
    .content-list{
        list-style: none;
        border: 1px solid red;
        padding-left: 20px;
    }

    /*클리닉 출력 요소 li*/
    .content-cli{
        border: 1px solid salmon;
        border-radius: 10px;
        background-color: salmon;
        margin-bottom: 10px;
        width: 800px;
    }

    .content-cli > div{
        float: left;
    }

    /*클리닉 대표 이미지*/
    .cli-img{
        border: 1px solid brown;
        margin: 10px;
    }

    .cli-img > img{
        width: 110px;
        height: 130px;
        padding: 10px;
    }

    /*클리닉 설명*/
    .cli-des{
        border: 1px solid orange;
        width: auto;
        margin: 10px;
        padding: 10px;
    }

    .cli-top{
        border: 1px solid blue;
    }

    .cli-name{
        border: 1px solid green;
    }

    /*돋보기 아이콘*/
    .material-symbols-outlined{
        font-size: 20px;
        border: 1px solid red;
        
    }
</style>
</head>
<body>

    <!--클리닉 내용 출력 영역 div-->
    <div id="cli-part">

        <!--제목 출력 영역 div-->
        <div id="title-part">
            <span>클리닉을 선택해주세요</span>
        </div>

        <!--해당 카테고리 클리닉 출력 영역 div-->
        <div id="content-part" align="center">

            <!--클리닉 출력 테두리 div-->
            <div class="content-border">

                <!--클리닉 출력 ul-->
                <ul class="content-list">

                    <!--클리닉 요소 하나하나 li-->
                    <li class="content-cli">

                        <!--클리닉 대표 이미지 div-->
                        <div class="cli-img">
                            <img src="https://i.pinimg.com/736x/47/a6/48/47a64863fece924aaf2cc07fa6cfc6e7.jpg" alt="">
                        </div>

                        <!--클리닉 설명 div-->
                        <div class="cli-des" align="left">
                            <div class="cli-top">
                                <span class="cli-name">클리닉명</span>
                                <span class="material-symbols-outlined">search</span>
                            </div>
                            <p>클리닉 장소</p>
                            <p>별점</p>
                            <span>가격</span>
                        </div>
                        <br clear="both">
                    </li>
                    
                    <!--클리닉 요소 하나하나 li-->
                    <li class="content-cli">

                        <!--클리닉 대표 이미지 div-->
                        <div class="cli-img">
                            <img src="https://i.pinimg.com/736x/47/a6/48/47a64863fece924aaf2cc07fa6cfc6e7.jpg" alt="">
                        </div>

                        <!--클리닉 설명 div-->
                        <div class="cli-des" align="left">
                            <div class="cli-top">
                                <span class="cli-name">클리닉명</span>
                                <span class="material-symbols-outlined">search</span>
                            </div>
                            <p>클리닉 장소</p>
                            <p>별점</p>
                            <span>가격</span>
                        </div>
                        <br clear="both">
                    </li>

                    <!--클리닉 요소 하나하나 li-->
                    <li class="content-cli">

                        <!--클리닉 대표 이미지 div-->
                        <div class="cli-img">
                            <img src="https://i.pinimg.com/736x/47/a6/48/47a64863fece924aaf2cc07fa6cfc6e7.jpg" alt="">
                        </div>

                        <!--클리닉 설명 div-->
                        <div class="cli-des" align="left">
                            <div class="cli-top">
                                <span class="cli-name">클리닉명</span>
                                <span class="material-symbols-outlined">search</span>
                            </div>
                            <p>클리닉 장소</p>
                            <p>별점</p>
                            <span>가격</span>
                        </div>
                        <br clear="both">
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>