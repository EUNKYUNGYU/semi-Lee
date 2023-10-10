<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
 <style>
         div{
            border: 1px solid blue;
            box-sizing: border-box;
        }

        #wrap{
            width: 100%;
            height: 1000px;
            margin: auto;
        }

        #wrap > div {
            width: 100%;
        }

        #header{
            height: 5%;
        }

        #content{
            height: 95%;
        }

        #content > div{
            height: 100%;
            float: left;
        }

        #content_1{
            width: 20%;
            height: 100%;
        }

        #content_2{
            width: 80%;
            height: 100%;
        }

        /*-----------------------------------------------*/
        h1{
            text-align: center;
        }

    </style>
</head>
<body>

	
	<div id="wrap">
		<div id="header"></div>
		
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2">
                <h1>마이페이지</h1>
                <hr>
            </div>
        </div>
    </div>
	

</body>
</html>