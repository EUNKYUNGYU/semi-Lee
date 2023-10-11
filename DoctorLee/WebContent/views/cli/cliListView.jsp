<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.cli.model.vo.*" %>
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 예약 페이지</title>

<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!--fullCalendar-->
<script>

    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        locale: 'ko',
        headerToolbar:{
            left:'prev',
            center:'title',
            right:'next'
        },

        dateClick: function(info){

            // 현재 날짜를 기준으로 과거 날짜 선택 불가
            var clickedDate = info.date.getTime();
            var today = new Date().getTime();

            if(clickedDate < today){
                return false;
            } 

            $('.time-content').click(function(){
                // 달력 클릭 시 선택한 날짜 출력하기
                $('#pick-date, #sel-date').text((info.dateStr).replaceAll('-', '.') + "." + $(this).children().text());
            })

            var days = document.querySelectorAll(".day-color");
            days.forEach(function(day){
                day.classList.remove("day-color");
            })
            info.dayEl.classList.add("day-color");
        }
      });
      calendar.render();
      
    });

</script>

<style>

    .day-color{
        background-color: #1E376F !important;
        font-weight: 900;
    }

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
        display: none;
    }

    /*클리닉 출력 테두리*/
    .content-border{
        margin: 10px;
        height: auto;
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

    .cli-no{
        display: none;
    }

    /*클리닉 설명*/
    .cli-des{
        width: 500px;
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

    /*달력*/
    #cli-date-part{
        width: 1000px;
    }

    #cli-date{
        visibility: hidden;
        height: 582px;
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

    /* 일요일 날짜 빨간색 */
    .fc-day-sun a {
    color: red;
    text-decoration: none;
    }

    /* 토요일 날짜 파란색 */
    .fc-day-sat a {
    color: blue;
    text-decoration: none;
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
                <%@ include file="../common/cliNavi.jsp"%>
            </div>

            <form action="<%=contextPath%>/enrollRes.cli" method="post"></form>

            <!--클리닉 출력 영역 div-->
            <div id="cli-content">

                <% if(loginUser != null && loginUser.getMemId().equals("admin")){ %>
                    <div id="button-area" align="right">
                        <button type="button" onclick="location.href='<%=contextPath%>/couVideoEnroll.cou'">등록하기</button>
                    </div>
                <% } %>

                <!--클리닉 내용 출력 영역 div-->
                <div id="cli-cate-part">

                    <!--제목 출력 영역 div-->
                    <div class="category-title-part">
                        <em>
                            <span class="material-symbols-outlined">chevron_right</span>
                        </em>
                        <span id="cate-pick">카테고리를 선택해주세요</span>
                    </div>

                <!--클리닉 카테고리 영역 div-->
                <div id="cli-cate" align="left">
                    <div id="cate-inner" align="center">
                        <ul>
                        <%for(int i = 0; i < list.size(); i++){ %>
                            <li>
                                <input type="radio" class="cate" name="cate" id="<%=list.get(i).getCateNo()%>" value="<%= list.get(i).getCliCate() %>"><label for="<%=list.get(i).getCateNo()%>" ><%= list.get(i).getCliCate() %></label>
                            </li>
                        <%} %>
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
                        <span id="cli-pick">클리닉을 선택해주세요</span>
                    </div>

                    <!--해당 카테고리 클리닉 출력 영역 div-->
                    <div id="content-part" align="center">

                        <!--클리닉 출력 테두리 div-->
                        <div class="content-border">

                            <!--클리닉 출력 ul-->
                            <ul class="content-list">
                            

                                
                            </ul>
                        </div>
                    </div>
                </div>

                <script>
                    
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
                            <span id="pick-date">예약일시를 선택해주세요</span>
                        </div>

                        <!--예약일시 영역 div-->
                        <div id="cli-date" align="left">
                            <div id="date-inner" align="center">
                            <div id="calendar"></div>
                            </div>

                            <div id="time-inner">
                                <div class="time-border">
                                    <ul>
                                        <li class="time-content" align="center">
                                            <a href="#"><p>11:30</p></a>
                                        </li>

                                        <li class="time-content" align="center">
                                            <a href="#"><p>12:30</p></a>
                                        </li>

                                        <li class="time-content" align="center">
                                            <a href="#"><p>13:30</p></a>
                                        </li>

                                        <li class="time-content" align="center">
                                            <a href="#"><p>11:30</p></a>
                                        </li>

                                        <li class="time-content" align="center">
                                            <a href="#"><p>12:30</p></a>
                                        </li>

                                        <li class="time-content" align="center">
                                            <a href="#"><p>13:30</p></a>
                                        </li>

                                        <li class="time-content" align="center">
                                            <a href="#"><p>11:30</p></a>
                                        </li>

                                        <li class="time-content" align="center">
                                            <a href="#"><p>12:30</p></a>
                                        </li>

                                        <li class="time-content" align="center">
                                            <a href="#"><p>13:30</p></a>
                                        </li>
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <br clear="both">
                </div>
            </div>

            <script>
                $(function(){
                    $('.cate').click(function(){
                    
                        // 카테고리 선택 시 해당하는 카테고리의 클리닉 출력
                        $.ajax({
                                url:'ajaxList.cli',
                                data:{cateNo:$('input[name=cate]:checked').attr('id')},
                                success:function(result){
        
                                    let resultStr = '';
        
                                    for(let i in result){
                                        
                                        resultStr += '<li class="content-cli">'
                                            +'<div class="cli-img">' 
                                                +'<img src="https://i.pinimg.com/736x/47/a6/48/47a64863fece924aaf2cc07fa6cfc6e7.jpg" alt=""> <br>' 
                                                +'<button>자세히 보기</button>'
                                            + '</div>'
        
                                            +'<div class="cli-des" align="left">'
                                                    +'<div class="cli-top">'
                                                        +'<span class="cli-name title">'
                                                            +result[i].cliName
                                                        +'</span>'
                                                    +'</div>'

                                                    +'<div class="cliNo">'
                                                        +'<span class="cli-no">'
                                                            +result[i].cliNo
                                                        +'</span>'
                                                    +'</div>'    
        
                                                    +'<div class="cli-location">'
                                                            +'<span>'
                                                                +result[i].hosNo
                                                            +'</span>'
                                                    +'</div>'
        
                                                    +'<div class="cli-score">'
                                                            +'<span class="material-symbols-outlined">grade</span>'
                                                            +'<span>' + '별점' +'</span>'
                                                    +'</div>'
        
                                                    +'<div class="cli-cate">'
                                                            +'<span>'
                                                                +result[i].cateName
                                                            +'</span>'
                                                    +'</div>'
        
                                                    +'<div class="cli-price">'
                                                            +'<span>'
                                                                +result[i].cliPrice
                                                            +'</span>'
                                                    +'</div>'
                                            
                                            +'</div>' 
                                            
                                            +'<br clear="both">'
                                                
                                            +'</li>'
                                    }
                                    $('.content-list').html(resultStr);

                                    //자세히보기 버튼 클릭 시 상세보기 페이지로 이동
                                    $('.cli-img > button').click(function(){
                                        location.href='<%=contextPath%>/cliDetail.cli?cno=' + $('.cli-no').text();
                                        //console.log($('.cli-no').text());
                                    })

                                        //li클릭 시 색깔 바뀌는 이벤트
                                        $('.content-cli').click(function(){
                        
                                        if($(this).css('background-color', 'salmon')){
                                            $(this).css('background-color', 'bisque');

                                            $(this).siblings().css('background-color', 'salmon');
                                        }

                                        // 카테고리 선택 후 클리닉 선택 시 "클리닉을 선택해주세요"에 해당 클리닉명과 병원명을 띄우기
                                        //console.log($(this).children().children());
                                        $('#cli-pick, #sel-cli').text($(this).children().children().eq(3).text() + " : " + $(this).children().children().eq(5).text());

                                        console.log($(this).children().children().eq(3).text());
                                        
                                        // 클리닉 선택 후 예약일시가 보여짐
                                        $('#cli-date').css('visibility', 'visible');

                                        // console.log($('.cli-cate > span').val());
                                    })
                                },
                                error:function(){
                                    console.log('실패');
                                }
                            })
    
                            // 카테고리 선택 시 "카테고리를 선택해주세요"에 해당 카테고리를 띄우기
                            $('#cate-pick, #sel-cate').text($('input[name=cate]:checked').val());
        
                            // 카테고리 선택 후 클리닉 선택창을 띄우기
                            $('#content-part').css('display', 'block');
                    })

                

                //li클릭 시 색깔 바뀌는 이벤트
                $('.time-content').click(function(){
                        if($(this).css('background-color', 'bisque')){
                        $(this).css('background-color', 'salmon');

                        $(this).siblings().css('background-color', 'bisque');

                        // 시간 클릭 시 "예약 일시를 선택해주세요"와 좌측 메뉴에 띄우기
                        $('#pick-date, #sel-date').append(" / " + $(this).children().text());
                    }
                })

                })
    
            </script>

            <br><br><br><br><br>

            </form>

            </div>

        </div>

    </div>

</body>
</html>