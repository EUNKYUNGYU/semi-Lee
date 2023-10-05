<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.hospital.model.vo.*" %>
<%
	ArrayList<Hospital> hoslist = (ArrayList<Hospital>)request.getAttribute("hosList");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>병원 검색</title>
<style>
	*{box-sizing: border-box;}
	ul, li, ol{list-style: none;}
	a{text-decoration: none;}
	.sch_wrap{margin: 0 auto; padding-top: 100px; padding-left: 50px;}

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

	<!-- 병원 검색 메인페이지 -->
	<div class="sch_wrap">
	
        <!-- 병원 검색창-->
        <aside>

            <form action="sch_hos.dy" method="get" id="sch_hos">
                <h3>병원 검색</h3>
				<br>
                <input type="text" name="sch_bar" id="sch_bar">
				
                <button type="submit">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </form>
            
            <script>
            	
            	document.getElementById('sch_bar').addEventListener('keyup', function(e){
            		
            		if(e.keycode == 13){
            			$('sch_hos button').click();
            		}
            	})
            
            /*
            	$(function(){
            		$.ajax({
            			url: 'hosSch.dy',
            			data: {sch: $('#sch_bar').val()},
            			success: function(r){

            			},
            			error: function(){
            				alert("ajax fail");
            			}
            		})	
            	})
            */
            
            	
            
            
            </script>
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

        <!-- 병원 리스트 -->
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
                            var link = '<%= contextPath %>/views/hospital/hosDetail.jsp';
                            window.open(link);
                        }

                        var $hos_status = $('.hos_info').children().eq(3);
                        // db에 진료시간과 맞으면 


                    </script>
                </div>

            </div>

        </div>
        
		<!-- 지도 -->

	</div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>