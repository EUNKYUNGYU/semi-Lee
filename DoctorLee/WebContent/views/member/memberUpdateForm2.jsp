<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
 <style>
        div{
            
            box-sizing: border-box;
        }

        #wrap{
            width: 100%;
            height: 1800px;
            margin: auto;
        }

        #wrap > div {
            width: 100%;
        }

        #header{
            height: 5%;
        }

        #content{
            height: 95%;
        }

        #content > div{
            height: 100%;
            float: left;
        }

        #content_1{
            width: 20%;
            height: 100%;
        }

        #content_2{
            width: 80%;
            height: 100%;
        }

        /*-----------------------------------------------*/
        h1{
            text-align: center;
        }

        #p1{
            text-align: left;
            font-size: 15px;
            color: #1E376F;
            font-weight: 600;
            padding-top: 30px;
            padding-left: 380px;
        }

        /*-----------------------------------------------*/
        #checked_id{
            margin-left: 550px;
            margin-top: -50px;
        }
       
        /*-----------버튼---------*/
        #register{
            background-color: #1E376F;
            color: white;
            border: 1px solid #1E376F;
            border-radius: 3px;
            width: 140px;
            height: 50px;
            font-size: 17px;
            margin-top: 80px;
            
            
        }
        #cancel{
            background-color: white;
            color: #1E376F;
            border: 1px solid #1E376F;
            border-radius: 3px;
            width: 140px;
            height: 50px;
            font-size: 17px;
            margin-right: 40px;
            
        }

        #cancel:hover{
            background-color: #1E376F;
            color: white;
        }

        #button{
            margin-left: 550px;
            margin-top: 50px;

        }
        
        #height, #weight{
        	text-align: right;
        }
    </style>
</head>
<body>

	
	
	
	<div id="wrap">
        <div id="header">
        	<%@ include file = "../common/nav2.jsp" %>
        </div>

		
	
        <div id="content">
            <div id="content_1">
            	<%@ include file = "../common/myPageNavi.jsp" %>
            </div>
            
            <%
				//System.out.println(loginUser);
				String memName = loginUser.getMemName();
				String nickName = loginUser.getNickName();
				String phone = loginUser.getPhone();
				String email = loginUser.getEmail();
			%>
            
            <div id="content_2">
                <h1>마이페이지</h1>
                <hr>
                <p id="p1">
                    * 최선의 서비스 제공을 위해서 회원정보를 최신정보로 변경하여 주시기 바랍니다. <br>
                    * 아래 회원정보는 홈페이지 회원가입자에 대한 개인정보이며 정보보호를 위해 암호화하여 관리합니다. <br>
                    * 온라인 회원가입정보와 병원내 진료시스템 개인정보는 별도로 관리되므로 온라인 회원정보가 변경될 경우 <br>
                    * 콜센터(☎1577-0000)에 연락하시어 진료시스템상 개인정보도 변경해 주십시오.       
                </p>
                <br>
                <hr>

                <form name="login" action="index.jsp" method="post" class="formfont">
                    
                    <h2>회원정보수정</h2>
                    <hr>
                    <br>
                    
                    이름
                    <br><br>
                    <input type="text" name="memName" value="<%= memName %>" class="box"> <br>
                    <br>
                    <hr>
                    <br>
                    
                    이메일
                    <br><br>
                    <input type="email" name="email" value="<%= email %>"placeholder="email@gmail.com" class="box">
                    <br><br>
                    <hr>
                    <br>
                    휴대전화
                    <br><br>
                    <input type="text" name="phone" value="<%= phone %>" placeholder="-를 제외하고 입력하시오." class="box">
                    <br><br><br>
                    <hr>                       
                    <h2>건강관리입력사항 </h2>
                    <hr>
                    <br>
                    키
                    <br><br>
                    <input type="text" placeholder="cm" class="box" id="height" name="height">
                    <br><br>
                    <hr>
                    <br>
                    몸무게
                    <br><br>
                    <input type="text" placeholder="kg" class="box" id="weight" name="weight">
                    <br><br>
                    <hr>
                    <br>
                    질병
                    <br><br>
                    <input type="checkbox" value="암">암
                    <input type="checkbox" value="간질환">간질환
                    <input type="checkbox" value="심장질환">심장질환
                    <input type="checkbox" value="뇌혈관질환">뇌혈관질환
                    <br>
                    <input type="checkbox" value="당뇨병">당뇨병
                    <input type="checkbox" value="고혈압">고혈압
                    <input type="checkbox" value="호흡기질환">호흡기질환
                    <input type="checkbox" value="기타">기타
                    <br><br>
                    <hr>
                    <br>
                    흡입 알레르기
                    <span style="font-size: 14px;">(중복 선택 가능)</span>
                    <br><br>
                    <input type="checkbox" value="곤충류">곤충류
                    <input type="checkbox" value="진드기류">진드기류
                    <input type="checkbox" value="목초화분">목초화분
                    <input type="checkbox" value="비듬&상피세포">비듬&상피세포
                    <br>
                    <input type="checkbox" value="잡초화분">잡초화분
                    <input type="checkbox" value="수목화분">수목화분
                    <input type="checkbox" value="곰팡이류">곰팡이류
                    <input type="checkbox" value="기타">기타
                    <br><br>
                    <hr>
                    <br>
                    음식물 알레르기
                    <span style="font-size: 14px;">(중복 선택 가능)</span>
                    <br><br>
                    <input type="checkbox" value="곡류">곡류
                    <input type="checkbox" value="해산물">해산물
                    <input type="checkbox" value="채소류">채소류
                    <input type="checkbox" value="동물성식품">동물성식품
                    <br>
                    <input type="checkbox" value="과일류">과일류
                    <input type="checkbox" value="견과류">견과류
                    <input type="checkbox" value="기타">기타
                    <br><br>
                    <hr>
                    <span id="button">
                        <input type="button" id="cancel" value="비밀번호 변경" onclick="updatePwd();"></input>
                        <button type="submit" id="register" onclick="mainPage();">확인</button>
                    </span>

                </form>
               
            </div>
        </div>
    </div>

	<script>
		function mainPage(){
			location.href = "<%=contextPath%>/myPage.me";
		}
		
		function updatePwd(){
			location.href = "<%=contextPath%>/updatePwd.me";
		}
	</script>

</body>
</html>