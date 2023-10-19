$(function(){
    		$('.list-area>tbody>tr').click(function(){
    			
    			const nno = ($(this).children().eq(5).text());
    			
    			//console.log(this);
    			// 클릭했을떄 공지사항의 번호로 넘겨줘야함
    			//tr요소 자식의 첫번째 td의 content 영역의 값
    			
    			//번호를 이용한 요청
    			//쿼리스트링
    			location.href= "<%=contextPath%>/detail.medi?nno=" + nno;
    			//location.href = "<%=contextPath%>/detail.medi";
    			
    		})
    		
    	});