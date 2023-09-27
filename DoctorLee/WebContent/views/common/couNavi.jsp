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
        border: 1px solid red;
    }

    #cou_navi{
        width: 225px;
        height: 700px;
    }

    #profile{
        height: 35%;
    }

    #menu{
        height: 65%;
    }

    #menu > div{
        height: 40px;
        text-align: center;
    }

    #menu a{
        text-decoration: none;
        color: black;
    }

    #menu a:hover{
        color: blue;
    }
</style>
</head>
<body>
    <div id="cou_navi">
        <div id="profile">
            <p>프로필</p>
        </div>

        <div id="menu">
            <div><a href="#">고민 게시판</a></div>
            <div><a href="#">성향 테스트</a></div>
            <div><a href="#">심리 상담</a></div>
            <div><a href="#">심리 영상</a></div>
        </div>
    </div>

</body>
</html>