<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
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
        #p1{
            text-align: center;
            font-size: 38px;
            font-weight: bolder;
            padding-top: 100px;
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
            height: 1000px;
            background-color: #ecf1ff;
            border-radius: 3px;
            font-size: 20px;
            text-align: center;
            padding-top: 50px;
            margin-top: 100px;
            position: relative;
        }

        #second{
            width: 1200px;
            height: 610px;
            background-color: white;
            position: absolute;
            top: 300px;
            left: 350px;
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


        #login_form_etc{
            font-size: 16px;
            margin-left: 200px;
            margin-top: 45px;
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

        /*-------------찾기-------------*/
        .z-test{
            width: 150px;
            height: 150px;
            position: relative;
            
        }
        
        #z1{
            width: 1200px;
            height: 200px;
            border : 1px solid skyblue;
            float: left;
            border-radius: 3px;
            left: 350px;
            background-color: white;
            position: absolute;
            margin-top: 400px;
            padding-top: 20px;
          
        }

        #z1 > a{
            text-decoration: none;
            color: black;
            font-size: 20px;
            padding-left: 70px;
            font-weight: bold;
            color: #1E376F;
            margin-left: 90px;
            margin-top: 20px;
            float: left;
           
        }


        #register:hover{
            font-size: larger;
        }

        #find1:hover{
            font-size: larger;
        }

        #find2:hover{
            font-size: larger;
        }

    </style>
</head>
<body>

	<%@ include file = "../common/nav2.jsp" %>
	
	 <div id="content">

        <div id="content_1">
            <p id="p1">로그인</p>
            
        </div>
            
           
         
        <div id="content_2">
            <div class="outer">
                <div class="positioning" id=first></div>

                    <div class="positioning" id=second>홈페이지의 다양한 정보와 맞춤 서비스를 <br>
                    	이용하시려면 로그인이 필요합니다.

                    
                    <form action="<%=contextPath%>/loginForm.me" method="post" id="login_form_input">
                        
                        <div id="id_1" align="center">
                            <input type="text" id="id_1" name="memId" placeholder="아이디" required>
                        </div>
                        
                        <div id="pwd_1" align="center">
                            <input type="password" id="pwd_1" name="memPwd" placeholder="비밀번호" required>
                        </div>

                        <div id="login_form_etc" align="center">
                            <div><input type="checkbox" name="checkedId" value="checkedId">아이디 저장</div>
                        </div>
    
                    <input type="submit" id="loginbtn" value="로그인"></input>
                    </form>
                

                </div>
                
            </div>
            
        </div>
        <div id="content_3">
            <z class="z-test" id="z1" align="center">
                <a href="#" id="register" onclick="enrollPage();">회원가입 <br><br>
                <span style="font-size: 13px; font-weight: lighter; color: gray;">
                    낭만닥터 이사부의 회원이 <br>
                    되시면 홈페이지에서 제공하는 <br>
                    온라인 서비스를 이용하실 수 있습니다.</span>
            </a>
                <a href="#" id="find1" onclick="findIdPage();">아이디 찾기 <br><br>
                    <span style="font-size: 13px; font-weight: lighter; color: gray;">
                        성함, 이메일을 통해 <br>
                        아이디를 확인 <br>
                        하실 수 있습니다.</span>
                </a>
                <a href="#" id="find2" onclick="findPwdPage();">비밀번호 찾기 <br><br>
                    <span style="font-size: 13px; font-weight: lighter; color: gray;">
                        아이디, 이메일을 통해 <br>
                        임시비밀번호로 서비스를 이용 <br>
                        하실 수 있습니다. </span>

                </a>
            </z>
        </div>

    </div>
    
    <script>
        function enrollPage(){
            location.href = "<%=contextPath%>/enrollForm.me";
        }
        
        function findIdPage(){
            location.href = "<%=contextPath%>/findIdForm.me";
        }
        
        function findPwdPage(){
            location.href = "<%=contextPath%>/findPwdForm.me";
        }

        function validate(){
            var memId = document.getElementById('memId').value;

            var regExp = /^[a-zA-Z][a-zA-Z0-9]{4,14}$/;

            if(!regExp.test(userId.value)){
                alert('아이디를 다시 확인해주세요.');
                userId.select();
                userId.value= '';
                return false;
            }
        }
    </script>



    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>