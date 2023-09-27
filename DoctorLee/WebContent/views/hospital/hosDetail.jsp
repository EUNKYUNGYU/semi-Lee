<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calender" %>
<%



%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
		
		.hos_rsvt{width: 300px; height: 300px;}
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
				<div class="icon">
					<i class="fa-solid fa-location-dot"></i>
				</div>
				<h4>
					서울특병수
				</h4>
			</div>
			<div id="hos_info_date">
				<div class="icon">
					<i class="fa-solid fa-clock"></i>
				</div>
				<h4>
					- 월~금
					- 09:00
				</h4>
			</div>
			<div id="hos_info_tel">
				<div class="icon">
					<i class="fa-solid fa-phone"></i>
				</div>
				<h4>
					022-303-202
				</h4>
			</div>
			
        </div>

        <!-- 진료 예약 -->
        <div id="hos_rsvt">
			<table id="">
				<tr>
					<th>
						<%
						
						
						%>
					
					</th>
				</tr>
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
				
				</tr>
				<tr>
				
				</tr>
				<tr>
				
				</tr>
				<tr>
				
				</tr>
			</table>

        </div>


		<!-- 병원 리뷰 -->
		<div id="hos_review">
		
		
		
		</div>
		
	</div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>