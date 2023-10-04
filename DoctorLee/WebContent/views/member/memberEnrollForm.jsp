<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
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

        .auto{
            overflow: auto;
            width: 1200px;
            height: 250px;
            border: 2px solid rgb(235, 235, 235);
        }
        .auto2{
            overflow: auto;
            width: 1200px;
            height: 100px;
            border: 2px solid rgb(235, 235, 235);
        }
        
        /*--------------------p태그---------------------*/
        #p1{
            text-align: center;
            font-size: 38px;
            font-weight: bolder;
            padding-top : 30px
        }

        #p2{
            text-align: center;
            font-size: 18px;
            color: #1E376F;
            font-weight: 600;
            padding-top: 30px;
            
           
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

	<%@ include file = "../common/nav.jsp" %>
	
	 <div id="content">

        <div id="content_1"></div>
            <p id="p1">회원가입</p>
            <hr style="border: 1.8px solid rgb(226, 226, 226);">
            <p id="p2">낭만닥터 이사부의 회원이 되시면 다양한 정보와 맞춤 서비스를 이용하실 수 있습니다.</p>
            
            <br>
            <hr style="border: 1.8px solid #1E376F;">
           
            
            <div class="content_2">
                
                    <form id="enroll-form" action="<%=contextPath%>/insert.me" method="post" class="formfont">
                        <br><br>
                        <span style="font-size: 23px; font-weight: bold;">기본입력사항(필수)</span>
                        <br><br><br>
                        <hr style="border: 1px solid #1E376F;">
                        <br>
                        아이디*
                        <br><br>
                        <input type="text" name="user_ID" id="r_id1" class="box">
                        <input type="button" name="user_IDcheck" value="중복확인" id="r_id2">
                        <br><br>
                        <span style="font-size: 14px;">아이디는 영문 대/소문자, 숫자 조합하여 5 ~ 20자리</span>
                        <br><br>
                        <hr>
                        <br>
                        비밀번호*
                        <br><br>
                        <input type="password" name="user_PW1" class="box"><br>
                        <br>
                        <span style="font-size: 14px;">비밀번호는 영문 대/소문자, 숫자, 특수문자(!@#$%^*+=-)가 포함되는 10~16자</span>
                        <br><br>
                        <hr>
                        <br>
                        비밀번호 확인*
                        <br><br>
                        <input type="password" name="user_PW2" class="box">
                        <br><br>
                        <hr>
                        <br>
                        이름*
                        <br><br>
                        <input type="text" name="user_name" value="" class="box"> <br>
                        <br>
                        <hr>
                        <br>
                       
  
                        성별*
                        <br><br>
                        <label for="man">남자</label>
                        <input type="radio" name="gender" value="m" id="man">
                        <label for="woman">여자</label>
                        <input type="radio" name="gender" value="m" id="woman"> <br><br>
                        <hr>
                        <br>
                        이메일*
                        <br><br>
                        <input type="email" name="user_email" placeholder="email@gmail.com" class="box">
                        <br><br>
                        <hr>
                        <br>
                        휴대전화*
                        <br><br>
                        <input type="text" name="user_phone" placeholder="010-****-****" class="box">
                        <br><br><br>
                        <hr>
                        <br>
                        <input type="checkbox">[필수] 이용약관동의
                        <br><br>
                        <div class="auto">
                            1. 개인정보 수집목적 및 이용목적 <br>

                            가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 <br>

                            콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스

                            나. 회원 관리

                            회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달 <br>

                            2. 수집하는 개인정보 항목 : 이름 , 로그인ID , 비밀번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보

                            3. 개인정보의 보유기간 및 이용기간

                            원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br>

                            가. 회사 내부 방침에 의한 정보 보유 사유 <br>

                            o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : OO년<br>

                            나. 관련 법령에 의한 정보보유 사유<br>

                            o 계약 또는 청약철회 등에 관한 기록<br>

                            -보존이유 : 전자상거래등에서의소비자보호에관한법률<br>

                            -보존기간 : 5년<br>

                            o 대금 결제 및 재화 등의 공급에 관한 기록<br>

                            -보존이유: 전자상거래등에서의소비자보호에관한법률<br>

                            -보존기간 : 5년<br>

                            o 소비자 불만 또는 분쟁처리에 관한 기록<br>

                            -보존이유 : 전자상거래등에서의소비자보호에관한법률<br>

                            -보존기간 : 3년<br>

                            o 로그 기록<br>

                            -보존이유: 통신비밀보호법<br>

                            -보존기간 : 3개월<br>

                            ※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.<br>

                            #개인정보의 위탁 처리<br>
                            어반레이디는 서비스 향상을 위해 관계법령에 따라 회원의 동의를 얻거나 관련 사항을 공개 또는 고지 후 회원의 개인정보를 외부에 위탁하여 처리하고 있습니다.<br>
                            어반레이디의 개인정보처리 수탁자와 그 업무의 내용은 다음과 같습니다.<br>
                            - 수탁자 : ㈜스냅컴퍼니<br>
                            - 알림전송수탁업체 : 주식회사 루나소프트<br>
                            - 위탁 업무 내용 : 신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 및 참여기회 제공<br>
                            - 수집항목 : 이름, 아이디, 휴대전화번호<br>
                            - 보유기간 : 회원 탈퇴 시 혹은 법정 보유 기간<br>
                        </div>
                        <br><br>
                        <input type="checkbox">[필수] 개인정보 수집 및 이용 동의
                        <br><br>
                        <div class="auto">
                            1. 개인정보 수집목적 및 이용목적 <br>

                            가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 <br>

                            콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스

                            나. 회원 관리

                            회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달 <br>

                            2. 수집하는 개인정보 항목 : 이름 , 로그인ID , 비밀번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보

                            3. 개인정보의 보유기간 및 이용기간

                            원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br>

                            가. 회사 내부 방침에 의한 정보 보유 사유 <br>

                            o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : OO년<br>

                            나. 관련 법령에 의한 정보보유 사유<br>

                            o 계약 또는 청약철회 등에 관한 기록<br>

                            -보존이유 : 전자상거래등에서의소비자보호에관한법률<br>

                            -보존기간 : 5년<br>

                            o 대금 결제 및 재화 등의 공급에 관한 기록<br>

                            -보존이유: 전자상거래등에서의소비자보호에관한법률<br>

                            -보존기간 : 5년<br>

                            o 소비자 불만 또는 분쟁처리에 관한 기록<br>

                            -보존이유 : 전자상거래등에서의소비자보호에관한법률<br>

                            -보존기간 : 3년<br>

                            o 로그 기록<br>

                            -보존이유: 통신비밀보호법<br>

                            -보존기간 : 3개월<br>

                            ※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.<br>

                            #개인정보의 위탁 처리<br>
                            어반레이디는 서비스 향상을 위해 관계법령에 따라 회원의 동의를 얻거나 관련 사항을 공개 또는 고지 후 회원의 개인정보를 외부에 위탁하여 처리하고 있습니다.<br>
                            어반레이디의 개인정보처리 수탁자와 그 업무의 내용은 다음과 같습니다.<br>
                            - 수탁자 : ㈜스냅컴퍼니<br>
                            - 알림전송수탁업체 : 주식회사 루나소프트<br>
                            - 위탁 업무 내용 : 신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 및 참여기회 제공<br>
                            - 수집항목 : 이름, 아이디, 휴대전화번호<br>
                            - 보유기간 : 회원 탈퇴 시 혹은 법정 보유 기간<br>
                        </div>
                        <br><br>
                        <input type="checkbox">[선택] 이메일 수신 동의
                        <br><br>
                        <div class="auto2">
                            할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.

                            단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.

                            선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.
                        </div>
                        <br><br>

                        <hr style="border: 1px solid #1E376F;">                       
                        <br>
                        <span style="font-size: 23px; font-weight: bold;">건강관리입력사항(선택)</span>
                        <br><br>
                        <hr style="border: 1px solid #1E376F;">
                        <br>
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
      
       
       <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <br><br><br>
      
        
        <hr style="border: 1px solid rgb(226, 226, 226);">

        <div id="content_3" align="center">
            
            <input type="button" id="cancel" value="취소"></input>
            <button type="submit" id="register">회원가입</button>
        </div>
        

    </div>
    


    <br><br><br><br><br><br><br><br>
</body>
</html>