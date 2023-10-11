<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 좌측 메뉴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<!-- w3c bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

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
        height: 40px;
        line-height: 40px;
    }

    /*예약하기 버튼*/
    #resBtn{
        font-size: 20px;
        color: white;
        line-height: 40px;
        background-color: #1E376F;
        height: 40px;
        width: 225px;
        border: none;
    }

    #res-bnt:hover{
        cursor: pointer;
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
            <button type="submit" id="resBtn">
                예약하기
            </button>
        </div>
        
    </div>
    



</body>
</html>