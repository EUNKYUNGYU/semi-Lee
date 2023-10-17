<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료 내역 관리 첫 파이지</title>
</head>
<style>
	div{
		box-sizing : border-box;
	}
	#mhwrap{
		width : 1000px;
		height : 1500px;
		margin : auto;
	}
	#mhwrap{
		width : 100%;
	}
	#medical-history-main{
		width : 80%;
		height : 100%;
		float : left;
	}
	#area {
		width : 20%;
		float : left;
		
	}
	.mhImg {
		width : 150px;
		height : 150px;
		margin-left : 500px;
	}
	.mh-a {
		margin-left : 530px;
	}
	
	#medical-fee,#medical-history,#certificate,#prescription{
		margin-top : 80px;
		margin-bottom : 80px;
	}
</style>
<body>
	<%@ include file="../common/navi.jsp" %>
	<div id="mhwrap">
		<div id="area">
			<%@ include file="../common/myPageNavi.jsp" %>
			
		</div>
		<div id="medical-history-main">
			<div id="medical-history">
				<img alt="진료내역" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fmedia.istockphoto.com%2Fid%2F1254373900%2Fko%2F%25EB%25B2%25A1%25ED%2584%25B0%2F%25EC%25B1%2585-%25EC%2595%2584%25EC%259D%25B4%25EC%25BD%2598.jpg%3Fs%3D1024x1024%26w%3Dis%26k%3D20%26c%3D_7tLaLqGuxrxezYvvlq-kTVNIOVkUSzRuljj0SYsrlU%3D&type=a340" class="mhImg"><br>
				<a href="#" class="mh-a">진료내역</a>
			</div>
			<hr>
	  		<div id="medical-fee">
	  			<img alt="진료비 영수증" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fmedia.istockphoto.com%2Fvectors%2Fvector-receipt-icon-flat-design-vector-illustration-vector-id655840038%3Fs%3D170667a&type=a340" class="mhImg"><br>
	  			<a href="#" class="mh-a">진료비 영수증</a>
	  		</div>
	  		<hr>
	  		<div id="certificate">
	  			<img alt="증명서 발급" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn-icons.flaticon.com%2Fpng%2F512%2F4890%2Fpremium%2F4890429.png%3Ftoken%3Dexp%3D1637601623%7Ehmac%3D7729791c65c9c350b35169a80e3bf90d&type=a340" class="mhImg"><br>
	  			<a href="#" class="mh-a">증명서 발급</a>
	  		</div>
	  		<hr>
	  		<div id="prescription">
	  			<img alt="처방전" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fmedia.istockphoto.com%2Fvectors%2Fmedical-report-prescription-checkup-icon-vector-id1165500434%3Fk%3D6%26m%3D1165500434%26s%3D170667a%26w%3D0%26h%3Dy2uhxrhVP8pjfRv8eo2AY82D1qXZiI72D3HXIGlRfwI%3D&type=a340" class="mhImg"><br>
	  			<a href="#" class="mh-a">처방전 보기</a>
	  		</div>
	  		
	  	</div>
	  	
		
	</div>
	
	
	
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>