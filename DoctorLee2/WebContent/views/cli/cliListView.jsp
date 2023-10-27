<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.cli.model.vo.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 예약 페이지</title>

<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!--style-->
<link rel="stylesheet" href="resources/css/cli/cliList.css">



</head>
<body>
    <!--상단 네비게이션 메뉴 div-->
    <%@ include file="../common/nav2.jsp"%>

    <br><br><br>

    <!--전체를 감싸는 div-->
    <div class="outer">

        <!--하단 내용 영역을 감싸는 div-->
        <div class="content" align="center">

            <form action="<%=contextPath%>/enrollRes.cli" method="post"></form>

            <!--클리닉 출력 영역 div-->
            <div id="cli-content">

				<c:if test="${ !empty loginUser && loginUser.memId eq 'admin' }">
                    <div id="button-area" align="right">
                        <button type="button" onclick="location.href='<%=contextPath%>/couVideoEnroll.cou'">등록하기</button>
                    </div>
                </c:if>

                <!--카테고리 내용 출력 영역 div-->
                <div id="cli-cate-part">

                    <!--제목 출력 영역 div-->
                    <div class="category-title-part">
                        <em>
                            <span class="material-symbols-outlined">chevron_right</span>
                        </em>
                        <span id="cate-pick">카테고리를 선택해주세요</span>
                    </div>

                <!--클리닉 카테고리 영역 div-->
                <div id="cli-cate" align="left">
                    <div id="cate-inner" align="center">
                        <ul>
                        <c:forEach var="l" items="${ list }">
                            <li>
                                <input type="radio" class="cate" name="cate" id="${ l.cateNo }" value="${ l.cliCate }"><label for="${ l.cateNo }" >${ l.cliCate }</label>
                            </li>
                        </c:forEach>
                        </ul>

                    </div>
                </div>
        </div>

                <!--클리닉 내용 출력 영역 div-->
                <div id="cli-part">

                    <!--해당 카테고리 클리닉 출력 영역 div-->
                    <div id="content-part" align="center">

                        <!--클리닉 출력 테두리 div-->
                        <div class="content-border">

                            <!--클리닉 출력 ul-->
                            <ul class="content-list">
                            
                                <h5>카테고리를 선택하세요</h5>
                                
                            </ul>
                        </div>
                    </div>
                </div>

            <script>
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
                                                +'<c:if test="${ !empty loginUser }">' 
                                                    +'<button class="btn btn-primary">예약하기</button>'
                                                +'</c:if>'    
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
                                        const cliNo = $(this).parent().siblings().children().eq(1).text();
                                        location.href='<%=contextPath%>/cliDetail.cli?cno=' + cliNo;
                                        // console.log($('.cli-no').text());
                                        // console.log($(this).parent().siblings().children().eq(1).text());
                                    })
                                },
                                error:function(){
                                    console.log('실패');
                                }
                            })
    
                    })

                })
    
            </script>

            <br><br><br><br><br>

            </form>

            </div>

        </div>

    </div>

    <footer>
        <jsp:include page="../common/footer.jsp"/>
    </footer>

</body>
</html>