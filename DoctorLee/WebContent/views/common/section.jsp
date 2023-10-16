<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.cou.model.vo.*" %>    
<%
    ArrayList<CouVideo> list = (ArrayList<CouVideo>)request.getAttribute("c");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        height: 500px;
        width: 1412px;
        box-sizing: border-box;
        border: 1px solid red;
    }

    #section{
        box-sizing: border-box;
    }

    #section > div{
        float: left;
    }
    
    #content_1 > div{
        float: left;
    }

    #video{
        height: 100%; 
        width: 50%; 
        text-align: center;
    }

    #video > iframe{
        margin-top: 70px;
    }

    #video > a{
        text-decoration: none;  
        font-size: 20px; 
    }

    #board{
        height: 100%;
        width: 50%;
        text-align: center;
    }

    #board > img{
        width: 560px;
        height: 315px;
        margin-top: 70px;
    }

    #board > img, #board > h4:hover{
        cursor: pointer;
    }


</style>
</head>
<body>
    <div id="section">

        <div id="content_1">

            <div id="video">
                       
            </div>

            <div id="board">

                <img src="https://cdn.dailycc.net/news/photo/202306/748295_649266_210.jpg" alt="">
                <h4>인공감미료 아스파탐의 발암물질 지정 - 안정성, 대표음식 등</h4>

            </div>

        </div>

    </div>
</body>
</html>