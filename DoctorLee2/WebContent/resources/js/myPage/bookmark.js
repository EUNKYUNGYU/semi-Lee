$(function(){
	$('#deleteBtn').click(function(){
		str='';
		$('input[name=bookmark]').filter(':checked').each(function(){
			str += $(this).val() + '';
			const cn = str;
			const mno = loginUser.getMemNo();
			console.log(cn);
			console.log(mno);
			location.href="<%=contextPath%>/del.bm?cn="+cn+"&mno="+mno;
		});
		
	});
})
