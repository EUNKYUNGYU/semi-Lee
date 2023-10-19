/**
 * 
 */
let contextPath = '/DoctorLee';

var hosNo = location.search.substring(5);
var rsvt_date = '';
var guest_rsvt_date = '';

document.addEventListener('DOMContentLoaded', function() {

   var calendarEl = document.getElementById('calendar');
   var calendar = new FullCalendar.Calendar(calendarEl, {
     initialView: 'dayGridMonth',
	 locale: 'ko',
	 firstDay: 1,
	 headerToolbar: {
	  left: 'prev',
	  center: 'title',
	  right: 'next'
	 },
	 dateClick: function(info){
	   	  rsvt_date = info.dateStr;
	   	info.dayEl.style.backgroundColor = 'rgba(79, 137, 255, 0.4)';
	  // console.log(info.dateStr);
	  //info.dayEl.addClass('blue');
	    
	  //console.log(day);
	  //console.log(dayEl); 
		}

   });
     
   calendar.render();
   
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

function loginUserIsNull(){
	alert('로그인 후 이용 가능한 서비스');
	window.location.href = contextPath + '/login.me';
	
};

/*
var rsvt = {
	date: window.rsvt_date,
	h: $rsvtH,
	mi: $rsvtM,
	name: $('input[name=rsvtName]').val(),
	info: $('input[name=rsvtInfo]').val(),
	doc: $('select[name=rsvtDoc] option:selected').val(),
	hno: hosNo
}
console.log(rsvt);
*/

function rsvt(){
	
	var str = '';
	if(window.rsvt_date == str){
		alert('날짜를 선택해주세요.');
		
	} else if($('input[name=rsvtName]').val() == str){
		alert('예약자명을 입력해주세요');
		
	} else {
		$.ajax({
			url: 'hosRsvt.mem',
			type: 'post',
			// async : true,
			data: {
				rsvtDate: window.rsvt_date,
				rsvtH: $('select[name=rsvtH] option:selected').text().replaceAll('\t', '').replaceAll('\n', ''),
				rsvtM: $('select[name=rsvtM] option:selected').text().replaceAll('\n', '').replaceAll('\t', ''),
				rsvtName: $('input[name=rsvtName]').val(),
				rsvtInfo: $('input[name=rsvtInfo]').val(),
				rsvtDoc: $('select[name=rsvtDoc] option:selected').val(),
				hno: hosNo
			},
			success: function(result){
				console.log(result);
				var flag = result['checkRsvtResult'];
				//console.log(result.rsvtInfo);
				
			if(result != null){
				if(flag > 0){
					alert('다른 날짜(시간)를 선택해주세요');
					
				} else{
						$('#rsvtModal').modal('show');
						$('#rsvtModal .modal-title').children().eq(0).filter('b').text(result['rsvtName']);
						$('#rsvtModal .modal-body').children().eq(0).append(result['rsvtNo']);
						$('#rsvtModal .modal-body').children().eq(1).append(result['rsvtDate'] + ", " + result['rsvtTime']);
						$('#rsvtModal .modal-body').children().eq(2).append(result['rsvtInfo']);
					}
				}
				// 성공 시 
				//data-toggle="modal" data-target="#rsvtModal" 추가해서 모달 띄우기
			},
			error: function(){
				alert('현재 예약 불가');
				// console.log(hosNo);
				// console.log(rsvt_date);
				// console.log(hosNo);
				// console.log(rsvtDate);
			}
		});
		return false;
	}
	return true;
};

