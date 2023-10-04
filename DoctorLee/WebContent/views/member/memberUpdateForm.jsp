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

        /*전체를 감싸는 div 속성*/
        #content{
            width: 1800px;
            height: 500px;
            margin: auto;
        }

       

        /*세부속성*/
        #content_1, #content_2, #content_3{
            width: 100%;
        }

        
        .content_2{height: 40%;}
        #content_3{height: 50%;}

        /*-----------------content_2-----------------*/
        
        .content_2{
            width: 1200px;
            height: 800px;
            float: left;
            margin-left: 300px;
            
        }
        
        .box{
            width: 240px;
            height: 30px;
            background-color:#ecf1ff;
            border: 1px solid rgb(138, 138, 138);
            border-radius: 3px;
        }
        
        #r_id2{
            width: 100px;
            height: 30px;
            background-color: #1E376F;
            border-radius: 3px;
            color: white;
            border: none;
            font-size: 12px;
        }
        
        /*--------------------p태그---------------------*/
        #p1{
        	text-align : center;
            font-size: 38px;
            font-weight: bolder;
            
        }

        #p2{
            text-align: center;
            font-size: 15px;
            color: #1E376F;
            font-weight: 600;
            padding-top: 30px;
            padding-left: 500px;
            
           
        }
       
        /*-------------텍스트 창--------------*/
      
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
       

    </style>
</head>
<body>

	<%@ include file = "../common/myPageNavi.jsp" %>
	
	<div id="content">

        
            <p id="p1">마이페이지</p>
            <hr style="border: 1.8px solid rgb(226, 226, 226); width: 66.5%;">
            <p id="p2" style="text-align: left;">
                * 최선의 서비스 제공을 위해서 회원정보를 최신정보로 변경하여 주시기 바랍니다. <br>
                * 아래 회원정보는 홈페이지 회원가입자에 대한 개인정보이며 정보보호를 위해 암호화하여 관리합니다. <br>
                * 온라인 회원가입정보와 병원내 진료시스템 개인정보는 별도로 관리되므로 온라인 회원정보가 변경될 경우 <br>
                * 콜센터(☎1577-0000)에 연락하시어 진료시스템상 개인정보도 변경해 주십시오.       
            </p>
            
            <br>
            <hr style="border: 1.8px solid #1E376F; width: 66.5%;">
           
            
            <div class="content_2">
                
                    <form name="login" action="index.html" method="post" class="formfont">
                        <br><br>
                        <span style="font-size: 23px; font-weight: bold;">회원정보수정</span>
                        <br><br><br>
                        <hr style="border: 1px solid #1E376F;">
                        <br>
                        
                        이름
                        <br><br>
                        <input type="text" name="user_name" value="" class="box"> <br>
                        <br>
                        <hr>
                        <br>
                        생년월일
                        <br><br>
                        <select name="year" class="box">
                          <option value="">-- 선택 --</option>
                          <option value="1985">1985</option>
                          <option value="1986">1986</option>
                          <option value="1987">1987</option>
                          <option value="1988">1988</option>
                          <option value="1989">1989</option>
                          <option value="1990">1990</option>
                          <option value="1991">1991</option>
                          <option value="1992">1992</option>
                          <option value="1993">1993</option>
                          <option value="1994">1994</option>
                          <option value="1995">1995</option>
                          <option value="1992">1992</option>
                          <option value="1993">1993</option>
                          <option value="1994">1994</option>
                          <option value="1995">1995</option>
                          <option value="1996">1996</option>
                          <option value="1997">1997</option>
                          <option value="1998">1998</option>
                          <option value="1999">1999</option>
                          <option value="2000">2000</option>
                        </select>
                        
                        <select name="month" class="box">
                          <option value="">-- 선택 --</option>
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                          <option value="6">6</option>
                          <option value="7">7</option>
                          <option value="8">8</option>
                          <option value="9">9</option>
                          <option value="10">10</option>
                          <option value="11">11</option>
                          <option value="12">12</option>
                        </select>
                        <select name="day" class="box">
                          <option value="">-- 선택 --</option>
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                          <option value="6">6</option>
                          <option value="7">7</option>
                          <option value="8">8</option>
                          <option value="9">9</option>
                          <option value="10">10</option>
                          <option value="11">11</option>
                          <option value="12">12</option>
                          <option value="13">13</option>
                          <option value="14">14</option>
                          <option value="15">15</option>
                          <option value="16">16</option>
                          <option value="17">17</option>
                          <option value="18">18</option>
                          <option value="19">19</option>
                          <option value="20">20</option>
                          <option value="21">21</option>
                          <option value="22">22</option>
                          <option value="23">23</option>
                          <option value="24">24</option>
                          <option value="25">25</option>
                          <option value="26">26</option>
                          <option value="27">27</option>
                          <option value="28">28</option>
                          <option value="29">29</option>
                          <option value="30">30</option>
                          <option value="31">31</option>
                        </select>
                        <br><br>
                        <hr>
                        <br>
                        성별
                        <br><br>
                        <label for="man">남자</label>
                        <input type="radio" name="gender" value="m" id="man">
                        <label for="woman">여자</label>
                        <input type="radio" name="gender" value="m" id="woman"> <br><br>
                        <hr>
                        <br>
                        이메일
                        <br><br>
                        <input type="email" name="user_email" placeholder="email@gmail.com" class="box">
                        <br><br>
                        <hr>
                        <br>
                        휴대전화
                        <br><br>
                        <input type="text" name="user_phone" placeholder="010-****-****" class="box">
                        <br><br><br>
                        <hr style="border: 1px solid #1E376F;">                       
                        <br>
                        <span style="font-size: 23px; font-weight: bold;">건강관리입력사항</span>
                        <br><br>
                        <hr style="border: 1px solid #1E376F;">
                        <br>
                        키
                        <br><br>
                        <input type="password" placeholder="                                                     cm" class="box">
                        <br><br>
                        <hr>
                        <br>
                        몸무게
                        <br><br>
                        <input type="password" placeholder="                                                     kg" class="box">
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
                       
                       
                    </form>
                
                </div>
                
        </div>
      
       
       <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        
        <hr style="border: 1px solid rgb(226, 226, 226);">

        <div id="content_3" align="center">
            
            <input type="button" id="cancel" value="비밀번호 변경"></input>
            <button type="submit" id="register">확인</button>
        </div>
        

    </div>
    


    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	

</body>
</html>