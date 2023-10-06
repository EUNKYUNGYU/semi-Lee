<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.hospital.model.vo.*, com.kh.DoctorLee.common.model.vo.PageInfo" %>
<%
	ArrayList<Hospital> list = (ArrayList<Hospital>)request.getAttribute("list");
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
	.sch_wrap{margin: 0 auto; padding-top: 100px; padding-left: 50px; height: 1000px;}

      /* 병원 검색*/
      aside{
          float: left;
          width: 20%; height: 800px;
      }
      #sch_hos>h3{font-size: 30px;}

      #sch_bar{
          width: 250px; height: 40px;
      }
      #sch_hos>button{
          width: 35px; height: 40px;
          display: inline-block;
          margin: 0;
      }

      /* 병원 리스트 */
      #hos_list{
          float: left;
          width: 40%;
      }
      .hos{
          width: 100%; height: 200px;
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
	#hos_list:hover{cursor: pointer;}
	  .sch_category>li{margin-bottom: 10px;}
</style>
</head>
<body>
    <%@ include file="../common/nav.jsp" %>

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
		<% for(Hospital h : list) { %>
        <div id="hos_list">
            <div class="hos">
				<!-- 병원 이미지 -->
                <div class="hos_img">
                    <img src="https://cdn-icons-png.flaticon.com/512/6743/6743757.png" alt="">
                </div>
                
                <!-- 병원 정보 -->
                <div class="hos_info">
                    <h3>
						<%= h.getHosName() %>
					</h3>
                    <p>
						<%= h.getHosAddress() %>
					</p>

                    <h4>진료중</h4>
                    <div class="hos_rsvt_btn">
                        <button onclick="rsvtPage();">진료예약</button>
                    </div>
                </div>
           	</div>
		</div>
        <%} %>

       	<script>
       		$('#hos_list>.hos').on('click', function(){
       			location.href = '<%= contextPath %>/views/hospital/hosDetail.jsp';
       		});
       	
       	
            function rsvtPage(){
                var link = '<%= contextPath %>/views/hospital/hosDetail.jsp';
                window.open(link);
            };

            var $hos_status = $('.hos_info').children().eq(3);
            
       	</script>
		<div id="pageing_bar">
			
			<!-- http://localhost:8765/DoctorLee/hosSch.dy?index_search=&hkey=%EB%B3%91 -->
		
		
		</div>

        </div>

		<!-- 지도 -->


    <%@ include file="../common/footer.jsp" %>

</body>
</html>