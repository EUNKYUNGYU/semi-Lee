<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.cou.model.vo.*, com.kh.DoctorLee.common.model.vo.*" %>
<% 
	ArrayList<CouVideo> list = (ArrayList<CouVideo>)request.getAttribute("list");
    PageInfo pi = (PageInfo)request.getAttribute("pi");

    int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리: 영상 목록 페이지</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>

<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />


<!--w3c bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<style>
.outer{
    /*border: 1px solid red;*/
    width: 1800px;
    margin-left: 50px;
}

#navi{
    background-color: white;
    margin-bottom: 100px;
}

.content > div{
    float: left;
}

/*하단 내용 영역을 감싸는 div*/
.content{
    margin-top: 50px;
    height: 2350px;
}

#cou_navi{
    height: 2300px;
}

#cou-video{
    background-color: skyblue;
    font-weight: 800;
    pointer-events: none;
}

.left-menu{
    margin-left: 200px;
}

#enrollVideo{
    text-align: center;
}

/*비디오 목록*/
#video-list{
    width: 1000px;
    margin-left: 100px;
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
    width: 1000px;
    border-radius: 10px;
    background-color: bisque;
    margin-top: 15px;
}

.list-des{
    margin-top: 10px;
}

.video-title{
    font-weight: 900;
}

/*페이징 처리 영역*/
.paging-area{
    width: auto;
}

#button-area> button{
    width: 100px;
        height: 30px;
        border-radius: 3px;
        background-color: #1E376F;
        color: white;
        font-size: 12px;
}

/*수정 및 삭제 아이콘*/
.emoji{
    margin-right: 10px;
    margin-bottom: 5px;
}

.edit, .delete:hover{
    cursor: pointer;
}

</style>
</head>
<body>

    <!--상단 네비게이션 메뉴 div-->
    <%@ include file="../common/nav2.jsp"%>

    <br><br><br>

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

            <% if(loginUser != null && loginUser.getMemId().equals("admin")){ %>
                <div id="button-area" align="right">
                    <button type="button" onclick="location.href='<%=contextPath%>/couVideoEnroll.cou'">등록하기</button>
                </div>
            <% } %>

            <!-- 동영상이 존재하지 않을 경우 -->
            <%if(list.isEmpty()){ %>
            	<div clss=list-content" align="center">
            		등록된 영상이 없습니다.
            	</div>
            <%} else {%>

				<!-- 동영상이 존재할 경우  -->
				<% for(CouVideo cv : list) { %>
	            <div class="list-content" align="center">
                    <br>

                    <!--영상 주소-->
	                <input type="hidden" value="<%= cv.getVideoAddress() %>">

                    <!--영상 번호-->
                    <input type="hidden" value="<%= cv.getVideoNo() %>">

                    <!--채널명-->
                    <input type="hidden" value="<%= cv.getChannelName() %>">

                    <% if(loginUser != null && loginUser.getMemId().equals("admin")){ %>
                        <div class="emoji" align="right">
                            <span class="material-symbols-outlined edit">
                                edit
                            </span>

                            <span class="material-symbols-outlined delete" data-toggle="modal" data-target="#myModal">
                                delete
                            </span>
                        </div>
                    <% } %>

	                <div class="list-img">
	                    <img src="https://img.youtube.com/vi/<%= cv.getVideoAddress() %>/maxresdefault.jpg" alt="">
	                </div>
	                <div class="list-des">
	                    <p class="video-title"><%= cv.getVideoTitle() %></p>
	                    <p class="video-channel"><%= cv.getChannelName() %></p>
	                </div>
                    <br>
	            </div>
	            <% } %>
            
            <%} %>

            <br>
            <div class="paging-area" align="center">
                <% if(currentPage != 1) {%>
                    <button onclick="location.href='<%=contextPath%>/couVideoList.cou?cpage=<%=currentPage -1%>'">&lt</button>
                <% }%>
                
                <% for(int i = startPage; i <= endPage; i++) {%>
                    <% if(currentPage != i) { %>
                        <button onclick="location.href='<%=contextPath%>/couVideoList.cou?cpage=<%=i%>'"><%= i%></button>
                    <% } else { %>
                        <button disabled><%= i%></button>    
                    <% } %>
                <% } %>
                
                <% if(currentPage != maxPage) { %>
                    <button onclick="location.href='<%=contextPath%>/couVideoList.cou?cpage\<%=currentPage + 1%>'">&gt</button>
                <% } %>
            </div>

        </div>
    </div>

    </div>

    <script>
        $(function(){

            // 썸네일 클릭 시 해당 영상 주소로 이동
            $('.list-img').click(function(){
                const address = $(this).parent().children().eq(1).val();
                
                // console.log(this);
                location.href = 'https://www.youtube.com/watch?v='+address;
            })

            // 영상 제목 클릭 시 해당 영상 주소로 이동
            $('.video-title').click(function(){
                const address = $(this).parents().children().eq(3).val();
                
                // console.log($(this).parents().children().eq(3).val());
                location.href = 'https://www.youtube.com/watch?v='+address;
            })

            // 채널명 클릭 시 해당 채널로 이동
            $('.video-channel').click(function(){
                const address = $(this).parents().children().eq(5).val();
                console.log(address);
                location.href = 'https://www.youtube.com/results?search_query='+address; 
            })

            // 클릭 시 영상 수정 페이지로 이동
            $('.edit').click(function(){
                console.log('수정');

                const videoNo = $('.list-content').children().eq(2).val();

                location.href = '<%=contextPath%>/updateVideo.cou?cvno='+videoNo;
            })

            // 클릭 시 영상 삭제
            $('.delete').click(function(){

                const videoNo = $('.list-content').children().eq(2).val();

                var result  = confirm('영상을 삭제하겠습니까?');

                if(result){
                    location.href='<%=contextPath%>/deleteVideo.cou?cvno='+videoNo;
                } else {

                }
            })
        })
    </script>

</body>
</html>