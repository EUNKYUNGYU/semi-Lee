/**
 * 
 */
let contextPath = '/DoctorLee';

function rsvtPage(hno){
    location.href = contextPath + '/hosDetail.dy?hno=' + hno;
};

window.onload = function(){
	document.getElementById('sch_bar').addEventListener('keyup', function(e){
		if(e.keycode == 13){
			$('sch_hos button').click();
		}
	});
}