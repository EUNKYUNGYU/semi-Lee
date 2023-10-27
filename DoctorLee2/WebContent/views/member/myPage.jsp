<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/member/loginForm.css">
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>

	<%@ include file = "../common/nav2.jsp" %>
	
	 <div id="content">

        <div id="content_1">
            <p id="p11">로그인</p>
            
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

    
                    <input type="submit" id="loginbtn" value="로그인"></input>
                    </form>
                

                </div>
                
            </div>
            
        </div>
        <div id="content_3">
            <z class="z-test1" id="z11" align="center">
                <a href="#" id="register1" onclick="enrollPage();">회원가입 <br><br>
                <span id="span1">
			                    낭만닥터 이사부의 회원이 <br>
			                    되시면 홈페이지에서 제공하는 <br>
			                    온라인 서비스를 이용하실 수 있습니다.
                 </span>
            </a>
                <a href="#" id="find11" onclick="findIdPage();">아이디 찾기 <br><br>
                    <span id="span2">
			                        성함, 이메일을 통해 <br>
			                        아이디를 확인 <br>
			                        하실 수 있습니다.
                    </span>
                </a>
                <a href="#" id="find21" onclick="findPwdPage();">비밀번호 찾기 <br><br>
                    <span id="span3">
			                        아이디, 이메일을 통해 <br>
			                        임시비밀번호로 서비스를 이용 <br>
			                        하실 수 있습니다.
                     </span>

                </a>
            </z>
        </div>

    </div>
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <%@ include file="../common/footer.jsp" %>
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
        
    </script>



    
</body>
</html>