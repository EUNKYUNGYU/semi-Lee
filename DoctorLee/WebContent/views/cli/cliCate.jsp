<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 아이템</title>

<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" /><style>

    #cli-cate-part{
        width: 1000px;
        border: 1px solid black;
    }

    /*영역 제목*/
    .category-title-part{
        height: 100px;
        border: 1px solid blue;
        line-height: 100px;
    }

    .category-title-part span{
        font-size: 26px;
        border: 1px solid red;
    }

    .category-title-part > span{
        margin-left: 50px;
    }

    .category-title-part > em > span{
        background-color: #1E376F;
        border-radius: 50%;
        color: white;
        margin-left: 100px;
    }

    #cli-cate-part{
        width: 1000px;
    }

    .cate{
        opacity: 0;
    }

    .cate > label{
        padding: 5px 10px;
    }

    input[type=radio]+label{
        color: black;
        border-radius: 10px;
        text-align: center;
        padding-top: 10px;
        padding-left: 10px;
        padding-bottom: 10px;
        display: inline-block;
        font-size: 20px;
    }

    input[type=radio]:checked + label{
        color: blue;
        text-decoration: underline;
    }

    #cate-inner > ul{
        list-style: none;
        display: flex;
        border: 1px solid red;
        margin: 0;
    }
    

    
</style>
</head>
<body>

    <!--클리닉 내용 출력 영역 div-->
    <div id="cli-cate-part">

        <!--제목 출력 영역 div-->
        <div class="category-title-part">
            <em>
                <span class="material-symbols-outlined">chevron_right</span>
            </em>
            <span>카테고리를 선택해주세요</span>
        </div>

      <!--클리닉 카테고리 영역 div-->
      <div id="cli-cate" align="left">
        <div id="cate-inner" align="center">
            <ul>
                <li><input type="radio" class="cate" name="cate" id="skin1"><label for="skin1">피부 관리</label></li>
                <li><input type="radio" class="cate" name="cate" id="skin2"><label for="skin2">피부 진료</label></li>
                <li><input type="radio" class="cate" name="cate" id="body1"><label for="body1">몸매 관리</label></li>
                <li><input type="radio" class="cate" name="cate" id="skin3"><label for="skin3">피부 진료3</label></li>
                <li><input type="radio" class="cate" name="cate" id="skin1"><label for="skin1">피부 관리</label></li>
                <li><input type="radio" class="cate" name="cate" id="skin2"><label for="skin2">피부 진료</label></li>
                <li><input type="radio" class="cate" name="cate" id="body1"><label for="body1">몸매 관리</label></li>
            </ul>

        </div>
    </div>
    </div>
</body>
</html>