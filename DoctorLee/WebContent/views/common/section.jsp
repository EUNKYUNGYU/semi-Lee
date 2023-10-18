<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{border: 1px solid red;
	box-sizing: border-box;}
	
    div{
        height: 500px;
        width: 1412px; 
        box-sizing: border-box;
    }

    #section{
    }

    #content_1 > div{
        float: left;
    }

    #board1 , #board{
        height: 100%; 
        width: 45%; 
        text-align: center;
    }

    #video{
        
        padding: 70px;
        
    }

    #video > a{
        text-decoration: none;  
        font-size: 20px; 
    }


    #board1 > img{
        width: 560px;
        height: 315px;
        margin-top: 70px;
    }

    #board > img, #board > h4:hover{
        cursor: pointer;
    }

    img{
        width: 450px;
        height: 280px;
    }    


</style>
</head>
<body>
    <div id="section">

        <div id="content_1">

			<div  id="board1">
			
	            <div id="video">
	                <iframe id="main_video" width="560" height="315" src="https://www.youtube.com/embed/AJyx1VyjE1g?si=4kRxwyXwCDIFjzMo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
	            </div>

			</div>
			
            </div>

            <div id="board">

                <img src="https://cdn.dailycc.net/news/photo/202306/748295_649266_210.jpg" alt="">
                <h4>인공감미료 아스파탐의 발암물질 지정 - 안정성, 대표음식 등</h4>

            </div>

        </div>

    </div>
</body>
</html>