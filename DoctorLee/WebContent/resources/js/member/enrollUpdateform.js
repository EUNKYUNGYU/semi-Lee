		let diseases = '<%= diseases%>';
    	let inhaleAll = '<%= inhaleAll%>';
    	let foodAll = '<%= foodAll%>';
    	
    	$('input[type=checkbox]').each(function(){
    		if (diseases.search($(this).val()) != -1){
    			$(this).attr('checked', true);
    		}
    	
    		if (inhaleAll.search($(this).val()) != -1){
    			$(this).attr('checked', true);
    		}
    		
    		if (foodAll.search($(this).val()) != -1){
    			$(this).attr('checked', true);
    		}
    	});
    	
    	function validatePwd(){
			
			if($('#updatePwd').val() != $('#checkPwd').val()){
				alert('비밀번호를 다시 입력해주세요.');
				$('#checkPwd').focus();
				return false;
			}
			
			return true;
		}
    	
    	function deleteMember(){
			
			const deleteStr = propmt('다시');
			
			if(deleteStr = 'ddd'){
				return true;
			} else{
				return false;
			}
			
		}