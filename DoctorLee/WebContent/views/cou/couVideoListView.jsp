<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.cou.model.vo.*" %>
<% 
	ArrayList<CouVideo> list = (ArrayList<CouVideo>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리: 영상 목록 페이지</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<style>
.outer{
    /*border: 1px solid red;*/
    width: 1800px;
    margin-left: 50px;
    border: 1px solid red;
}

#navi{
    background-color: white;
}

.content > div{
    float: left;
}

/*하단 내용 영역을 감싸는 div*/
.content{
    border: 1px solid green;
    height: 1000px;
    margin-top: 100px;
}

#enrollVideo{
    text-align: center;
}

/*비디오 목록*/
#video-list{
    width: 1260px;
    margin-left: 10px;
}

img{
    width: 450px;
    height: 280px;
}

.list-img, .list-des:hover{
    cursor: pointer;
}

/*내용 영역*/
    .list-content{
        width: 1400px;
        border: 1px solid silver;
        margin-left: 100px;
    }
</style>
</head>
<body>

    <!--상단 네비게이션 메뉴 div-->
    <%@ include file="../common/nav.jsp"%>

    <!--전체를 감싸는 div-->
    <div class="outer">

    <!--하단 내용 영역을 감싸는 div-->
    <div class="content">

        <!--좌측 메뉴 div-->
        <div class="left-menu">
            <%@ include file="../common/couNavi.jsp"%>
        </div>
    
    
        <!--심리 영상 내용 출력 영역 div-->
        <div id="video-list">

            <div align="right">
                <a href="<%=contextPath%>/couVideoEnroll.cou">등록하기</a>
            </div>
            
            <!-- 동영상이 존재하지 않을 경우 -->
            <%if(list.isEmpty()){ %>
            	<div clss=list-content" align="center">
            		등록된 영상이 없습니다.
            	</div>
            <%} else {%>

				<!-- 동영상이 존재할 경우  -->
				<% for(CouVideo cv : list) { %>
	            <div class="list-content" align="center">
	                <hr>
	                <input type="hidden" value="<%= cv.getVideoAddress() %>">
	                <div class="list-img">
	                    <img src="https://img.youtube.com/vi/<%= cv.getVideoAddress() %>/maxresdefault.jpg" alt="">
	                </div>
	                <div class="list-des">
	                    <h4><%= cv.getVideoTitle() %></h5>
	                    <h4><%= cv.getChannelName() %></p>
	                </div>
	            </div>
	            <% } %>
            
            <%} %>

        </div>
    </div>

    </div>

    <script>
        $(function(){
            $('.list-content').click(function(){
                const address = $(this).children().eq(1).val();

                location.href = 'https://www.youtube.com/watch?v='+address;
            })
        })
    </script>

</body>
</html>