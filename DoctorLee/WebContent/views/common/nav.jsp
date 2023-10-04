<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네비만</title>
<style>
#wrap > div{
        width: 100%;
    }
#navi > div{
        height : 100%;
        display:inline-block;
        float : left;
}
#navi{
        height : 5%;
        margin : 0;
        text-align: center;
        line-height : 50px;
        position: fixed;
        z-index: 9999999999;
        width : 100%;

}
#navi1{
        width:17%;
}
#navi2{
        width:68%;
}
#navi3{
        width : 15%;
}
#navi1 > a {
        text-decoration: none;
        color: black;
        font-size: 20px;
        margin: 5px;
        font-weight: 800;
        text-align: center;
        width : 100%;
        height : 100%;
}
#navi1 > a:hover{
        font-size : 21px;
}
#nav {
    list-style: none;
    width : 100%;
    height : 80%;
    margin:0;
    padding:0;
}
#nav > li{
    float : left;
    height: 100%;
    width: 20%;
    text-align: center;
}
#nav a{
    text-decoration: none;
    color: black;
    font-weight: 800;
    display: block;
    width: 100%;
    height: 100%;
    font-size: 14px;
    line-height : 50px;
    }
#navi a:hover {
        font-size: 16px;
    }

#navi:hover{background-color: antiquewhite;}
#nav:hover{background-color: antiquewhite;}
#nav > li >ul {
    display:none;
    padding:0;
    list-style:none;
    background-color: #333;
    
}
#nav > li > a:hover + ul {
        display: block;
        background-color: #333;
    }
#nav > li > ul:hover {
        display: block;
        background-color: #333;
    }
#nav > li > ul a{font-size: 11px;}
#nav > li > ul a:hover{font-size: 14px;}
</style>
</head>
<body>
<div id="navi">
            <div id="navi1"><a href="#" id="navitext">낭만닥터 이사부</a>
            </div
            ><div id="navi2">
                <ul id="nav">
                    <li><a href="#">심리</a>
                        <ul>
                            <li><a href="#">고민 나눔</a></li>
                            <li><a href="#">상담 예약</a></li>
                            <li><a href="<%=contextPath%>/couTestList.cou">성향 테스트</a></li>
                            <li><a href="<%=contextPath%>/couVideoList.cou">심리 영상</a></li>
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
                            <li><a href="<%= contextPath %>/list.qz">퀴즈게시판</a></li>
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