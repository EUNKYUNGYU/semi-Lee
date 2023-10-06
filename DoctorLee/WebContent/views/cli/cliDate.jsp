<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 아이템</title>

<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" /><style>


    /*예약 출력 영역*/
    #cli-date-part{
        width: 1000px;
        border: 1px solid black;
    }
    .date-title-part{
        height: 100px;
        border: 1px solid blue;
        line-height: 100px;
    }

    .date-title-part span{
        font-size: 26px;
        border: 1px solid red;
    }

    .date-title-part > span{
        margin-left: 50px;
    }

    .date-title-part > em > span{
        background-color: #1E376F;
        border-radius: 50%;
        color: white;
        margin-left: 100px;
    }

    #cli-date-part{
        width: 1000px;
    }
    
    #date-inner{
        width: 600px;
        border: 1px solid red;
    }

    #time-inner{
        width: 396px;
        border: 1px solid orange;
    }

    #cli-date > div{
        float: left;
    }

    
</style>
</head>
<body>

    <!--클리닉 예약일시 출력 영역 div-->
    <div id="cli-date-part">

        <!--제목 출력 영역 div-->
        <div class="date-title-part">
            <em>
                <span class="material-symbols-outlined">chevron_right</span>
            </em>
            <span>예약일시를 선택해주세요</span>
        </div>

      <!--예약일시 영역 div-->
      <div id="cli-date" align="left">
        <div id="date-inner" align="center">
            <p>날짜 선택(달력 출력)</p>
        </div>

        <div id="time-inner">
            <p>시간 선택</p>
        </div>
    </div>
    </div>
</body>
</html>