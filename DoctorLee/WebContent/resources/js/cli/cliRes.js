//fullcalendar
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
          <% for(CliResTime ct : list) {%>
          {
              title:'예약 가능',
              start:'<%=ct.getCliDate()%>',
              color:'#1E376F'
          },
          <% }%>
      ],

      dateClick: function(info){

          $('.time-border').css('display', 'block');

          // 달력 클릭 시 선택한 날짜 출력하기
          $('#resDate').val((info.dateStr).replaceAll('-', '.'));
          $('#resTime').val(null);
          $('#hiddenResTime').val(null);

          var days = document.querySelectorAll(".day-color");
          days.forEach(function(day){
              day.classList.remove("day-color");
          })
          info.dayEl.classList.add("day-color");

          // 날짜 클릭 시 시간 출력
          $.ajax({
              url:'ajaxTime.cli',
              data:{
                  cliNo:<%=c.getCliNo()%>,
                  resDate:$('#resDate').val()},
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
                      $('#hiddenResTime').val($(this).children().text());

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

  // etc
  $(function(){
    //li클릭 시 색깔 바뀌는 이벤트
    $('.time-content').click(function(){
        if($(this).css('background-color', 'bisque')){
            $(this).css('background-color', 'salmon');

            $(this).siblings().css('background-color', 'bisque');
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