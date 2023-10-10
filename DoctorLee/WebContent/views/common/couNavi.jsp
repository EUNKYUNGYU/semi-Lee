<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        border: 1px solid black;
    }

    #profile{
        background-color: white;
        border-bottom: 1px solid black;
    }

    #user_photo{
        width: 100px;
        height: 100px;
    }

    #menu{
        list-style: none;
        margin: 0;
        padding: 0;
    }

    #menu a{
        text-decoration: none;
        color: black;
        display: block;
        line-height: 35px;
        border-bottom: 1px solid black;
    }

    #menu a:hover{
        color: red;
        font-size: 20px;
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
</style>
</head>
<body>

    <div id="cou_navi" align="center">

        <div id="profile">

            <table id="user-area" align="center">
               
                <tr>
                    <br><br>
                    <th>OOO</th><br>
               
                </tr>
               
                <tr>
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMTlfMjA1%2FMDAxNjE2MDgwOTM1MDIx.JZKXWzM8gscL4K0VtyQuYki9jetacIhoppgLJ0PlxEcg.iqtKX-tjRe6nSqfieZ6uYV1QS-4S2LewzhkIAVyic4kg.PNG.wnsghks1017%2Fimage.png&type=a340" alt="회원사진" id="user_photo" >
               
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