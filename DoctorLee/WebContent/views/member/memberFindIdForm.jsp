<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기폼</title>
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
        #content_2{height: 60%;}
        #content_3{height: 20%;}
        


        /*--------------------p태그---------------------*/
        #p11{
            text-align: center;
            font-size: 38px;
            font-weight: bolder;
            padding-top: 90px;
        }

        /*-------------가운데 박스--------------*/
        .positioning{
            border : 1px solid skyblue;
        }

        #first{
            width: 1300px;
            height: 685px;
            background-color: #ecf1ff;
            border-radius: 3px;
            font-size: 20px;
            text-align: center;
            padding-top: 50px;
            margin-top: 80px;
            position: relative;
        }

        #second{
            width: 1200px;
            height: 540px;
            background-color: white;
            position: absolute;
            top: 290px;
            left: 360px;
            border-radius: 3px;
            text-align: center;
            font-size: 17px;
            padding-top: 80px;
            
            
        }

      
       
        /*-----------아이디 박스---------*/
        
        #id_1, #pwd_1{
            width: 300px;
            height: 55px;
            z-index: 10;
            margin-bottom: 20px;
            margin-top: 30px;
            font-size: 14px;
        }


        #login_form_etc{
            font-size: 16px;
            margin-left: 200px;
            margin-top: 40px;
        }
        
        
        #loginbtn{
            background-color: #1E376F;
            color: white;
            margin-top: 100px;
            width: 300px;
            height: 55px;
            border-radius: 3px;
            border: 2px solid #1E376F;
            font-size: 15px;
        }

        #id_1 input{
            border: 2px solid rgb(138, 138, 138);
            border-radius: 3px;
        }

        #pwd_1 input{
            border: 2px solid rgb(138, 138, 138);
            border-radius: 3px;
        }

        #id_1 input:focus{
            border-color: #1E376F;
            outline: none;
        }
        #pwd_1 input:focus{
            border-color: #1E376F;
            outline: none;
        }


    </style>
</head>
<body>

	<%@ include file = "../common/nav2.jsp" %>
	
	<div id="content">

        <div id="content_1">
            <p id="p11">아이디 찾기</p>
            
        </div>
            
           
         
        <div id="content_2">
            <div class="outer">
                <div class="positioning" id=first></div>

                    <div class="positioning" id=second>아이디를 찾고자하는 이름과 이메일을 입력해주세요.
                    

                        
                    <form action="login.do" method="post" id="login_form_input">
                        
                        <div id="id_1" align="center">
                            <input type="text" id="id_1" name="userId" placeholder="이름" required>
                        </div>
                        
                        <div id="pwd_1" align="center">
                            <input type="password" id="pwd_1" name="userPwd" placeholder="이메일" required>
                        </div>

                       
    
                    </form>
                
                    <input type="button" id="loginbtn" value="확인"></input>

                </div>
                
            </div>
            
        </div>
       
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <%@ include file="../common/footer.jsp" %>

</body>
</html>