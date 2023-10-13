<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리 상담 예약 페이지</title>

<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!--fullCalendar-->
<script>

    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        locale: 'ko'
      });
      calendar.render();
    });

</script>

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
        height: auto;
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

    #cou-res{
        background-color: skyblue;
        font-weight: 800;
        pointer-events: none;
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
        justify-content: space-evenly;
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
        /*display: none;*/
    }

    /*클리닉 출력 테두리*/
    .content-border{
        margin: 10px;
        height: 500px;
        overflow: auto;
        border: 1px solid red;
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
        border: 1px solid;
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
        /*display: none;*/
        height: 550px;
        width: 1000px;
    }
    
    #date-inner{
        width: 700px;
        height: 582px;
        border: 1px solid;
    }

    #time-inner{
        width: 300px;
        height: 582px;
        border-right : 1px solid;
        border-bottom: 1px solid;
    }

    #cli-date > div{
        float: left;
    }

    /*시간 출력*/
    .time-content{
        background-color: bisque;
        border-radius: 10px;
        text-decoration: none;
        margin-top: 20px;
        width: 230px;
        border: 1px solid brown;
        height: 50px;
        line-height: 50px;
        margin-right: 30px;
    }

    .time-border{
        border: 1px solid blue;
        overflow: auto;
        height: 580px;
    }

    .time-border > ul{
        list-style: none;
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
                <%@ include file="../common/couNavi.jsp"%>
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
                            <li><input type="radio" class="cate" name="cate" id="call"><label for="call">전화</label></li>
                            <li><input type="radio" class="cate" name="cate" id="meet"><label for="meet">대면</label></li>
                        </ul>

                    </div>
                </div>
        </div>

                <!--클리닉 내용 출력 영역 div-->
                <div id="cli-part">

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
                                        <button>예약하기</button>
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
                                        <button>예약하기</button>
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
                                        <button>예약하기</button>
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
                                        <button>예약하기</button>
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

                        //돋보기 버튼 클릭 시 상세보기 페이지로 이동
                        $('.cli-img > button').click(function(){
                            location.href='<%=contextPath%>/couDetail.cou';
                        })
                    })
                </script>

            <br><br><br><br><br>

            </div>

        </div>

    </div>

</body>
</html>