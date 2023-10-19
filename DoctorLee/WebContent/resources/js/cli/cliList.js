$(function(){
    $('.cate').click(function(){ 

        // 카테고리 선택 시 해당하는 카테고리의 클리닉 출력
        $.ajax({
                url:'ajaxList.cli',
                data:{cateNo:$('input[name=cate]:checked').attr('id')},
                success:function(result){

                    let resultStr = '';

                    for(let i in result){
                        
                        resultStr += '<li class="content-cli">'
                            +'<div class="cli-img">' 
                                +'<img src="https://i.pinimg.com/736x/47/a6/48/47a64863fece924aaf2cc07fa6cfc6e7.jpg" alt=""> <br>'
                                +'<% if(loginUser != null) {%>' 
                                    +'<button class="btn btn-primary">예약하기</button>'
                                +'<%}%>'    
                            + '</div>'

                            +'<div class="cli-des" align="left">'
                                    +'<div class="cli-top">'
                                        +'<span class="cli-name title">'
                                            +result[i].cliName
                                        +'</span>'
                                    +'</div>'

                                    +'<div class="cliNo">'
                                        +'<span class="cli-no">'
                                            +result[i].cliNo
                                        +'</span>'
                                    +'</div>'    

                                    +'<div class="cli-location">'
                                            +'<span>'
                                                +result[i].hosNo
                                            +'</span>'
                                    +'</div>'

                                    +'<div class="cli-score">'
                                            +'<span class="material-symbols-outlined">grade</span>'
                                            +'<span>' 
                                                +result[i].scope 
                                            +'</span>'
                                    +'</div>'

                                    +'<div class="cli-cate">'
                                            +'<span>'
                                                +result[i].cateName
                                            +'</span>'
                                    +'</div>'

                                    +'<div class="cli-price">'
                                            +'<span>'
                                                +result[i].cliPrice
                                                +'원'
                                            +'</span>'
                                    +'</div>'
                            
                            +'</div>' 
                            
                            +'<br clear="both">'
                                
                            +'</li>'
                    }
                    $('.content-list').html(resultStr);

                    //자세히보기 버튼 클릭 시 상세보기 페이지로 이동
                    $('.cli-img > button').click(function(){
                        location.href='<%=contextPath%>/cliDetail.cli?cno=' + $('.cli-no').text();
                        //console.log($('.cli-no').text());
                    })
                },
                error:function(){
                    console.log('실패');
                }
            })

    })

})