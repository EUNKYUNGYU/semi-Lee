<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.member.model.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
 <style>
 div{
            
            box-sizing: border-box;
        }
        #wraper{
            width: 1000px;
            height: 800px;
           
        }
        #wraper > div{
            width : 100%;
        }
        #myPage{
            height : 100%;
        }
        #myPage > div {
            display : inline;
            height : 100%;
            float:left;
        }
        #mp_navi {
            width : 15%;
            background-color:#1E376F;
            border : 3px solid #0c2761 ;
            border-radius: 7px;
            
        }
        #mem_info{
            width : 85%;
        }
        #mpg_navi{
            list-style:none;
            margin : 0;
            padding : 0;
            
            margin-top : 100px;
            
            
            
            
        }
        #mpg_navi > li{
            text-align : center;
        }
        #mpg_navi a{
            text-decoration: none;
            color : whitesmoke;
            display : block;
            line-height: 35px;;


        }
        #mpg_navi a:hover {
            font-size : 16px;
            color : rgba(245, 245, 245, 0.445)
        }
        #user_photo{
            width:100px;
            height:100px;
            margin-left: 20px;

        }
        #empty{
            background-color: white;
        }
        #mpg_navi > li >ul{
            list-style: none;
            padding : 0;
            display : none;
        }
        #mpg_navi > li > a:hover + ul{
            display: block;
        }
        #mpg_navi > li > ul:hover{
            display: block;
        }
        #mpg_navi >li > ul a{font-size: 13px;}
       #my_info > img{
            width : 170px;
            margin-left : 50px;
            margin-top : 60px;
       }
       #fam_info > img{
            width : 170px;
            margin-left : 50px;
            margin-top : 60px;
       }
       h3 {
        margin-left : 50px;
       }
       p {
        margin-left : 50px;
       }
       .myPageMain{
       		text-align : center;
       		margin-bottom : 80px;
       }

</style>
</head>
<body>
 	
	<%@ include file="../common/navi.jsp" %>
	
	
	<h2 class="myPageMain">마이페이지</h2><br>
    <hr>
    <c:choose>
    <c:when test="${empty sessionScope.loginUser }">
    
    <form action="<%= contextPath %>/login.me" method="post">
    	<button type="submit">로그인하러가기</button>
    	
    </form>
    </c:when>
    <c:otherwise>
    <div id="wraper">
        <div id="myPage">
            
            <div id="mp_navi">
                <div id="empty">
                    <table id="user">
                        <tr>
                            <br><br>
                            <th align="center">${sessionScope.loginUser.memName } 환영합니다.</th><br>
                            

                        </tr>
                        <tr>
                            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMTlfMjA1%2FMDAxNjE2MDgwOTM1MDIx.JZKXWzM8gscL4K0VtyQuYki9jetacIhoppgLJ0PlxEcg.iqtKX-tjRe6nSqfieZ6uYV1QS-4S2LewzhkIAVyic4kg.PNG.wnsghks1017%2Fimage.png&type=a340" alt="회원사진" id="user_photo" >
                        </tr>
                        
                            
                        
                    </table>
                    <div>
                        만든 날짜 : <br>${sessionScope.loginUser.createDate }
                        <br>
                        오늘 예약 : <br>
                    </div>
                    <br><br><br>
                </div>
                <ul id="mpg_navi">
                    <li><a href="<%=contextPath%>/list.medi">복약관리</a></li>
                    <li><a href="<%=contextPath%>/updateForm.me">회원정보수정</a></li>
                    <li><a href="<%=contextPath%>/customerService.mp">고객센터</a></li>
                    <li><a href="#">자기 게시글 확인</a></li>
                    <li><a href="#">예약 관리</a></li>
                    <li><a href="<%=contextPath%>/main.bm">병원즐겨찾기</a></li>
                    <li><a href="<%=contextPath%>/first.mehi">진료 내역 관리</a>
                        <ul>
                            <li><a href="#">진료 내역 관리</a></li>
                            <li><a href="#">처방전</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=contextPath%>/main.hc">건강 관리</a></li>
                    <li><a href="<%=contextPath%>/first.di">다이어리</a>
                        <ul>
                            <li><a href="<%=contextPath%>/first.di">내 다이어리</a></li>
                            <li><a href="<%=contextPath%>/first.di">가족 다이어리</a></li>
                        </ul>
                    </li>

                    <li><a href="#">가족 계정 추가</a></li>
                </ul>


            </div>
            <div id="mem_info">
                <div id="my_info">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA2MTNfMjcz%2FMDAxNjU1MDQ4NDU0NDkw.O3lQE9MMivnCNvAFZne6k5HrLr20MJRuV6pqDZTdDdMg.PeiJfGqE2PdsWhsyVSlYcK1B7MsF0srJe0J8mN0unXEg.JPEG.553812%2F%25B4%25D9%25BF%25EE%25B7%25CE%25B5%25E5.jpeg&type=a340" alt="이미지">
                    <h3>일반회원 ) ${sessionScope.loginUser.memName }님</h3>
                    <p>
                    <br>
                        이메일 :  ${sessionScope.loginUser.email }      <br>
                        휴대폰 번호 : ${sessionScope.loginUser.phone }
                    </p>
                    
                </div>
                <hr>
                <div id="fam_info">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA2MTNfMjcz%2FMDAxNjU1MDQ4NDU0NDkw.O3lQE9MMivnCNvAFZne6k5HrLr20MJRuV6pqDZTdDdMg.PeiJfGqE2PdsWhsyVSlYcK1B7MsF0srJe0J8mN0unXEg.JPEG.553812%2F%25B4%25D9%25BF%25EE%25B7%25CE%25B5%25E5.jpeg&type=a340" alt="이미지">
                    <h3>가족회원 ) xxx님</h3>
                    <p>
                    <br>
                        이메일 : 
                        휴대폰 번호 :
                    </p>
                </div>
            </div>

        </div>
       
    </div>
    </c:otherwise>
   
    </c:choose>
     <jsp:include page="../common/footer.jsp"/>
    <script>
        $(function(){
            $('a').click(function(){
                let $a = $(this).next();

                if($a.css('display') == 'none'){
                    $a.siblings('ul').slideUp(1000);

                    $a.slideDown(1000);
                }
                else{
                    $a.slideUp(1000);
                }
            })
        })
        
    </script>

</body>
</html>