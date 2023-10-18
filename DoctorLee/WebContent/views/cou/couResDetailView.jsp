<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.cou.model.vo.*, java.util.ArrayList" %>    
<%
    Cou c = (Cou)request.getAttribute("c");
    int result = (int)request.getAttribute("result");
    int result2 = (int)request.getAttribute("result2");
    ArrayList<CouCar> list = (ArrayList<CouCar>)request.getAttribute("list");
    Double scope = (Double)request.getAttribute("scope");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리 상담 상세보기</title>
<!--Google Fonts Icon-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<style>
    .outer{
        width: 1800px;
        margin-left: 50px;
    }

    .header {width: 100vw; height: 100px;}

    /*하단 내용 영역을 감싸는 div*/
    .content{
        height: auto;
        margin-bottom: 50px;
        margin-top: -500px;
    }

    #cou_navi{
        height: 1000px;
    }


    /*클리닉 정보 출력 영역 div*/
    #cli-content {
        width: 1000px;
        margin-left: 100px;
    }

    /*예약하기 버튼*/
    #res-btn > button{
        margin-top: 10px;
        margin-bottom: 10px;
    }

    /*클리닉 간단 정보 출력 영역 div*/
    #cli-top{
        border: 1px solid;
        height: auto;
    }

    #cli-top > h4{ 
        margin-top: 30px;
    }

    #cli-top > p{
        margin-top: 30px;
    }

    #cli-top > *{
        margin-left: 10px;
    }
    
    /*클리닉 상세 정보 출력 영역 div*/

    #cli-middle{
        border-left: 1px solid;
        border-right: 1px solid;
        height: auto;
        padding-top: 30px;
        padding-bottom: 30px;
    }

    #cli-middle > h4{
        margin-left: 10px;
    }

    #cli-middle > p{
        margin-left: 10px;
    }

    /*클리닉 후기 출력 영역 div*/
    #cli-bottom{
        border: 1px solid;
        height: auto;
    }

    #cli-bottom > h4{
        margin-top: 30px;
        margin-left: 10px;
    }
  
    /*모달*/
    .modal{
        margin-top: 100px;
    }

    /*모달 별점*/
    #scope fieldset{
        display: inline-block;
        direction: rtl;
        border:0;
    }

    #scope fieldset legend{
        text-align: right;
    }

    #scope input[type=radio]{
        display: none;
    }

    #scope label{
        font-size: 3em;
        color: transparent;
        text-shadow: 0 0 0 #f0f0f0;
    }

    #scope label:hover{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }

    #scope label:hover ~ label{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }

    #scope input[type=radio]:checked ~ label{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }

    #reviewContents {
        width: 100%;
        height: 150px;
        padding: 10px;
        box-sizing: border-box;
        border: solid 1.5px #D3D3D3;
        border-radius: 5px;
        font-size: 16px;
        resize: none;
    }

    /*모달 리뷰 내용*/
    #revContent{
        width: 450px;
    }
    

    /*리뷰 출력*/
    #rev-border{
        vertical-align: middle;
    }

    #rev-list{
        list-style: none;
        
    }
    
    .rev-content{
        border: 1px solid;
        border-radius: 5px;
        width: 900px;
        margin-top: 20px;
        margin-left: 8px;
    }

    #cli-top > span{
        vertical-align: middle;
    }

    .revScope{
        border: 1px solid;
        width: auto;
    }

    .revScope > span{
        vertical-align: middle;
        margin-right: 5px;
    }
</style>
</head>
<body>

    <!--상단 네비게이션 메뉴 div-->
    <header>
        <%@ include file="../common/nav2.jsp"%>
    </header>

    <!--전체를 감싸는 div-->
    <div class="outer">

        <!--하단 내용 영역을 감싸는 div-->
        <div class="content" align="center">

            <!--좌측 메뉴 div-->
            

            <!--클리닉 출력 영역 div-->
            <div id="cli-content" align="left">

                <% if(loginUser != null){ %>
                    <!--클리닉 예약하기 페이지로 이동하는 버튼-->
                    <div id="res-btn" align="right">
                        <button class="btn btn-primary" type="button" id="resBtn">예약하기</button>
                    </div>
                <% } %>

                <!--클리닉 간단 정보 출력 영역 div-->
                <div id="cli-top" >
                    <h4><%= c.getCouName() %></h4>
                    <p><%= c.getHosName() %></p>
                    <span class="material-symbols-outlined">grade</span>
                    <span><%= scope %></span>
                    <p><%=c.getPrice()%>원</p>

                </div>

                <!--클리닉 상세 정보 출력 영역 div-->
                <div id="cli-middle">
                    <h4>주요 자격 및 경력</h4>

                    <%if(list.isEmpty()){%>
                        <p>상세 정보가 없습니다.</p>
                    <% } else { %>
                        <%for(CouCar cc : list) {%>
                            <p><%=cc.getCarContent()%></p>
                        <% } %>
                    <% } %>        
                </div>

                <!--클리닉 후기 출력 영역 div-->
                <div id="cli-bottom">
                    <h4>후기</h4>

                    <% if(loginUser != null && result > 0 && result2 == 0) {%>
                        <button data-toggle="modal" data-target="#myModal">후기 작성</button>
                    <% } %>   
                    
                    <div id="rev-border">
                        <ul id="rev-list">

                        </ul>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <div id="footer">
        <%@ include file ="../common/footer.jsp" %>
    </div>

    

    

    

<!--리뷰 작성 모달창-->
<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">리뷰 작성하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

            <!-- Modal body -->
            <div class="modal-body">

                <div id="scope">
                    <h6>별점</h6>
                    <input type="hidden" name="memNo" value="<%=loginUser.getMemNo()%>">
                    <fieldset>
                        <input type="radio" name="reviewStar" value="5" id="rate1" checked><label
                            for="rate1">★</label>
                        <input type="radio" name="reviewStar" value="4" id="rate2"><label
                            for="rate2">★</label>
                        <input type="radio" name="reviewStar" value="3" id="rate3"><label
                            for="rate3">★</label>
                        <input type="radio" name="reviewStar" value="2" id="rate4"><label
                            for="rate4">★</label>
                        <input type="radio" name="reviewStar" value="1" id="rate5"><label
                            for="rate5">★</label>
                    </fieldset>
                </div>

                <div id="rev">
                    <h6>리뷰 작성</h6>
                    <textarea name="revContent" id="revContent" cols="30" rows="10" style="resize: none;"></textarea>
                </div>
            </div>
        
  
            <!-- Modal footer -->
            <div class="modal-footer">
            <button id="insertRev" class="btn btn-primary" data-dismiss="modal">등록하기</button>
            </div>

        </div>
    </div>
    
  </div>

    <script>

        // 예약 버튼 클릭 시 예약하기 페이지로 이동
        $('#resBtn').click(function(){
            location.href='<%=contextPath%>/resForm.cou?cno=<%=c.getCouNo()%>';
        })

        // 리뷰 등록하기 버튼 클릭 시 리뷰 작성
        $('#insertRev').click(function(){
            $.ajax({
                url:'ajaxRev.cou',
                type:'post',
                data:{
                    cno: <%=c.getCouNo()%>,
                    memNo: <%=loginUser.getMemNo()%>,
                    couScope:$('input[name=reviewStar]:checked').val(),
                    revContent:$('#revContent').val()
                },
                success:function(result){
                    alert('리뷰 등록 성공');
                },
                error:function(){
                    alert('리뷰 등록 실패');
                }
            })
            location.reload();	
        })

        // 리뷰 목록 불러오기
        function selecRevList(){
            $.ajax({
                url:'ajaxRevList.cou',
                data:{
                    cno: <%=c.getCouNo()%>
                },
                success:function(result){
                    let resultStr = '';
                    for(let i in result){
                        resultStr += '<li class="rev-content">'

                                + '<div class="revNickName">'
                                    + '<p>' + result[i].nickName + '</p>'
                                + '</div>'

                                + '<div class="revScope">'
                                    + '<span>★</span>'
                                    + '<span>' + result[i].couScope + '</span>'
                                + '</div>'

                                +'<div class="reContent">'
                                    + '<p>' + result[i].revContent + '</p>'
                                + '</div>'

                                + '<div class="revDate">'
                                    + '<P>' + result[i].createDate + '</p>'
                                + '</div>'

                                + '</li>'
                    }
                    $('#rev-list').html(resultStr);
                },
                error:function(){
                    console.log('리뷰 불러오기 실패');
                }
            })
        }

        $(function(){
            selecRevList();

            setInterval(selecRevList, 1000);
        })
    </script>

</body>
</html>