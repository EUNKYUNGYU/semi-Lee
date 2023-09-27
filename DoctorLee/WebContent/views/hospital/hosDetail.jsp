<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>병원 상세</title>
    <style>
		
		.hos_wrap{margin: 0 auto; padding-top: 100px; padding-left: 50px;}
		
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
            position: absolute; bottom: 50px;
            padding: 10px;
            margin: 10px;
            display: inline-block;
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
        .hos_rsvt_btn>button:hover{cursor: pointer;}

		.sch_category>li{margin-bottom: 10px;}
    </style>
</head>
<body>
    <%@ include file="../common/navi.jsp" %>

    <!-- 병원 상세페이지 -->
	<div class="hos_wrap">
        
        <!-- 병원 정보 -->
        <div id="hos_info">
			
			<h3>좋은병원</h3>
			<span>치과</span>
			
			<!-- 현재 대기자 5명 -->
			
			<p>
				병원소개글 .....................................
			</p>
			
			<div id="hos_info_address">
			
			</div>
			<div id="hos_info_date">
			
			</div>
			<div id="hos_info_tel">
			
			
			</div>
			
        </div>

        <!-- 진료 예약 -->
        <div id="hos_rsvt">


        </div>


		<!-- 병원 리뷰 -->
		<div id="hos_review">
		
		
		
		</div>
		
	</div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>