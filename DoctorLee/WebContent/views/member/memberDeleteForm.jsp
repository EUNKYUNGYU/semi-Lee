<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴폼</title>
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
        .content_2{height: 40%;}
        #content_3{height: 50%;}


        /*--------------------p태그---------------------*/
        #p1{
            text-align: center;
            font-size: 38px;
            font-weight: bolder;
        }

        #p2{
            text-align: center;
            font-size: 23px;
            color: #1E376F;
            font-weight: 600;
            
           
        }
        
        #p3{
            text-align: left;
            margin-left: 670px;
            font-size: 18px;
        }

        #p4{
            font-size: 16px;
            padding-left: 350px;
            font-size: 24px;
            font-weight: 500;
            padding-top: 100px;
            
            
           
        }
        #check1{    
            margin-top: 50px;
            margin-left: 600px;
        }
        
        #check2{
            margin-left: 35px;
        }
        #check3{
            margin-left: 600px;
        }

        #check4{
            margin-left: 35px;
        }

        /*-------------텍스트 창--------------*/
        #textcontent{
            padding: 30px;
            font-size: 15px;
            width: 780px;
            height: 200px;
            margin-left: 600px;
            margin-top: -70px;
        }
       
        /*-----------버튼---------*/
        #pwd_1{
            background-color: white;
            color: #1E376F;
            border: 1px solid #1E376F;
            border-radius: 3px;
            width: 140px;
            height: 50px;
            font-size: 17px;
            margin-top: 50px;
            margin-left: 1300px;
        }

        #pwd_1:hover{
            background-color: #1E376F;
            color: white;
        }
       
</head>
<body>

	<%@ include file = "../common/nav.jsp" %>
	
	
	<div id="content">

        <div id="content_1"></div>
            <p id="p1">회원탈퇴</p>
            <hr style="border: 1.8px solid rgb(226, 226, 226);">
            <p id="p2">낭만닥터 이사부 회원탈퇴 신청</p>
            <p id="p3">
                * 홈페이지 회원탈퇴에 대한 사유를 선택해주시기 바랍니다. <br> 
                * 기타 의견이 있으실 경우에는 작성해 주시기 바랍니다.
            </p>
            <br>
            <hr style="border: 1.8px solid #1E376F;">
           
            
            <div class="content_2">
                
                <input type="checkbox" class="check1" id="check1"><label>거주이전에 따라서 더 이상 병원 방문을 하기 어렵기 때문</label>
                <input type="checkbox" class="check1" id="check2"><label>홈페이지 서비스를 이용할 필요성을 느끼지 못해서</label> 
                <br><br>
                <input type="checkbox" class="check1" id="check3"><label>타병원을 이용하기 때문에</label>
                <input type="checkbox" class="check1" id="check4"><label>기타의견</label>
        </div>
        <div>
            <span id="p4">회원탈퇴 사유</span>
            <textarea id="textcontent" placeholder="회원탈퇴 사유를 작성해주시면 더욱 발전된 낭만닥터 이사부가 되겠습니다." cols="30" rows="10" style="resize: none;"></textarea>
        </div>

       
        <br><br><br><br>
        <hr style="border: 1px solid rgb(226, 226, 226);">

        <div id="content_3">
            
            <button type="submit" id="pwd_1">신청</button>
        </div>
        

    </div>
    


    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>