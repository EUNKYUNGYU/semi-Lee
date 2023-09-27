<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>병원 검색</title>
    <style>

        /* 병원 검색*/
        aside{
            float: left;
            width: 30%; height: auto;
        }
        #sch_hos>h3{font-size: 30px;}

        #sch_bar{
            width: 300px; height: 40px;
        }
        #sch_hos>button{
            width: 40px; height: 40px;
            display: inline-block;
        }

        /* 병원 리스트 */
        #hos_list{
            display: inline-block;
            width: 50%; height: 700px;
        }
        .hos{
            width: 500px; height: 200px;
            position: relative;
            margin: 30px;
            
        }
        .hos_img{
            display: inline-block;
            width: 150px; height: inherit;
        }
        .hos_img>img{
            display: block;
            width: 150px; height: 160px;
        }
        .hos_info{
            position: absolute; bottom: 30px;
            padding: 10px;
            margin: 10px;
            display: inline-block;
            border: 1px solid #000;
            width: 300px;
        }
        .hos_info>h3{display: inline-block;}
        .hos_info>h4{display: inline-block;}
        .hos_info>p{display: inline-block;}
        .hos_rsvt_btn{display: inline-block;}

        .hos_info>h3, .hos_info>p{margin-bottom: 15px;}

        .hos_info>h3, .hos_info>h4{margin-right: 15px;}

        .hos_info>p{font-size: 12px; color: #333;}
        .hos_info>h4{margin-left: 15px;}
        .hos_rsvt_btn{margin-left: 20px;}
        .hos_rsvt_btn>button{
            background-color: transparent; border: 0;
            width: 150px;
            font-size: 15px;
            color: yellow;
            font-weight: bold;
            text-shadow: 3px, 4px, 5px, #333;
        }
        .hos_rsvt_btn:hover{cursor: pointer;}

    </style>
</head>
<body>
    <%@ include file="../common/navi.jsp" %>
    <%@ include file="../common/footer.jsp" %>

        <!-- 병원검색 메인, 검색창-->
        <aside>

            <form action="sch_hos.dy" method="get" id="sch_hos">
                <h3>병원 검색</h3>

                <input type="text" name="sch_bar" id="sch_bar">

                <button type="submit">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </form>

            <ul class="sch_category">
                <li>
                    <a href="#none">주변 병원 검색</a>
                </li>
                <li>
                    <a href="#none">진료과로 검색</a>
                </li>
                <li>
                    <a href="#none">질병명으로 검색</a>
                </li>
            </ul>

        </aside>

        <!-- 병원검색 메인, 병원 리스트 -->
        <div id="hos_list">

            <div class="hos">

                <div class="hos_img">
                    <img src="https://cdn-icons-png.flaticon.com/512/6743/6743757.png" alt="">
                </div>

                <div class="hos_info">
                    <h3>좋은병원</h3>
                    <p>서울시 아차산로 2384</p>

                    <h4>진료중</h4>
                    <div class="hos_rsvt_btn">
                        <button onclick="rsvtPage();">진료예약</button>
                    </div>

                </div>

            </div>
            
            <div class="hos">

                <div class="hos_img">
                    <img src="https://cdn-icons-png.flaticon.com/512/6743/6743757.png" alt="">
                </div>

                <div class="hos_info">
                    <h3>좋은병원</h3>
                    <p>서울시 아차산로 2384</p>

                    <h4>진료중</h4>
                    <div class="hos_rsvt_btn">
                        <button onclick="rsvtPage();">진료예약</button>
                    </div>

                </div>

            </div>

            <div class="hos">

                <div class="hos_img">
                    <img src="https://cdn-icons-png.flaticon.com/512/6743/6743757.png" alt="">
                </div>

                <div class="hos_info">
                    <h3>좋은병원</h3>
                    <p>서울시 아차산로 2384</p>

                    <h4>진료중</h4>
                    <div class="hos_rsvt_btn">
                        <button onclick="rsvtPage();">진료예약</button>
                    </div>
                    <script>
                        function rsvtPage(){
                            var link = 'http://naver.com';
                            window.open(link);
                        }

                        var $hos_status = $('.hos_info').$('h4');

                        // db에 진료시간과 맞으면 


                    </script>
                </div>

            </div>

        </div>
        <!-- 병원 리스트 끝 -->










        <!-- 지도 나중에 -->
        <div id="map" style="width: 500px; height: 500px;">
            

        </div>
        <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=7800b346bcf611e7326b48dc6d22f39a”></script>
        <script>
            const container = document.getElementById('map');
            let options = {
                center : new kakao.mapsLatLng(33.450701, 126.570667),
                level : 3
            };
            let map = new kakao.maps.Map(container, options);

        </script>
</body>
</html>