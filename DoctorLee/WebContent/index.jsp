<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>낭만닥터 메인 페이지</title>

    <!-- 폰트어썸 키트 -->
    <script src="https://kit.fontawesome.com/46331f5575.js" crossorigin="anonymous"></script>
    
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- bxslider -->
    <script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">


    <style>
        *{box-sizing: border-box; margin: 0; padding: 0;}
        a{text-decoration: none;}
        ul, ol, li{list-style: none;}
        body::-webkit-scrollbar {
            display: none;
        }

        #wrap{margin: 0 auto;}

        header{
            width: 100vw;
            height: 600px;
            position: relative;
            clear: both;
        }

        /* 메인화면 백그라운드 이미지 */
        .bg img{
            height: 600px;
            display: block;
            width: inherit;
        }

        /* 메인화면 검색창 아이콘 */
        .icon_search{
            float: left;
            position: absolute;
            top: 50%;
            transform: translate(0, -50%);
            margin: 0 0 0px 10px;
            color: #fff;

        }

        /* 메인화면 검색창 */
        #index_search_bar{
            position: absolute; left: 50%; top: 50%; 
            transform: translate(-50%, -50%);
        }
        #index_search_bar>input{
            width: 1000px;
            height: 50px;
            border-radius: 5px;
            border: none;
            padding-left: 45px;
            background: #999;
        }
        #index_search_bar>input::placeholder{color: #fff;}

        /* bxslider */
        .bx-wrapper{
            border: none;
            box-shadow: none;
            height: 600px;
        }
        .bx-wrapper .bx-pager.bx-default-pager a {
            position: relative; bottom: 50px;
        }
        .bx-viewport{
            height: auto;
        }

        @media (max-width: 1000px) {
            #index_search_bar>input{
                width: 500px;
            }

        }

        /* 섹션 영역 */
        section{height: 500px; width: inherit;}

        /* 푸터 영역 */
        #footer{
            width: 100vw;
            height: 280px;
            background-color: rgb(44, 62, 80);
            color: white;
            z-index: 7;
            position: relative;
        }
        #footer_1{
            width: 100%;
        }
        #p1, #p2, #p3{
            height: 80%;
            padding-left: 60px;
            text-align: left;
        }
        #p1{
            padding-top: 40px;
            font-size: 15px;
            font-weight: bold;
        }
        #p2{
            font-size: 12px;
        }
        #p3{
            font-size: 13px;
        }
        #p4{
            height: 20%;
            padding-top: 30px;
            text-align: center;
            font-size: 12px;
        }
        .z-test{
            width: 150px;
            height: 150px;
            position: relative;
        }
        #z1{
            width: 210px;
            height: 280px;
            position: absolute; #footer{
            width: 1000px;
            height: 280px;
            background-color: rgb(44, 62, 80);
            color: white;
            z-index: 7;
            position: relative;
        }
        #footer_1{
            width: 100%;
        }
        #p1, #p2, #p3{
            height: 80%;
            padding-left: 60px;
            text-align: left;
        }
        #p1{
            padding-top: 40px;
            font-size: 15px;
            font-weight: bold;
        }
        #p2{
            font-size: 12px;
        }
        #p3{
            font-size: 13px;
        }
        #p4{
            height: 20%;
            padding-top: 30px;
            text-align: center;
            font-size: 12px;
        }
        .z-test{
            width: 150px;
            height: 150px;
            position: absolute;
        }
        #z1{
            width: 210px;
            height: 280px;
            top: 0px;
            left: 730px;
            float: left;
            z-index: 10;
            background-color: rgba(224, 224, 224, 0.21);
        }
        #p5, #p6, #p7{
            padding-left: 21px;
        }
        #p5{
            padding-top: 21px;
        }
        #p6{
            font-size: 23px;
            font-weight: bold;
        }
        #p7{
            font-size: 13px;
        }
        #p8{
            padding-top: 45px;
            text-align: center;
            font-size: 13px;
        }
            top: 0px;
            left: 70%;
            float: left;
            z-index: 10;
            background-color: rgba(224, 224, 224, 0.21);
        }
        #p5, #p6, #p7{
            padding-left: 21px;
        }
        #p5{
            padding-top: 21px;
        }
        #p6{
            font-size: 23px;
            font-weight: bold;
        }
        #p7{
            font-size: 13px;
        }
        #p8{
            padding-top: 45px;
            text-align: center;
            font-size: 13px;
        }

        /* 네비 */
  #wrap > div{
          width: 100%;
      }
  #navi > div{
          height : 100%;
          display:inline-block;
          float : left;
  }
  #navi{
          height : 5%;
          margin : 0;
          text-align: center;
          line-height : 50px;
          position: fixed;
          z-index: 9999999999;

  }
  #navi1{
          width:17%;
  }
  #navi2{
          width:68%;
  }
  #navi3{
          width : 15%;
  }
  #navi1 > a {
          text-decoration: none;
          color: black;
          font-size: 20px;
          margin: 5px;
          font-weight: 800;
          text-align: center;
          width : 100%;
          height : 100%;
  }
  #navi1 > a:hover{
          font-size : 21px;
  }
  #nav {
      list-style: none;
      width : 100%;
      height : 80%;
      margin:0;
      padding:0;
  }
  #nav > li{
      float : left;
      height: 100%;
      width: 20%;
      text-align: center;
  }
  #nav a{
      text-decoration: none;
      color: black;
      font-weight: 800;
      display: block;
      width: 100%;
      height: 100%;
      font-size: 14px;
      line-height : 50px;
      }
  #navi a:hover {
          font-size: 16px;
      }

  #navi:hover{background-color: antiquewhite;}
  #nav:hover{background-color: antiquewhite;}
  #nav > li >ul {
      display:none;
      padding:0;
      list-style:none;
      background-color: #333;
      
  }
  #nav > li > a:hover + ul {
          display: block;
          background-color: #333;
      }
  #nav > li > ul:hover {
          display: block;
          background-color: #333;
      }
  #nav > li > ul a{font-size: 11px;}
  #nav > li > ul a:hover{font-size: 14px;}
 
    </style>
</head>
<body>
    <div id="wrap">

        <!-- 네비 -->
        <div id="navi">
            <div id="navi1"><a href="#" id="navitext">낭만닥터 이사부</a>
            </div
            ><div id="navi2">
                <ul id="nav">
                    <li><a href="#">심리</a>
                        <ul>
                            <li><a href="#">성향 테스트</a></li>
                            <li><a href="#">고민 나눔</a></li>
                            <li><a href="#">심리 상담 예약</a></li>
                            <li><a href="#">심리 치료 추천 영상</a></li>
                        </ul>
                    </li>
                    <li><a href="#">클리닉</a></li>
                    <li><a href="#">건강 메거진</a>
                        <ul>
                            <li><a href="#">의약품 검색</a></li>
                            <li><a href="#">건강 관리 방법</a></li>
                            <li><a href="#">긴급 상황 대비 메뉴얼</a></li>
                        </ul>
                    </li>
                    <li><a href="#">커뮤니티</a>
                        <ul>
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">정보게시판</a></li>
                            <li><a href="#">쪽지</a></li>
                            <li><a href="#">신고하기</a></li>
                            <li><a href="#">퀴즈게시판</a></li>
                        </ul>
                    </li>
                    <li><a href="#">마이페이지</a>
                        <ul>
                            <li><a href="#">복약관리</a></li>
                            <li><a href="#">회원 정보 수정</a></li>
                            <li><a href="#">회원 탈퇴</a></li>
                            <li><a href="#">관리자 문의</a></li>
                            <li><a href="#">자기 게시물 확인</a></li>
                            <li><a href="#">예약 관리</a></li>
                            <li><a href="#">병원 즐겨찾기</a></li>
                            <li><a href="#">진료 내역 관리</a></li>
                            <li><a href="#">건강 관리</a></li>
                            <li><a href="#">다이어리</a></li>
                            <li><a href="#">가족 계정 추가</a></li>
                        </ul>
                    </li>
                </ul>
            </div
            ><div id="navi3">
                <button id="login">로그인</button>
                <button id="createId">회원가입</button>
            </div
        ></div>


        <!-- 헤더 영역 -->
        <header>
            <!-- 백그라운드 이미지 -->
            <div class="bg">
                <ul class="bxslider">
                    <li><img src="https://cdn.pixabay.com/photo/2021/10/11/17/37/doctor-6701410_1280.jpg" alt=""></li>
                    <li><img src="https://cdn.pixabay.com/photo/2017/08/18/12/23/building-2654823_1280.jpg" alt=""></li>
                    <li><img src="https://cdn.pixabay.com/photo/2016/12/01/09/08/patient-care-1874756_640.jpg" alt=""></li>
                    <li><img src="https://cdn.pixabay.com/photo/2013/07/18/10/59/human-skeleton-163715_1280.jpg" alt=""></li>
                </ul>
            </div>
            <script>
                // 백그라운드 이미지 슬라이드
                $(function(){
                    $('.bxslider').bxSlider({
                        auto: true, 
                        speed: 500,
                        pause: 5000,
                        mode: 'fade',
                    });
                })
            </script>

            <form action="" method="get" id="index_search_bar">
                <!-- 메인화면 검색창 -->
                <input type="text" name="index_search" placeholder="검색어를 입력하세요.">
                <!-- 검색창 아이콘 -->                
                <div class="icon_search">
                    <i class="fa-solid fa-magnifying-glass fa-xl"></i>
                </div>
            </form>

        </header>

        <!-- 섹션 1 -->
        <section>
            <article></article>

        </section>

        <!-- 섹션 2 -->
        <section>
            <article></article>

        </section>

        <!-- 푸터 -->
        <div id="footer">
            <div id="footer_1"></div>
            <div id="footer_1">
               <p id="p1">낭만닥터 이사부 - 홈페이지</p>
               <p id="p2">
                회사 : 낭만닥터 이사부   |   대표 : 이사부 <br>
                개인정보관리책임자 : 이사부/ doctor202304@gmail.com <br>
                사업자등록번호 : [453-87-00113]   |   통신판매업신고 : 제2023-서울 을지로-0910 <br>
                주소 : 서울특별시 중구 남대문로 120 대일빌딩 2층 <br>
               </p>
               <p id="p3">
                이용약관 | 개인정보처리방침 | 이용안내
               </p>
               <p id="p4">
                Copyright © 1998-2023 KH Information Educational Institute All Right Reserved
               </p>
            </div>
            <z class="z-test" id="z1">
                <p id="p5">Customer Center</p>
                <p id="p6">1588-0000</p>
                <p id="p7">
                    채팅상담 11:00 ~ 17:00 <br>
                    점심시간 12:00 ~ 13:00
                </p>
                <p id="p8">일요일 및 공휴일은 휴무입니다.</p>
            </z>
        </div>

    </div>
</body>
</html>