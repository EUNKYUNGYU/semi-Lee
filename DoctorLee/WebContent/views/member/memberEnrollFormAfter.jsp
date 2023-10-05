<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 하고나서</title>

	<style>
        div{
            box-sizing: border-box;
            margin: auto;
        }

        /*전체를 감싸는 div 속성*/
        #content{
            width: 1800px;
            height: 500px;
        }

       

        /*세부속성*/
        #content_1, #content_2, #content_3{
            width: 100%;
        }

        #content_1{height: 10%;}
        #content_2{height: 40%;}
        #content_3{height: 50%;}


        /*--------------------p태그---------------------*/
        #p1{
            text-align: center;
            font-size: 32px;
            font-weight: bolder;
            margin-top: 80px;
        }

        #p2{
            text-align: center;
            font-size: 18px;
            
        }
        
        /*------------버튼------------*/
        .button{
            margin-top: 200px;
            width: 140px;
            height: 50px;
            border-radius: 3px;
            border: none;
            font-size: 15px;
            margin-top: 300px;
            
        }
        
        #home{
            background-color: white;
            border: 1px solid #1E376F;
            color: #1E376F;
        }

        #login{
            background-color: #1E376F;
            color: white;
        }

        #home:hover{
            background-color: #1E376F;
            color: white;
        }
        /*------------이미지----------*/
        #contentImg{
            width: 300px;
            margin-top: 90px;
        }
	</style>
</head>
<body>

	<%@ include file = "../common/nav.jsp" %>

	 <div id="content">

        <div id="content_1"></div>
            <p id="p1">낭만닥터 이사부에 회원가입을 해주셔서 감사합니다.</p>
            <p id="p2">
                온라인 진료 예약/조회를 비롯한 다양한 개인화 서비스 이용을 원하시면 <br>
                <span style="color: #1E376F;">환자번호 확인 절차</span>가 필요합니다.
            </p>
            
        <div id="content_2" align="center">
            <img src="https://cdn-icons-png.flaticon.com/512/5860/5860952.png" alt="회원가입성공" id="contentImg">
            


        </div>

        <div id="content_3" align="center">
            <button type="reset" class="button" id="home" onclick="mainPage();">홈으로</button>
        </div>
        
        <script>
        	function mainPage(){
        		location.href = "<%=contextPath%>/mainPage.me";
        	}
        </script>

    </div>
    


    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>