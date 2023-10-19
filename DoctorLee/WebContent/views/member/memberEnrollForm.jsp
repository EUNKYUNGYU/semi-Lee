<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="resources/css/member/enrollForm.css">
<meta charset="UTF-8">
<title>회원가입폼</title>
</head>
<body>

	<%@ include file = "../common/nav2.jsp" %>
	
	 <div id="content">

        <div id="content_1"></div>
            <p id="p11">회원가입</p>
            <hr>
            <p id="p21">낭만닥터 이사부의 회원이 되시면 다양한 정보와 맞춤 서비스를 이용하실 수 있습니다.</p>
            
            <br>
            <hr>
           
            
            <form id="enroll-form" action="<%=contextPath%>/insert.me" method="post" class="formfont">
            <div class="content_2">
                
                        <span style="font-size: 23px; font-weight: bold;">기본입력사항(필수)</span>
                        <hr>
                        아이디*
                        <input type="text" name="memId" id="memId" class="box" required>
                        <input type="button" value="중복확인" id="r_id2" onclick="idCheck();">
                        <span style="font-size: 14px;">아이디는 영문 대/소문자, 숫자 조합하여 5 ~ 15자리</span>
                        <hr>
                        비밀번호*
                        <input type="password" name="memPwd" id="memPwd" class="box" required>
                        <span style="font-size: 14px;">비밀번호는 영문 대/소문자, 숫자, 특수문자(!@#$%^*+=-)가 포함되는 10~16자</span>
                        <hr>
                        비밀번호 확인*
                        <input type="password" name="memPwd2"  id="memPwd2" class="box" required>
                        <hr>
                        이름*
                        <input type="text" name="memName" id="memName" class="box" required> <br>
                        <hr>
                       
  
   		     닉네임*
                        <input type="text" id="nickName" name="nickName" class="box" required> <br>
                        <hr>
                        성별*
                        <label for="man">남자</label>
                        <input type="radio" name="gender" value="M" id="man">
                        <label for="woman">여자</label>
                        <input type="radio" name="gender" value="F" id="woman"> <br><br>
                        <hr>
                        이메일*
                        <input type="email" name="email" id="email" placeholder="email@naver.com" class="box" required>
                        <hr>
                        휴대전화*
                        <input type="text" name="phone" id="phone" placeholder="-을 제외하고 입력하세요." class="box" required>
                        <hr>
                  주민등록번호*
                        <input type="password" name="iNum" id="iNum" placeholder="-을 제외하고 입력하세요." class="box" required>
                        <hr>
                        
                        <input type="checkbox" checked onclick="return false;">[필수] 이용약관동의
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
                        <input type="checkbox" checked onclick="return false;">[필수] 개인정보 수집 및 이용 동의
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
                        

                        <hr style="border: 1px solid #1E376F;">                       
                        <br>
                        <span style="font-size: 23px; font-weight: bold;">건강관리입력사항(선택)</span>
                        <br><br>
                        <hr style="border: 1px solid #1E376F;">
                        키
                        <input type="text" placeholder="   cm" class="box" id="height" name="height" required>
                        <hr>
                        몸무게
                        <input type="text" placeholder="   kg" class="box" id="weight" name="weight" required>
                        <hr>
                     질병
                    <span class="spanfont">(중복 선택 가능)</span>
                    <input type="checkbox" value="암" name="diseases" class="allBtn">암
                    <input type="checkbox" value="간질환" name="diseases" class="allBtn">간질환
                    <input type="checkbox" value="심장질환" name="diseases" class="allBtn">심장질환
                    <input type="checkbox" value="뇌혈관질환" name="diseases" class="allBtn">뇌혈관질환
                    <input type="checkbox" value="당뇨병" name="diseases" class="allBtn">당뇨병
                    <input type="checkbox" value="고혈압" name="diseases" class="allBtn">고혈압
                    <input type="checkbox" value="호흡기질환" name="diseases" class="allBtn">호흡기질환
                    <input type="checkbox" value="기타" name="diseases" class="allBtn">기타
                    <hr>
                    흡입 알레르기
                    <span class="spanfont">(중복 선택 가능)</span>
                    <input type="checkbox" value="곤충류" name="inhaleAll" class="allBtn">곤충류
                    <input type="checkbox" value="진드기류" name="inhaleAll" class="allBtn">진드기류
                    <input type="checkbox" value="목초화분" name="inhaleAll" class="allBtn">목초화분
                    <input type="checkbox" value="비듬&상피세포" name="inhaleAll" class="allBtn">비듬&상피세포
                    <input type="checkbox" value="잡초화분" name="inhaleAll" class="allBtn">잡초화분
                    <input type="checkbox" value="수목화분" name="inhaleAll" class="allBtn">수목화분
                    <input type="checkbox" value="곰팡이류" name="inhaleAll" class="allBtn">곰팡이류
                    <input type="checkbox" value="기타" name="inhaleAll" class="allBtn">기타
                    <hr>
                    음식물 알레르기
                    <span class="spanfont">(중복 선택 가능)</span>
                    <input type="checkbox" value="곡류" name="foodAll" class="allBtn">곡류
                    <input type="checkbox" value="해산물" name="foodAll" class="allBtn">해산물
                    <input type="checkbox" value="채소류" name="foodAll" class="allBtn">채소류
                    <input type="checkbox" value="동물성식품" name="foodAll" class="allBtn">동물성식품
                    <input type="checkbox" value="과일류" name="foodAll" class="allBtn">과일류
                    <input type="checkbox" value="견과류" name="foodAll" class="allBtn">견과류
                    <input type="checkbox" value="기타" name="foodAll" class="allBtn">기타
                    <hr>
            </div>
        </div>
        <div id="content_3" align="center">
            <button type="reset" id="cancel1">취소</button>
            <button type="submit" id="register1"  onclick="return checkAll();">회원가입</button>
            <br><br><br><br><br><br>
        </div>
        

		</form>
    </div>
    
	 <%@ include file="../common/footer.jsp" %>
<script>

	// 아이디 중복체크
	function idCheck(){
		const $memId = $('#enroll-form input[name=memId]');
		
		$.ajax({
			url : 'idCheck.me',
			data : {checkId : $memId.val()},
			success : function(result){
				//console.log(result);
				if(result == 'NNNNN'){
					alert('이미 존재하거나 탈퇴한 회원의 아이디 입니다.');
				
					$memId.val('').focus();	
					
				}
				else{
					
					if(confirm('사용가능한 아이디 입니다. 사용하시겠습니까?')){
						// 이후 변경 불가능 
						$memId.attr('readonly', true);
						
						// submit버튼을 활성화
						$('#enroll-form button[type=submit]').removeAttr('disabled');
					}
					else{
						$memId.focus();
					}
				}
			},
			error : function(){
				console.log('아이디 중복체크 통신 실패');
			}
			
		});
		
	}

	// 유효성 검사
	function checkAll(){
        var memId = document.getElementById('memId');
        var memPwd = document.getElementById('memPwd');
        var memPwd2 = document.getElementById('memPwd2');
        var memName = document.getElementById('memName');
        var email = document.getElementById('email');
        var phone = document.getElementById('phone');
        var iNum = document.getElementById('iNum');
        

        // 아이디
        var regExp = /^[a-zA-Z][a-zA-Z0-9]{4,14}$/;
        if(!regExp.test(memId.value)){
            alert('아이디를 다시 확인해주세요.');
            memId.select();
            memId.value= '';
            return false;
        }
        
        // 비밀번호
        var regExp = /^[a-zA-z0-9(!@#$%^*+=-]{10,16}$/;
        if(!regExp.test(memPwd.value)){
        	alert('비밀번호를 다시 확인해주세요.');
        	return false;
        }
        
        // 비밀번호 체크
        if(memPwd.value != memPwd2.value){
        	alert('비밀번호가 일치하지 않습니다.')
        	return false;
        }
        
        // 이름
        var regExp = /^[가-힣a-zA-Z]{2,15}$/;
        if(!regExp.test(memName.value)){
        	alert('이름을 다시 확인해주세요.');
        	return false;
        }
        
        // 이메일
        var regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        if(!regExp.test(email.value)){
        	alert('이메일을 다시 확인해주세요.')
        	return false;
        }
        
        // 휴대폰
        var regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
        if(!regExp.test(phone.value)){
        	alert('휴대전화를 다시 확인해주세요.')
        	return false;
        }
        
        // 주민번호
		var regExp = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])[1-4]\d{6}$/;    
		if(!regExp.test(iNum.value)){
        	alert('주민번호를 다시 확인해주세요.')
        	return false;
        }
	}
	
</script>


</body>
</html>