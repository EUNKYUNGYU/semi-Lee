<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.cou.model.vo.*" %>
<%
    ArrayList<Cou> list = (ArrayList<Cou>)request.getAttribute("list");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리 상담 예약 페이지</title>

<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!--style-->
<link rel="stylesheet" href="resources/css/cou/couResList.css">

</head>
<body>
    <!--상단 네비게이션 메뉴 div-->
    <div class="header">
        <%@ include file="../common/nav2.jsp"%>
    </div>

    <!--전체를 감싸는 div-->
    <div class="outer">

        <!--하단 내용 영역을 감싸는 div-->
        <div class="content" align="center">

            <!--좌측 메뉴 div-->
            <div class="left-menu">
                <%@ include file="../common/couNavi.jsp"%>
            </div>

            <!--클리닉 출력 영역 div-->
            <div id="cli-content">

                <!--클리닉 내용 출력 영역 div-->
                <div id="cli-part">

                    <!--해당 카테고리 클리닉 출력 영역 div-->
                    <div id="content-part" align="center">

                        <!--클리닉 출력 테두리 div-->
                        <div class="content-border">

                            <!--클리닉 출력 ul-->
                            <ul class="content-list">
                            
                            <% if(list.isEmpty()) { %>
                            	<p>등록된 상담사가 존재하지 않습니다.</p>
                            <% } else { %>

                                <% for(Cou c : list) { %>

                                    <!--클리닉 요소 하나하나 li-->
                                    <li class="content-cli">

                                        <!--클리닉 대표 이미지 div-->
                                        <div class="cli-img">
                                            <img src="https://i.pinimg.com/736x/47/a6/48/47a64863fece924aaf2cc07fa6cfc6e7.jpg" alt="">
                                            <br>
                                            
                                            <% if(loginUser != null) { %>
                                                <button class="btn btn-primary">예약하기</button>
                                            <% } %>    
                                            
                                            <span><%=c.getCouNo()%></span>
                                        </div>

                                        <!--<input type="hidden" class="couNo" value="<%=c.getCouNo()%>">-->

                                        <!--클리닉 설명 div-->
                                        <div class="cli-des" align="left">

                                            <div class="cli-top">
                                                <span class="cli-name title"><%=c.getCouName()%></span>
                                            </div>

                                            <div class="cli-location">
                                                <span><%=c.getHosName()%></span>
                                            </div>

                                            <div class="cli-score">
                                                <span class="material-symbols-outlined">grade</span>
                                                <span><%=c.getScope()%></span>
                                            </div>

                                            <div class="cli-price">
                                                <span><%=c.getPrice()%>원</span>
                                            </div>

                                        </div>
                                        <br clear="both">
                                    </li>
                                <% } %>

                            <% } %>    
                                
                            </ul>
                        </div>
                    </div>
                </div>

                <script>
                    $(function(){

                        //돋보기 버튼 클릭 시 상세보기 페이지로 이동
                        $('.cli-img > button').click(function(){
                            console.log($(this).siblings().eq(2).text());
                            const couNo = $(this).siblings().eq(2).text();
                            location.href='<%=contextPath%>/couDetail.cou?cno='+couNo;
                        })
                        
                    })

                    // 가격 불러오기
                    function selectPrice(){

                    }
                </script>

            </div>

        </div>

        <br clear="both">

    </div>

    <footer>
        <%@ include file ="../common/footer.jsp" %>
    </footer>

</body>
</html>