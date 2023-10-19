<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/member/enrollAfter.css">
<meta charset="UTF-8">
<title>회원가입 하고나서</title>
</head>
<body>

	<%@ include file = "../common/nav2.jsp" %>

	 <div id="content">

        <div id="content_1"></div>
            <p id="p11">낭만닥터 이사부에 회원가입을 해주셔서 감사합니다.</p>
            <p id="p21">
                온라인 진료 예약/조회를 비롯한 다양한 개인화 서비스 이용을 원하시면 <br>
                <span id="span1">환자번호 확인 절차</span>가 필요합니다.
            </p>
            
        <div id="content_2" align="center">
            <img src="https://cdn-icons-png.flaticon.com/512/5860/5860952.png" alt="회원가입성공" id="contentImg">
            


        </div>

        <div id="content_3" align="center">
            <button type="reset" class="button1" id="home" onclick="mainPage();">홈으로</button>
        </div>
        <br><br><br><br><br><br><br><br>
        <%@ include file="../common/footer.jsp" %>
        
        <script>
        	function mainPage(){
        		location.href = "<%=contextPath%>/mainPage.me";
        	}
        </script>

    </div>
    



</body>
</html>