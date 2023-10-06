<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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

        #content_1{height: 20%;}
        #content_2{height: 80%;}
        


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
       
        /*-------------가운데 박스--------------*/
        .positioning{
            border : 1px solid skyblue;
        }

        #first{
            width: 1300px;
            height: 700px;
            background-color: #ecf1ff;
            border-radius: 3px;
            font-size: 27px;
            text-align: center;
            padding-top: 40px;
            margin-top: 50px;
           
        }

        #second{
            width: 700px;
            height: 300px;
            background-color: white;
            position: absolute;
            top: 400px;
            left: 610px;
            border-radius: 3px;
            text-align: center;
            font-size: 33px;
            padding-top: 80px;
            
        }

       
        /*-----------버튼---------*/
        
        #findPwd{
            background-color: rgb(255, 255, 255);
            border: 1px solid #1E376F;
            color: #1E376F;
            margin-top: 190px;
            width: 140px;
            height: 50px;
            border-radius: 3px;
            font-size: 15px;
            margin-right: 40px;
            
        }

        #loginbtn{
            background-color: #1E376F;
            color: white;
            margin-top: 190px;
            width: 140px;
            height: 50px;
            border-radius: 3px;
            border: none;
            font-size: 15px;
        }

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

        #findPwd:hover{
            background-color: #1E376F;
            color: white;
        }
</head>
<body>
	
	<%@ include file = "../common/nav2.jsp" %>
	
	<div id="content">

        <div id="content_1"></div>
            <p id="p1">아이디 찾기</p>
            
           
         
        <div id="content_2">
            <div class="outer">
                <div class="positioning" id=first>아이디는 다음과 같이 확인되었습니다. <br>
                    <span style="font-size: 18px;">인증받은 아이디는 가입한 경로에 따라 여러개일 수 있습니다.</span>

                </div>
                <div class="positioning" id=second>귀하의 아이디는 <br>
                    <span style="color: #1E376F; font-weight: bold;">user01</span> <br>
                    입니다.
                </div>
                
            </div>
        </div>
        

        <div id="content_3" align="center">
            <button id="findPwd">비밀번호 찾기</button>
            <button id="loginbtn">로그인</button>
        </div>
        

    </div>
    

    <br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>