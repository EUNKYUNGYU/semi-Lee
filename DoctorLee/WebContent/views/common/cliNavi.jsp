<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 좌측 메뉴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<style>
    div{
        box-sizing: border-box;
    }

    #cli-res-box{
        width: 227px;
    }

    #cou_navi{
        width: 225px;
        border: 1px solid black;
        height: 500px;
    }

    #profile{
        background-color: white;
        border-bottom: 1px solid black;
    }

    #user_photo{
        width: 100px;
        height: 100px;
    }

    #res-state{
        list-style: none;
        margin: 0;
        padding: 0;
    }

    #res-state > li{
        border-bottom: 1px solid black;
    }

    /*예약하기 버튼*/
    #res-btn{
        background-color: #1E376F;
        height: 40px;
    }

    #res-bnt:hover{
        cursor: pointer;
    }

    #resBtn{
        font-size: 20px;
        text-decoration: none;
        color: white;
        line-height: 40px;
    }




</style>
</head>
<body>

    <div id="cli-res-box">
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
    
            <div id="state-aera">
                <ul id="res-state">
                    <li id="sel-cate">
                        <p>클리닉카테고리</p>
                    </li>
    
                    <li id="sel-cli">
                        <p>클리닉명</p>
                    </li>
    
                    <li id="sel-date">
                        <p>클리닉예약날짜</p>
                    </li>
                </ul>
            </div>
    
        </div>

        <div id="res-btn" align="center">
            <a id="resBtn" href="#">
                예약하기
            </a>
        </div>
        
    </div>
    



</body>
</html>