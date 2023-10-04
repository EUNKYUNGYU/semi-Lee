<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>낭만닥터 메인 페이지</title>

    <!-- 폰트어썸 키트 -->
    <script src="https://kit.fontawesome.com/46331f5575.js" crossorigin="anonymous"></script>
    
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- bxslider -->
    <script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	
	<!-- css -->
	<link rel="stylesheet" href="resources/css/index.css">

</head>
<body>
    <div id="wrap">

        <!-- 네비 -->
        <div id="navi">
            <div id="navi1"><a href="#" id="navitext">낭만닥터 이사부</a>
            </div
            ><div id="navi2">
                <ul id="nav">
                    <li><a href="#">심리</a>
                        <ul>
                            <li><a href="#">성향 테스트</a></li>
                            <li><a href="#">고민 나눔</a></li>
                            <li><a href="#">심리 상담 예약</a></li>
                            <li><a href="#">심리 치료 추천 영상</a></li>
                        </ul>
                    </li>
                    <li><a href="#">클리닉</a></li>
                    <li><a href="#">건강 메거진</a>
                        <ul>
                            <li><a href="#">의약품 검색</a></li>
                            <li><a href="#">건강 관리 방법</a></li>
                            <li><a href="#">긴급 상황 대비 메뉴얼</a></li>
                        </ul>
                    </li>
                    <li><a href="#">커뮤니티</a>
                        <ul>
                        	<li><a href="#">공지사항</a></li>
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">정보게시판</a></li>
                            <li><a href="#">익명게시판</a></li>
                            <li><a href="<%= contextPath %>/list.qz">퀴즈게시판</a></li>
                            <li><a href="#">쪽지함</a></li>
                        </ul>
                    </li>
                    <li><a href="#">마이페이지</a>
                        <ul>
                            <li><a href="#">복약관리</a></li>
                            <li><a href="#">회원 정보 수정</a></li>
                            <li><a href="#">회원 탈퇴</a></li>
                            <li><a href="#">관리자 문의</a></li>
                            <li><a href="#">자기 게시물 확인</a></li>
                            <li><a href="#">예약 관리</a></li>
                            <li><a href="#">병원 즐겨찾기</a></li>
                            <li><a href="#">진료 내역 관리</a></li>
                            <li><a href="#">건강 관리</a></li>
                            <li><a href="#">다이어리</a></li>
                            <li><a href="#">가족 계정 추가</a></li>
                        </ul>
                    </li>
                </ul>
            </div
            ><div id="navi3">
                <button id="login">로그인</button>
                <button id="createId">회원가입</button>
            </div
        ></div>


        <!-- 헤더 영역 -->
        <header>
            <!-- 백그라운드 이미지 -->
            <div class="bg">
                <ul class="bxslider">
                    <li><img src="https://cdn.pixabay.com/photo/2021/10/11/17/37/doctor-6701410_1280.jpg" alt=""></li>
                    <li><img src="https://cdn.pixabay.com/photo/2017/08/18/12/23/building-2654823_1280.jpg" alt=""></li>
                    <li><img src="https://cdn.pixabay.com/photo/2016/12/01/09/08/patient-care-1874756_640.jpg" alt=""></li>
                    <li><img src="https://cdn.pixabay.com/photo/2013/07/18/10/59/human-skeleton-163715_1280.jpg" alt=""></li>
                </ul>
            </div>
            <script>
                // 백그라운드 이미지 슬라이드
                $(function(){
                    $('.bxslider').bxSlider({
                        auto: true, 
                        speed: 500,
                        pause: 5000,
                        mode: 'fade',
                    });
                })
            </script>

            <form action="" method="get" id="index_search_bar">
                <!-- 메인화면 검색창 -->
                <input type="text" name="index_search" placeholder="검색어를 입력하세요.">
                <!-- 검색창 아이콘 -->                
                <div class="icon_search">
                    <i class="fa-solid fa-magnifying-glass fa-xl"></i>
                </div>
            </form>

        </header>

        <!-- 섹션 1 -->
        

        <div id="section">
            <div id="video">
                <iframe id="main_video" width="560" height="315" src="https://www.youtube.com/embed/AJyx1VyjE1g?si=4kRxwyXwCDIFjzMo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                <br>
                <a href="#">심리 영상 게시판 가기</a>
            </div>
            <div id="board">
                <img src="https://cdn.dailycc.net/news/photo/202306/748295_649266_210.jpg" alt="">
                <h4>인공감미료 아스파탐의 발암물질 지정 - 안정성, 대표음식 등</h4>
            </div>
            
        </div>
        <br clear="both">

        <!-- 푸터 -->
        <div id="footer">
            <div id="footer_1"></div>
            <div id="footer_1">
               <p id="p1">낭만닥터 이사부 - 홈페이지</p>
               <p id="p2">
                회사 : 낭만닥터 이사부   |   대표 : 이사부 <br>
                개인정보관리책임자 : 이사부/ doctor202304@gmail.com <br>
                사업자등록번호 : [453-87-00113]   |   통신판매업신고 : 제2023-서울 을지로-0910 <br>
                주소 : 서울특별시 중구 남대문로 120 대일빌딩 2층 <br>
               </p>
               <p id="p3">
                이용약관 | 개인정보처리방침 | 이용안내
               </p>
               <p id="p4">
                Copyright © 1998-2023 KH Information Educational Institute All Right Reserved
               </p>
            </div>
            <z class="z-test" id="z1">
                <p id="p5">Customer Center</p>
                <p id="p6">1588-0000</p>
                <p id="p7">
                    채팅상담 11:00 ~ 17:00 <br>
                    점심시간 12:00 ~ 13:00
                </p>
                <p id="p8">일요일 및 공휴일은 휴무입니다.</p>
            </z>
        </div>

    </div>
</body>
</html>