<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../resources/css/index.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 폰트어썸 키트 -->
    <script src="https://kit.fontawesome.com/46331f5575.js" crossorigin="anonymous"></script>
<title>공통 네비게이터</title>
</head>
<body>
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
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">정보게시판</a></li>
                            <li><a href="#">쪽지</a></li>
                            <li><a href="#">신고하기</a></li>
                            <li><a href="#">퀴즈게시판</a></li>
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

</body>
</html>