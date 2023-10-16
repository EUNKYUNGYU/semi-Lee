<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.cou.model.vo.Cou" %>    
<%
    Cou c = (Cou)request.getAttribute("c");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리 상담 상세보기</title>
<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<style>
    .outer{
        width: 1800px;
        margin-left: 50px;
    }

    /*상단 네비*/
    #navi{
        height: 100px;
    }

    /*하단 내용 영역을 감싸는 div*/
    .content{
        height: 1050px;
        margin-top: 50px;
        border: 1px solid red;
    }

    .content > div{
        float: left;
    }

    #cou_navi{
        height: 1000px;
    }

    .left-menu{
        margin-left: 200px;
    }

    /*클리닉 정보 출력 영역 div*/
    #cli-content {
        width: 1000px;
        margin-left: 100px;
        height: 1000px;
    }

    /*클리닉 간단 정보 출력 영역 div*/
    #cli-top{
        border: 1px solid rosybrown;
        height: 200px;
    }

    #cli-top > h4{ 
        margin-top: 30px;
    }

    #cli-top > p{
        margin-top: 30px;
    }

    #cli-top > *{
        margin-left: 10px;
    }
    
    /*클리닉 상세 정보 출력 영역 div*/

    #cli-middle{
        border: 1px solid royalblue;
        height: 500px;
    }

    #cli-middle > h4{
        margin-top: 30px;
        margin-left: 10px;
    }

    /*클리닉 후기 출력 영역 div*/
    #cli-bottom{
        border: 1px solid pink;
        height: 300px;
    }

    #cli-bottom > h4{
        margin-top: 30px;
        margin-left: 10px;
    }
</style>
</head>
<body>

    <!--상단 네비게이션 메뉴 div-->
    <%@ include file="../common/nav2.jsp"%>

    <br><br><br>

    <!--전체를 감싸는 div-->
    <div class="outer">

        <!--하단 내용 영역을 감싸는 div-->
        <div class="content" align="center">

            <!--좌측 메뉴 div-->
            <div class="left-menu">
                <%@ include file="../common/cliNavi.jsp"%>
            </div>

            <!--클리닉 출력 영역 div-->
            <div id="cli-content" align="left">

                <!--클리닉 간단 정보 출력 영역 div-->
                <div id="cli-top" >
                    <h4><%= c.getCouName() %></h4>
                    <p><%= c.getHosName() %></p>
                    <p>클리닉 가격</p>

                </div>

                <!--클리닉 상세 정보 출력 영역 div-->
                <div id="cli-middle">
                    <h4>상세 정보</h4>
                </div>

                <!--클리닉 후기 출력 영역 div-->
                <div id="cli-bottom">
                    <h4>후기</h4>
                    <button>후기 작성</button>
                </div>

            </div>

        </div>

    </div>

</body>
</html>