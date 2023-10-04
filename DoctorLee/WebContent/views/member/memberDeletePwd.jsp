<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴비밀번호확인</title>

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
            font-size: 38px;
            font-weight: bolder;
        }

        #p2{
            text-align: center;
            font-size: 23px;
            color: #1E376F;
            font-weight: 600;
            margin-top: 35px;
           
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
            
           
        }
       
        /*-------------비밀번호 창--------------*/
        #pwd{
            background-color: #ecf1ff;
           
            width: 200px;
            height: 43px;
            border: none;
            margin-left: 150px;
            padding-left: 30px;
            font-size: 15px;
            border-radius: 3px;
            border: 1px solid rgb(226, 226, 226);
            margin-top: 70px;
            
            
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
            margin-top: 30px;
            margin-left: 1300px;
        }

        #pwd_1:hover{
            background-color: #1E376F;
            color: white;
        }
       

    </style>
</head>
<body>

	<%@ include file = "../common/nav.jsp" %>
	
	 <div id="content">

        <div id="content_1"></div>
            <p id="p1">회원탈퇴</p>
            <hr style="border: 1.8px solid rgb(226, 226, 226);">
            <p id="p2">낭만닥터 이사부 회원 비밀번호 확인</p>
            <p id="p3">
                * 본인 확인을 위해서 기존 홈페이지 비밀번호를 확인합니다. <br> 
                * 기존 홈페이지 비밀번호를 입력해 주시기 바랍니다.
            </p>
            <br>
            <hr style="border: 1.8px solid #1E376F;">
            
        <div id="content_2">
            <span id="p4">비밀번호 확인</span>
            <input type="password" id="pwd" name="userPwd" placeholder="비밀번호" required>
        </div>
        <hr style="border: 1px solid rgb(226, 226, 226);">

        <div id="content_3">
            
            <button type="submit" id="pwd_1">확인</button>
        </div>
        

    </div>
    


    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>