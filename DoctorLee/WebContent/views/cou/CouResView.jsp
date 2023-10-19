<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.cou.model.vo.*, java.util.ArrayList" %>    
<%
    Cou c = (Cou)request.getAttribute("c");
    ArrayList<CouResTime> list = (ArrayList<CouResTime>)request.getAttribute("list");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약 화면</title>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!--style-->
<link rel="stylesheet" href="resources/css/cou/couRes.css">

<!--fullCalendar-->
<script>

    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar'); // calendar 요소 접근
      var calendar = new FullCalendar.Calendar(calendarEl, {
        locale: 'ko', // 한국어로 설정
        headerToolbar:{ //헤드 툴바 설정
            left:'prev', // 왼쪽 : 이전 달로 가는 버튼
            center:'title', // 가운데 : 현재 위치의 년(2023)과 달(10월)을 보여줌
            right:'next' // 오른쪽 : 다음 달로 가는 버튼
        },
        validRange: function(nowDate) { // 선택 가능한 날짜 범위를 설정
            return {
                start: nowDate // 오늘부터 선택 가능
            };
        },

        events:[ // 이벤트 추가
            <% for(CouResTime ct : list) {%>
            {
                title:'예약 가능', // 달력에 표시될 이름
                start:'<%=ct.getCouDate()%>', // 시작 날짜
                color:'#1E376F' // 달력에 표시될 색상
            },
            <% } %>
        ],

        dateClick: function(info){

            // 날짜 선택 시 숨겨진 예약 시간이 보여짐
            $('.time-border').css('display', 'block');

            // 달력 클릭 시 선택한 날짜 출력하기
            $('#resDate').val((info.dateStr).replaceAll('-', '.')); // 선택한 날짜 형식 변경(예) 2023.10.19 -> 2023/10/19) : DB에는 2023/10/19 형식으로 저장되어 있음
            $('#resTime').val(null); // 날짜 선택 시 이전에 선택한 시간이 초기화됨
            $('#hiddenResTime').val(null); // 날짜 선택 시 input:hidden에 담긴 시간이 초기화됨

            var days = document.querySelectorAll(".day-color"); // style에서 .day-color 선택
            
            days.forEach(function(day){
                day.classList.remove("day-color");
            })
            info.dayEl.classList.add("day-color");

            // 날짜 클릭 시 시간 출력
            $.ajax({
                url:'ajaxTime.cou',
                data:{
                    couNo:<%=c.getCouNo()%>, // 상담사 번호 
                    resDate:$('#resDate').val() // 선택(클릭)한 날짜값이 담긴 input(#resDate)의 값
                },
                success:function(result){
                    let resultStr = '';

                    for(let i in result){
                        resultStr += '<li class="time-content" align="center">'
                                        +'<a>'
                                            +'<p>'
                                                +result[i].couTime
                                            +'</p>'
                                        +'</a>'
                                    +'</li>'    
                    }
                    $('.time-list').html(resultStr);

                    $('.time-content').click(function(){ // 시간 선택(클릭) 시
                        $('#resTime').val($(this).children().text()); // 예약 시간을 담는 input값에 선택한 시간의 값이 담김
                        $('#hiddenResTime').val($(this).children().text()); // 예약 시간을 선택 안했을 때 넘어가는 것을 방지하기 위해서 required를 준 input:hidden에도 값을 넘겨줌

                        $(this).css('background-color', '#475f94'); // 선택한 시간의 배경이 바뀜

                        $(this).siblings().css('background-color', '#1E376F'); // 선택한 시간 이외의 다른 시간들의 색상을 원래대로 돌려줌
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
    
                    <form action="insertCouRes.cou" method="post">
                        
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

                            <input type="hidden" name="couNo" value="<%=c.getCouNo()%>">

                            <input type="hidden" name="memNo" value="<%=loginUser.getMemNo()%>">

                            <span>상담사명 : </span>
                            <input type="text" id="couName" value="<%=c.getCouName()%>"  readonly>

                            <span>병원명 :</span>
                            <input type="text" id="hosNo" value="<%=c.getHosName()%>" readonly>

                            <span>가격 : </span>
                            <input type="text" id="couPrice" value="<%=c.getPrice()%>" readonly>

                            <input type="hidden" name="userNo" value="<%=loginUser.getMemNo()%>">
                            
                            <span>예약자명 :</span>
                            <input type="text" id="userName" value="<%= loginUser.getMemName()%>" readonly>
                            
                            <span>예약자 전화번호 : </span>
                            <input type="text" id="userPhone" value="<%=loginUser.getPhone()%>" readonly>
                            
                            <span>예약일 : </span>
                            <input type="text" id="resDate" name="resDate" required readonly>

                            <span>예약시간 : </span>
                            <input type="text" id="resTime" name="resTime" required readonly>
                            <input type="text" id="hiddenResTime" required>
                        </div>

                        <div id="res-part" align="center">
                            <button class="btn btn-primary" type="submit">예약하기</button>
                        </div>
                    </form>
    
                </div>
    
            </div>
    
        </div>

        <div id="footer">
            <%@ include file ="../common/footer.jsp" %>
        </div>

        <script>
            $(function(){
                //li클릭 시 색깔 바뀌는 이벤트
                $('.time-content').click(function(){
                    if($(this).css('background-color', '#1E376F')){
                        $(this).css('background-color', 'navy');

                        $(this).siblings().css('background-color', '#1E376F');
                    }
                })

                $('#res-part').click(function(){

                    if(!$('#resDate').val() && !$('#hiddenResTime').val()){
                        alert('날짜를 선택하세요');
                    } else if(!$('#hiddenResTime').val()){
                        alert('시간을 선택하세요');
                    }
                })
            })
        </script>

     
     

    
</body>
</html>