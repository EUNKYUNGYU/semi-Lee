<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="resources/css/member/findId.css">
<meta charset="UTF-8">
<title>아이디찾기폼</title>
</head>
<body>

	<%@ include file = "../common/nav2.jsp" %>
	
	<div id="content">

        <div id="content_1">
            <p id="p11">아이디 찾기</p>
            
        </div>
            
           
         
        <div id="content_2">
            <div class="outer">
                <div class="positioning" id="first"></div>

                    <div class="positioning" id="second">아이디를 찾고자하는 이름과 이메일을 입력해주세요.
                    

                        
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