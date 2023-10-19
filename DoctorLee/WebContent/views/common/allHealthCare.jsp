<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강 관리 방법 페이지 </title>

</head>
<style>
	div{
		box-sizing : border-box;
	}
	#health-care-title{
		margin-top : 70px;
		margin-bottom : 70px;
		text-align : center;
	}
	#outer{
		width : 1000px;
		height : 1200px;
		margin : auto;
		
	}
	#outer{
		margin-bottom : 300px;
	}
	
	#food{
	
		height : 33%;
		background-color : #1E376F;
		margin-bottom : 50px;
		margin-top : 50px;
	}
	#light-health{
		height : 33%;
		background-color : #1E376F;
		margin-bottom : 50px;
		margin-top : 50px;
	}
	#prevention{
		margin-top : 50px;
		height : 34%;
		background-color : #1E376F;
		
	}
	#food > div,#light-health >div,#prevention > div{
		height : 100%;
	}
	.food-area{
		width : 33%;
		float : left;
	}
	h4{
		color : white;
		
	}
	#outer img{
		cursor : pointer;
		width : 200px;
		height : 200px;
		margin-left : 30px;
		display :block;
		float : left;
		
	}
	.food-area h6{
		color:white;
	}
	.food-area >.bx-wrapper {
		height :250px;
		background-color : #1E376F;
	}
	#food h4,#food h6,#light-health h4,#light-health h6{
		text-align : center;
	}
	#prevention h4,#prevention h6{
		text-align : center;
	}
	

</style>
<body>
	<%@ include file="../common/navi.jsp" %>
	
	<h2  id="health-care-title">건강 관리 방법 페이지</h2>
	<hr>
	<div id="outer">
		<div id="food">
			<h4>음식</h4>
			<div class="food-area">
				<ul class=food-slider>
					<li><img alt="음식영상추천" src="https://i.ytimg.com/vi/BOXjLqfUhG8/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBDK69hEDLGtv93oAPsre02TdkXqg" onclick="location.href='https://www.youtube.com/watch?v=BOXjLqfUhG8'"><br></li>
					<li><img alt="음식영상추천" src="https://i.ytimg.com/vi/YAesx4AeVlM/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLD67ejsAlj6yYl9yu5cMUAE11sI3w" onclick="location.href='https://www.youtube.com/watch?v=YAesx4AeVlM'"></li>
				</ul>
				<h6>염증에 좋은음식</h6>
			</div>
			<div class="food-area">
				<ul class=food-slider>
					<li><img alt="음식영상추천" src="https://i.ytimg.com/vi/Rl9r-N4lbh4/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCsgl5YfJbFIweFsCVpT8-sVlcG-A" onclick="https://www.youtube.com/watch?v=6delw0CaLOM'"></li>
					<li><img alt="음식영상추천" src="https://i.ytimg.com/vi/PEs3BCcZUPw/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLA2ycaUacahdEP9wFmt9cpvqWxSCQ" onclick="location.href='https://www.youtube.com/watch?v=PEs3BCcZUPw'"></li>
				</ul>
				<h6>아침식사에 좋은음식</h6>
			</div>
			<div class="food-area">
				<ul class=food-slider>
					<li><img alt="음식영상추천" src="https://i.ytimg.com/vi/6delw0CaLOM/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBhk0fwGwetKS8cfhI7Cc3DyjaZcw" onclick="location.href='https://www.youtube.com/watch?v=Rl9r-N4lbh4'"></li>
					<li><img alt="음식영상추천" src="https://i.ytimg.com/vi/6tx2pucfOdY/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBW2aJUXqrGYxHQVYbyVT1sY23c7g" onclick="https://www.youtube.com/watch?v=6tx2pucfOdY'"></li>
				</ul>
				<h6>눈에 좋은음식</h6>
			</div>
		</div><hr>
		
		<div id="light-health">
			<h4>간단한 운동</h4>
			<div class="lh-area">
				<ul class="health-slider">
					<li><img alt="운동추천영상" src=""></li>
					<li><img alt="운동추천영상" src=""></li>
				</ul>
			</div>
			<div class="lh-area"></div>
			<div class="lh-area"></div>
		</div><hr>
		
		<div id="prevention">
			<h4>예방</h4>
			<div class="prevention-area"></div>
			<div class="prevention-area"></div>
			<div class="prevention-area"></div>
		</div>
	
	</div>
	<script>
		$(function(){
			$('.food-slider').bxSlider({
				auto : true,
				speed:500,
				pause:5000,
				mode : 'fade',
				
			});
		})
		
	</script>
	
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>