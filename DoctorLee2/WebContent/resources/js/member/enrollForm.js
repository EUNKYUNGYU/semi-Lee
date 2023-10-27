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
	