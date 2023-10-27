function insertAdminPage(){
    		location.href = "<%=contextPath%>/insert.cs";
    	}
    	
    	$(function(){
    		$('#inqContent').keyup(function(){
    			$('#count').text($(this).val().length);
    		})
    	})