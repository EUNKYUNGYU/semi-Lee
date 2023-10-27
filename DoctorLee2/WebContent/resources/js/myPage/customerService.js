function personalInqPage(){
    	 	location.href="<%=contextPath%>/personalInq.mp";
     	}
     
     	function adminInqPage(){
     		location.href = "<%=contextPath%>/adminInq.mp";
     	}
     	
     	$(function(){
     		$('.list-area>tbody>tr').click(function(){
     			
     			const nno = ($(this).children().eq(0).text());
     			
     			location.href= "<%=contextPath%>/detail.cs?nno=" + nno;
     			//location.href= "<%=contextPath%>/detail.cs";
     		
     		})
     	});