<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
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
                            <li><a href="#">고민 나눔</a></li>
                            <li><a href="<%=contextPath%>/couResList.cou">상담 예약</a></li>
                            <li><a href="<%=contextPath%>/couTestList.cou">성향 테스트</a></li>
                            <li><a href="<%=contextPath%>/couVideoList.cou?cpage=1">심리 영상</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=contextPath%>/list.cli">클리닉</a></li>
                    <li><a href="#">건강 매거진</a>
                        <ul>
                            <li><a href="<%=contextPath%>/search.med">의약품 검색</a></li>
                            <li><a href="#">건강 관리 방법</a></li>
                            <li><a href="#">긴급 상황 대비 메뉴얼</a></li>
                        </ul>
                    </li>
                    <li><a href="#">커뮤니티</a>
                        <ul>
                        	<li>
                                <a href="<%= contextPath %>/list.bo?cpage=1&type=10">공지사항</a>
                            </li>
                            <li>
                                <a href="<%= contextPath %>/list.bo?cpage=1&type=20">자유게시판</a>
                            </li>
                            <li>
                                <a href="<%= contextPath %>/list.bo?cpage=1&type=30">정보게시판</a>
                            </li>
                            <li>
                                <a href="<%= contextPath %>/list.bo?cpage=1&type=40">익명게시판</a>
                            </li>
                            <li><a href="<%= contextPath %>/list.qz?cpage=1">퀴즈게시판</a></li>
                            <% if(loginUser != null){ %>
                            <li><a href="<%= contextPath %>/list.ms?cpage=1&memNo=<%= loginUser.getMemNo() %>&type=receiver">쪽지함</a></li>
                        	<% } else { %>
                        	<li><a href='javascript:void(0);' onclick="alert('로그인 후 이용 가능한 기능입니다.');">쪽지함</a></li>
                        	<% } %>
                        </ul>
                    </li>
                    <li><a href="#">마이페이지</a>
                        <ul>
                        	<li><a href="<%=contextPath%>/myPage.me">마이페이지</a></li>
                        	<li><a href="<%=contextPath%>/list.medi">복약관리</a></li>
                            <li><a href="<%=contextPath%>/updateForm.me">회원 정보 수정</a></li>
                            <li><a href="<%=contextPath%>/customerService.mp">고객센터</a></li>
                            <li><a href="#">나의 게시글</a></li>
                            <li><a href="#">예약 관리</a></li>
                            <li><a href="<%=contextPath%>/first.bm">병원 즐겨찾기</a></li>
                            <li><a href="<%=contextPath%>/first.mehi">진료 내역 관리</a></li>
                            <li><a href="<%=contextPath%>/main.hc">건강 관리</a></li>
                            <li><a href="<%=contextPath%>/first.di">다이어리</a></li>
                            <li><a href="#">가족 계정 추가</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
      
 		<% if(loginUser == null) { %>
                <button id="login" onclick="loginPage();">로그인</button>
                <button id="createId" onclick="enrollPage();">회원가입</button>
       
		<% } else { %>
			<div id="mem-info">
			<b id=loginMemName><%=loginUser.getMemName()%>님</b>
				<a href="<%=contextPath %>/logout.me">로그아웃</a>
			</div>
		<% } %>
		
		<script>
			function enrollPage(){
				location.href= "<%=contextPath%>/enrollForm.me";
			}
			
			function loginPage(){
				location.href="<%=contextPath%>/login.me";
			}
		</script>
		

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

            <form action="hosSch.dy" method="get" id="index_search_bar">
            
                <!-- 메인화면 검색창 -->
                <input type="text" name="search" placeholder="검색어를 입력하세요.">
                <input type="hidden" name="hkeyP" value="1">
				<input type="hidden" name="hkeyH" value="병원">
                
                <!-- 검색창 아이콘 -->                
                <button type="submit" id="icon_search">
                    <i class="fa-solid fa-magnifying-glass fa-xl"></i>
                </button>
                
            </form>
            
            <script>
            	// 엔터키 이벤트
            	document.getElementById('index_search_bar').addEventListener('keyup', function(e){
            		if(e.keyCode == 13){
            			document.getElementById("icon_search").click();
            		}
            	});
            	
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

        </header>

        <!-- 섹션 1 -->

        <section>
            <%@include file="/views/common/section.jsp" %>
        </section>

        <!-- 섹션 2 -->
        <section>
            
            </div>
        </section>

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