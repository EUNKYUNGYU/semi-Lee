<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.cli.model.vo.*, java.util.ArrayList" %>    
<%
	Clinic c = (Clinic)request.getAttribute("c");
	ArrayList<CliResDate> dateList = (ArrayList<CliResDate>)request.getAttribute("dateList");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 예약 페이지</title>

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
        validRange: function(nowDate) {
            return {
                start: nowDate
            };
        },
        events:[
            <% for(CliResDate cd : dateList) {%>
            {
                title:'예약 가능',
                start:'<%=cd.getCliDate()%>',
                color:'#1E376F'
            },
            <% }%>
        ],

        dateClick: function(info){

            $('.time-border').css('display', 'block');

            // 달력 클릭 시 선택한 날짜 출력하기
            $('#resDate').val((info.dateStr).replaceAll('-', '.'));
            $('#resTime').val(null);

            var days = document.querySelectorAll(".day-color");
            days.forEach(function(day){
                day.classList.remove("day-color");
            })
            info.dayEl.classList.add("day-color");

            // 날짜 클릭 시 시간 출력
            $.ajax({
                url:'ajaxTime.cli',
                data:{cliNo:<%=c.getCliNo()%>},
                success:function(result){
                    let resultStr = '';

                    for(let i in result){
                        resultStr += '<li class="time-content" align="center">'
                                        +'<a>'
                                            +'<p>'
                                                +result[i].cliTime
                                            +'</p>'
                                        +'</a>'
                                    + '</li>'
                    }
                    $('.time-list').html(resultStr);

                    $('.time-content').click(function(){
                        $('#resTime').val($(this).children().text());

                        $(this).css('background-color', 'salmon');

                        $(this).siblings().css('background-color', 'bisque');
                    })
                },
                error:function(){
                    console.log('실패');
                }
            })
        }
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
        height: 1050px;
        margin-top: 50px;
        border: 1px solid red;
    }

    .content > div{
        float: left;
    }

    #cou_navi{
        height: 1000px;
    }

    /*클리닉 정보 출력 영역 div*/
    #cli-content {
        width: 1000px;
        margin-left: 100px;
        height: 1000px;
    }

    /*클리닉 예약 날짜 출력 영역 div*/
    #cli-top{
        border: 1px solid rosybrown;
        height: 582px;
        width: 1100px;
    }

    #cli-top > div{
        float: left;
    }

    #date-inner{
        width: 700px;
        height: 582px;
        border: 1px solid;
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
        
        /*날짜 선택 시 색깔 넣기*/
        .day-color{
            background-color: #1E376F !important;
            font-weight: 900;
        }
    
    /*클리닉 예약 시간 출력 영역 div*/
        #time-inner{
            width: 300px;
            height: 582px;
            border-right : 1px solid;
            border-bottom: 1px solid;
        }

        .time-border{
            overflow: auto;
            height: 580px;
            display: none;
        }

        .time-border > ul{
            list-style: none;
        }

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

    #cli-middle > h4{
        margin-top: 30px;
        margin-left: 10px;
    }

    /*클리닉 예약자 정보 입력 영역 div*/
    #cli-bottom{
        border: 1px solid pink;
        height: auto;
    }

    #cli-bottom > input{
        display: block;
        margin-bottom: 10px;
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
    
                <!--클리닉 예약 출력 영역 div-->
                <div id="cli-content" align="left">
    
                    <form action="insertCliRes.cli" method="post">
                        
                        <div id="cli-top">

                            <!--클리닉 예약 날짜 출력 영역 div-->
                            <div id="date-inner" align="center">
                                <div id="calendar"></div>
                            </div>

                            <!--클리닉 예약 시간 출력 영역 div-->
                            <div id="time-inner">
                                <div class="time-border">
                                    <ul class="time-list">
                                        <h5>시간을 선택하세요</h5>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <br clear="both">
        
                        <!--클리닉 예약 정보 작성 영역 div-->
                        <div id="cli-bottom">
                            <h4>예약 정보</h4>
                            <span>클리닉명 : </span>
                            <input type="text" id="cliName" value="<%= c.getCliName() %>" readonly>

                            <span>병원명 :</span>
                            <input type="text" id="hosNo" value="<%= c.getHosNo() %>" readonly>

                            <span>가격 : </span>
                            <input type="text" id="cliPrice" value="<%= c.getCliPrice() %>" readonly>

                            <input type="hidden" name="userNo" value="<%=loginUser.getMemNo()%>">
                            
                            <span>예약자명 :</span>
                            <input type="text" id="userName" value="<%= loginUser.getMemName()%>" readonly>
                            
                            <span>예약자 전화번호 : </span>
                            <input type="text" id="userPhone" value="<%=loginUser.getPhone()%>"" readonly>
                            
                            <span>예약일 : </span>
                            <input type="text" id="resDate" name="resDate" readonly required>

                            <span>예약시간 : </span>
                            <input type="text" id="resTime" name="resTime" readonly required>
                        </div>

                        <div id="res-part" align="center">
                            <button type="submit">예약하기</button>
                        </div>
                    </form>
    
                </div>
    
            </div>
    
        </div>

        <script>
            $(function(){
                //li클릭 시 색깔 바뀌는 이벤트
                $('.time-content').click(function(){
                    if($(this).css('background-color', 'bisque')){
                        $(this).css('background-color', 'salmon');

                        $(this).siblings().css('background-color', 'bisque');
                    }
                })
            })
        </script>
    
</body>
</html>