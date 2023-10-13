<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자문의</title>
<style>
	div{
            box-sizing: border-box;
        }

        #wrap{
            width: 1800px;
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

        #p1{
            font-size: 38px;
            font-weight: bolder;
            text-align: center;
        }

        #p2{
            margin-left: 200px;
            font-size: 23px;
            font-weight: 600;
            margin-top: 35px;
           
           
        }
        
        #textcontent{
            padding: 30px;
            font-size: 15px;
            width: 978px;
            height: 500px;
            margin-left: 200px;
            margin-top: 30px;
            
        }
       
        #count{
            margin-left:200px;
           
        }
       
        /*-----------버튼---------*/
        #pwd_1{
            background-color: white;
            color: #1E376F;
            border: 1px solid #1E376F;
            border-radius: 3px;
            width: 140px;
            height: 50px;
            font-size: 17px;
            margin-top: 50px;
            margin-left: 1100px;
        }

        #pwd_1:hover{
            background-color: #1E376F;
            color: white;
        }
</style>
</head>
<body>
	 <div id="wrap">
        <div id="header">
        	<%@ include file = "../common/nav2.jsp" %>
        </div>

        <div id="content">
            <div id="content_1">
            	<%@ include file = "../common/myPageNavi.jsp" %>
            </div>
            <div id="content_2">
                <p id="p1">마이페이지</p>
                <hr>
                <p id="p2">1:1 문의하기</p>
                
                <br>
                <hr>

                <textarea id="textcontent" cols="40" rows="10" style="resize: none;" maxlength="1000" placeholder="내용을 입력해주세요."></textarea>
                <br>
                <span id="count">0</span>/ 1000자
                <button type="submit" id="pwd_1">확인</button>
                
            </div>
        
        </div>
    </div>
</body>
</html>