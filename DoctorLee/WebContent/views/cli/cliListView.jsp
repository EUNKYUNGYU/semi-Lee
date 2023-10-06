<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 예약 페이지</title>

<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<style>
    .outer{
        width: 1800px;
        margin-left: 50px;
    }

    /*상단 네비*/
    #navi{
        height: 100px;
    }

    /*하단 내용 영역을 감싸는 div*/
    .content{
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
    #cli-part, #res-part{
        margin-left: 100px;
        width: 1000px;
    }

    #cli-part{
        margin-top: 10px;
    }

    /*카테고리 영역*/
    #cli-cate-part{
        width: 1000px;
        border: 1px solid black;
    }
    
    .category-title-part{
        height: 100px;
        border-bottom: 1px solid;
        line-height: 100px;
    }

    .category-title-part span{
        font-size: 26px;
    }

    .category-title-part > span{
        margin-left: 50px;
    }

    .category-title-part > em > span{
        background-color: #1E376F;
        border-radius: 50%;
        color: white;
        margin-left: 100px;
    }

    #cli-cate-part{
        width: 1000px;
        margin-left: 100px;
    }

    .cate{
        opacity: 0;
    }


    input[type=radio]+label{
        color: black;
        border-radius: 10px;
        text-align: center;
        padding-top: 10px;
        padding-left: 10px;
        padding-bottom: 10px;
        display: inline-block;
        font-size: 20px;
    }

    input[type=radio]:checked + label{
        color: blue;
        text-decoration: underline;
    }

    #cate-inner > ul{
        list-style: none;
        display: flex;
        margin-left: 120px;
        margin-bottom: 0;
        padding: 0;
    }


    /*결과 출력 영역*/
    .title-part{
        height: 100px;
        border: 1px solid black;
        line-height: 100px;
    }

    .title-part span{
        font-size: 26px;
    }

    .title-part > span{
        margin-left: 50px;
    }

    .title-part > em > span{
        background-color: #1E376F;
        border-radius: 50%;
        color: white;
        margin-left: 100px;
    }

    /*해당 카테고리 출력 영역*/
    #content-part{
        height: auto;
        border: 1px solid;
    }

    /*클리닉 출력 테두리*/
    .content-border{
        margin: 10px;
        height: 500px;
        overflow: auto;
    }

    /*클리닉 출력 리스트 ul*/
    .content-list{
        list-style: none;
        padding-left: 15px;
    }

    /*클리닉 출력 요소 li*/
    .content-cli{
        background-color:salmon;
        border-radius: 10px;
        margin-bottom: 5px;
        margin-top: 5px;
        width: 898px;
    }

    .content-cli > div{
        float: left;
    }

    /*클리닉 대표 이미지*/
    .cli-img{
        margin: 10px;
    }

    .cli-img > img{
        width: 110px;
        height: 130px;
        padding: 10px;
    }

    /*클리닉 설명*/
    .cli-des{
        width: auto;
        margin: 10px;
        padding: 10px;
        height: 132px;
    }

    .cli-des > div > span{
        vertical-align: middle;
    }

    .title{
        vertical-align: middle;
    }

    .cli-name{
        font-weight: 1000;
    }

    /*별점*/
    .cli-score > span{
        vertical-align: middle;
    }

    /*돋보기 아이콘*/
    .material-symbols-outlined{
        font-size: 20px;
        margin: 0;
        padding: 0;
    }

    /*날짜와 시간을 띄울 영역*/
    #res-part{
        border: 1px solid;
        height: auto;
        margin-top: 10px;
    }

    /*예약 출력 영역*/
    #cli-date-part{
        width: 1000px;
    }

    .date-title-part{
        height: 100px;
        line-height: 100px;
    }

    .date-title-part span{
        font-size: 26px;
    }

    .date-title-part > span{
        margin-left: 50px;
    }

    .date-title-part > em > span{
        background-color: #1E376F;
        border-radius: 50%;
        color: white;
        margin-left: 100px;
    }

    #cli-date-part{
        width: 1000px;
    }

    #cli-date{
        border-bottom: 1px solid;
    }
    
    #date-inner{
        width: 590px;
        border-right: 1px solid;
    }

    #time-inner{
        width: 390px;
    }

    #cli-date > div{
        float: left;
    }
</style>
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
            <div class="left-menu">
                <%@ include file="../common/cliNavi.jsp"%>
            </div>

            <!--클리닉 출력 영역 div-->
            <div id="cli-content">

                <!--클리닉 내용 출력 영역 div-->
                <div id="cli-cate-part">

                    <!--제목 출력 영역 div-->
                    <div class="category-title-part">
                        <em>
                            <span class="material-symbols-outlined">chevron_right</span>
                        </em>
                        <span>카테고리를 선택해주세요</span>
                    </div>

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
        </div>

                <!--클리닉 내용 출력 영역 div-->
                <div id="cli-part">

                    <!--제목 출력 영역 div-->
                    <div class="title-part">
                        <em>
                            <span class="material-symbols-outlined">chevron_right</span>
                        </em>
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
                                        <img src="https://i.pinimg.com/736x/47/a6/48/47a64863fece924aaf2cc07fa6cfc6e7.jpg" alt=""> <br>
                                        <button>자세히 보기</button>
                                    </div>

                                    <!--클리닉 설명 div-->
                                    <div class="cli-des" align="left">

                                        <div class="cli-top">
                                            <span class="cli-name title">클리닉명</span>
                                        </div>

                                        <div class="cli-location">
                                            <span>클리닉 장소</span>
                                        </div>

                                        <div class="cli-score">
                                            <span class="material-symbols-outlined">grade</span>
                                            <span>별점</span>
                                        </div>

                                        <div class="cli-price">
                                            <span>가격</span>
                                        </div>

                                    </div>
                                    <br clear="both">
                                </li>

                                <!--클리닉 요소 하나하나 li-->
                                <li class="content-cli">

                                    <!--클리닉 대표 이미지 div-->
                                    <div class="cli-img">
                                        <img src="https://i.pinimg.com/736x/47/a6/48/47a64863fece924aaf2cc07fa6cfc6e7.jpg" alt=""> <br>
                                        <button>자세히 보기</button>
                                    </div>

                                    <!--클리닉 설명 div-->
                                    <div class="cli-des" align="left">

                                        <div class="cli-top">
                                            <span class="cli-name title">클리닉명</span>
                                        </div>

                                        <div class="cli-location">
                                            <span>클리닉 장소</span>
                                        </div>

                                        <div class="cli-score">
                                            <span class="material-symbols-outlined">grade</span>
                                            <span>별점</span>
                                        </div>

                                        <div class="cli-price">
                                            <span>가격</span>
                                        </div>

                                    </div>
                                    <br clear="both">
                                </li>
                                
                                <!--클리닉 요소 하나하나 li-->
                                <li class="content-cli">

                                    <!--클리닉 대표 이미지 div-->
                                    <div class="cli-img">
                                        <img src="https://i.pinimg.com/736x/47/a6/48/47a64863fece924aaf2cc07fa6cfc6e7.jpg" alt=""> <br>
                                        <button>자세히 보기</button>
                                    </div>

                                    <!--클리닉 설명 div-->
                                    <div class="cli-des" align="left">

                                        <div class="cli-top">
                                            <span class="cli-name title">클리닉명</span>
                                        </div>

                                        <div class="cli-location">
                                            <span>클리닉 장소</span>
                                        </div>

                                        <div class="cli-score">
                                            <span class="material-symbols-outlined">grade</span>
                                            <span>별점</span>
                                        </div>

                                        <div class="cli-price">
                                            <span>가격</span>
                                        </div>

                                    </div>
                                    <br clear="both">
                                </li>

                                <!--클리닉 요소 하나하나 li-->
                                <li class="content-cli">

                                    <!--클리닉 대표 이미지 div-->
                                    <div class="cli-img">
                                        <img src="https://i.pinimg.com/736x/47/a6/48/47a64863fece924aaf2cc07fa6cfc6e7.jpg" alt=""> <br>
                                        <button>자세히 보기</button>
                                    </div>

                                    <!--클리닉 설명 div-->
                                    <div class="cli-des" align="left">

                                        <div class="cli-top">
                                            <span class="cli-name title">클리닉명</span>
                                        </div>

                                        <div class="cli-location">
                                            <span>클리닉 장소</span>
                                        </div>

                                        <div class="cli-score">
                                            <span class="material-symbols-outlined">grade</span>
                                            <span>별점</span>
                                        </div>

                                        <div class="cli-price">
                                            <span>가격</span>
                                        </div>

                                    </div>
                                    <br clear="both">
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <script>
                    $(function(){
                        //li클릭 시 색깔 바뀌는 이벤트
                        $('.content-cli').click(function(){
                            // $(this).css('background-color', 'bisque');
                        })

                        //돋보기 버튼 클릭 시 상세보기 페이지로 이동
                        $('.cli-img > button').click(function(){
                            location.href='<%=contextPath%>/cliDetail.cli';
                        })
                    })
                </script>

                <!--클리닉 예약 날짜 및 시간 띄우기 영역 div-->
                <div id="res-part">
                    <!--클리닉 예약일시 출력 영역 div-->
                    <div id="cli-date-part">

                        <!--제목 출력 영역 div-->
                        <div class="date-title-part">
                            <em>
                                <span class="material-symbols-outlined">chevron_right</span>
                            </em>
                            <span>예약일시를 선택해주세요</span>
                        </div>

                        <!--예약일시 영역 div-->
                        <div id="cli-date" align="left">
                            <div id="date-inner" align="center">
                            <p>날짜 선택(달력 출력)</p>
                            </div>

                            <div id="time-inner">
                                <p>시간 선택</p>
                            </div>
                        </div>
                        <br clear="both">
                </div>
            </div>

            </div>

        </div>

    </div>

</body>
</html>