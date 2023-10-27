/**
 * 
 */
var hosNo = location.search.substring(5);
var guest_rsvt_date = '';

document.addEventListener('DOMContentLoaded', function() {

   var calendarGuest = document.getElementById('calendarGuest');
   var calendarG = new FullCalendar.Calendar(calendarGuest, {
     initialView: 'dayGridMonth',
     locale: 'ko',
     firstDay: 1,
     headerToolbar: {
   	  left: 'prev',
   	  center: 'title',
   	  right: 'next'
     },
     dateClick: function(info){
       	  info.dayEl.style.backgroundColor = 'rgba(79, 137, 255, 0.4)';
       	  guest_rsvt_date = info.dateStr;
	}

   });
     
   calendarG.render();
 });

function guestRsvt(){
	
	var str = '';
	
	// 날짜를 선택하지 않을 경우에 대한 코드
	if(window.guest_rsvt_date == str){
		alert('날짜를 선택해주세요.');
		
	// 예약자명을 입력하지 않을 경우
	} else if($('input[name=guest_rsvtName]').val() == str){
		alert('예약자명을 입력해주세요');
	
	// 예약을 insert하기 위한 모든 조건을 충족한 경우 ajax로 통신
	} else {
		$.ajax({
			url: 'guestRsvt.dy',
			type: 'post',
			data: {
				rsvtDate_G: window.guest_rsvt_date,
				rsvtH_G: $('select[name=guest_rsvtH] option:selected').text().replaceAll('\t', '').replaceAll('\n', ''),
				rsvtM_G: $('select[name=guest_rsvtM] option:selected').text().replaceAll('\n', '').replaceAll('\t', ''),
				rsvtName_G: $('input[name=guest_rsvtName]').val(),
				rsvtInfo_G: $('input[name=guest_rsvtInfo]').val(),
				rsvtDoc_G: $('select[name=guest_rsvtDoc] option:selected').val(),
				hno: hosNo
			},
			success: function(result){
				const flag = result['checkRsvtResult'];
				
				if(result != null){

					// 예약 중복 확인 
					if(flag > 0){
						alert('다른 날짜(시간)를 선택해주세요');
						
					} else {
						alert('예약이 완료되었습니다.');
					};
				}
			},
			error: function(){
				alert('현재 예약 불가');
			}
		})
		return false;
	}
	return true;
}