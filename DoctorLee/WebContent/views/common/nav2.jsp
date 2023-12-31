<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.kh.DoctorLee.member.model.vo.Member" %>
<%
	String alertMsg = (String)session.getAttribute("alertMsg");
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네비만</title>
	<link rel="stylesheet" href="resources/css/index.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
	
<style>
	*{font-family: 'Nanum Gothic', sans-serif; font-family: 'Nanum Gothic Coding', monospace;}
body{
	box-sizing: border-box;
	margin : 0;
	padding : 0;
}
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

#navi:hover{background-color: #cadafc;}

#nav > li >ul {
    display:none;
    padding:0;
    list-style:none;
    background-color: #333;
    
}
#nav > li > a:hover + ul {
        display: block;
        background-color: #c6c6c6;
        border-radius: 3px;
    }
#nav > li > ul:hover {
        display: block;
        background-color: #c6c6c6;
        border-radius: 3px;
    }
#nav > li > ul a{font-size: 11px;}
#nav > li > ul a:hover{font-size: 14px;}

#user-info a{
    text-decoration: none;
    color: gray;
    font-size: 12px;
    margin-left: 15px;
}

#loginMemName{
	font-size: 15px;
	float:right;
	margin-top:17px;
	margin-right: 70px;
	z-index: 99999999991;
    position: relative;
}
#mem-info a{
	text-decoration:none;
	color:gray;
	font-size: 12px;
	margin-right:30px;
	float:right;
	margin-top:20px;
	z-index: 99999999991;
    position: relative;
}

#createId,#login{
    float: right;
    margin-right: 20px;
    margin-top: 10px;
    cursor: pointer;
    z-index: 99999999991;
    position: relative;
}

#login{
    margin-right: 70px;
    border: none;
    border-radius: 3px;
    font-weight: bolder;
    width: 80px;
    height: 30px;
}

#createId{
    width: 80px;
    border: none;
    width: 80px;
    height: 30px;
    border-radius: 3px;
    font-weight: bolder;
}

</style>
</head>
<body>
			
    		
<div id="navi">
            <div id="navi1"><a href="<%=contextPath%>" id="navitext">낭만닥터 이사부</a>
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
                            <li><a href="<%=contextPath%>/main.ahc">건강 관리 방법</a></li>
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
			
			

			var msg = '<%= alertMsg %>';  <!-- null / 메시지 문구-->
			if(msg != 'null'){
			alert(msg);
			// menuvar.jsp가 로딩 될 때마다 alert이 계속 수행됨
			// session에 들어있는 alertMsg키값에 해당하는 밸류값을 지워줄 것!
			// => XX.removeAttribute("키값");
			<% session.removeAttribute("alertMsg"); %>
			}
			
		</script>
		
		
</body>
</html>