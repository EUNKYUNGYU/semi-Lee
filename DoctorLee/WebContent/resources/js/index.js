/**
 * 
 */

var contextPath = location.pathname;

function enrollPage(){
	location.href= contextPath + 'enrollForm.me';
};

function loginPage(){
	location.href= contextPath + 'login.me';
};

// 엔터키 이벤트
window.onload = function(){
	
	document.getElementById('index_search_bar').addEventListener('keyup', function(e){
		if(e.keyCode == 13){
			document.getElementById("icon_search").click();
		}
	});
};

// 백그라운드 이미지 슬라이드
$(function(){
    $('.bxslider').bxSlider({
        auto: true, 
        speed: 500,
        pause: 5000,
        mode: 'fade',
    });
                   
})