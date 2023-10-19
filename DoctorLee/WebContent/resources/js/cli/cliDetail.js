$(function(){

    // 예약 버튼 클릭 시 예약하기 페이지로 이동
    $('#resBtn').click(function(){
        location.href='<%=contextPath%>/cliRes.cli?cno=<%=c.getCliNo()%>';
        // console.log($(this).parents().children().eq(1).val());
    })

    // 등록하기 버튼 클릭 시 리뷰 작성
    $('#insertRev').click(function(){
        $.ajax({
            url:'cliRevInsert.cli',
            type:'post',
            data:{
                cno: <%=c.getCliNo()%>,
                memNo:<%=loginUser.getMemNo()%>,
                cliScope: $('input[name=reviewStar]:checked').val(),
                revContent: $('#revContent').val()
            },
            success:function(result){
                alert('리뷰 등록 성공');
            },
            error:function(){
                console('리뷰 등록 실패');
            }
        })
        location.reload();	
    })

    function selectRevList(){
        $.ajax({
            url: 'ajaxRevList.cli',
            data : {
                cno: <%=c.getCliNo()%>
            },
            success : function(result){

                let resultStr = '';
                for(let i in result){
                    resultStr += '<li class="rev-content">'

                                    + '<div class="revNickName">'
                                        + '<p>' + result[i].nickName + '</p>'
                                    + '</div>'

                                    + '<div class="revScope">'
                                        + '<span>⭐</span>'
                                        + '<span>' + result[i].cliScope + '</span>'
                                    + '</div>'

                                    +'<div class="reContent">'
                                        + '<p>' + result[i].revContent + '</p>'
                                    + '</div>'

                                    + '<div class="revDate">'
                                        + '<P>' + result[i].createDate + '</p>'
                                    + '</div>'

                               + '</li>'
                }
                $('#rev-list').html(resultStr);
            },
            error : function(){
                console.log('리뷰 불러오기 실패');
            }
        })
    }

    $(function(){
        selectRevList();

        setInterval(selectRevList, 1000);
    })
})
