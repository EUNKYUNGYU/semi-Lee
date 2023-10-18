<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.DoctorLee.member.model.vo.Member" %>

    <%
        String contextPath1 = request.getContextPath();
        Member loginUser1 = (Member)session.getAttribute("loginUser");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리 좌측 메뉴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<style>
    div{
        box-sizing: border-box;
    }

    #cou_navi{
        width: 225px;
        background-color:#1E376F;
    }

    #profile{
        background-color: white;
    }

    #user_photo{
        width:100px;
        height:100px;
    }

    #menu{
        list-style: none;
        margin: 0;
        padding: 0;
    }

    #menu > li{
        text-align: center;
    }

    #menu a{
        text-decoration: none;
        color : whitesmoke;
        display: block;
        line-height: 35px;
    }

    #menu a:hover{
        font-size : 16px;
            color : rgba(245, 245, 245, 0.445)
    }

    #menu > li > ul{
        list-style: none;
        padding: 0;
        display: none;
    }

    #menu > li a:hover + ul{
        display: block;
    }

    #menu > li > ul:hover{
        display: block;
    }

    #menu > li > ul a{
        font-size: 13px;
    }
</style>
</head>
<body>

    <div id="cou_navi" align="center">

        <div id="profile">

            <table id="user-area" align="center">

                <tr>
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMTlfMjA1%2FMDAxNjE2MDgwOTM1MDIx.JZKXWzM8gscL4K0VtyQuYki9jetacIhoppgLJ0PlxEcg.iqtKX-tjRe6nSqfieZ6uYV1QS-4S2LewzhkIAVyic4kg.PNG.wnsghks1017%2Fimage.png&type=a340" alt="회원사진" id="user_photo" >
               
                </tr>
               
                <tr>
                    <br><br>
                    <div align="center"><%= loginUser1.getMemName() %>님 환영합니다.</div><br>
               
                </tr>
                
            </table>

        </div>

        <ul id="menu" align="center">
            <li><a href="#" id="cou-worry">고민 나눔</a></li>
            <li><a href="<%=contextPath%>/couResList.cou" id="cou-res">상담 예약</a></li>
            <li><a href="<%=contextPath%>/couTestList.cou" id="cou-test">성향 테스트</a></li>
            <li><a href="<%=contextPath%>/couVideoList.cou?cpage=1" id="cou-video">심리 영상</a></li>
        </ul>

    </div>

</body>
</html>