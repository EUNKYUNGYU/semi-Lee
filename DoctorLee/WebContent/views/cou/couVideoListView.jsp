<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리: 영상 목록 페이지</title>
<style>
    div{
        box-sizing: border-box;
    }
    .outer{
        border: 1px solid red;
    }

    .outer > div{
        float: left;
    }

    #side_menu{width: 20%; border: 1px solid green;}
    #list{width: 70%; border: 1px solid blue;}
</style>
</head>
<body>
	<%@ include file="../common/nav.jsp" %>

    <br><br><br><br><br>
    
    <div class="outer">
        <div id="side_menu">
            <%@ include file="../common/couNavi.jsp" %>
        </div>

        <div id="list">
            <p>list</p>
        </div>
        <p>outer</p>
    </div>

</body>
</html>