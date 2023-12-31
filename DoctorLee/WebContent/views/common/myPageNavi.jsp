<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.member.model.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String contextPath1 = request.getContextPath();
	
%>

    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 네비</title>
<script src="https://kit.fontawesome.com/46331f5575.js" crossorigin="anonymous"></script>
    
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- bxslider -->
    <script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	
	<!-- css -->
	<link rel="stylesheet" href="resources/css/index.css">
 	<link rel="stylesheet" href="resources/css/myPage/myPageNavi.css">
</head>
<body>
    		
            
            <div id="mp_navi">
                <div id="empty">
                    <table id="user" align="center">
                        <tr>
                            <br><br>
                            <div align="center">${sessionScope.loginUser.memName} 님 환영합니다.</div><br>
                            

                        </tr>
                        <tr>
                            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMTlfMjA1%2FMDAxNjE2MDgwOTM1MDIx.JZKXWzM8gscL4K0VtyQuYki9jetacIhoppgLJ0PlxEcg.iqtKX-tjRe6nSqfieZ6uYV1QS-4S2LewzhkIAVyic4kg.PNG.wnsghks1017%2Fimage.png&type=a340" alt="회원사진" id="user_photo" >
                        </tr>
                        
                            
                        
                    </table>
                    <div>
                        날짜 : <br>
                        오늘 예약 : <br>
                    </div>
                </div>
                <ul id="navigator">
                    <li><a href="<%=contextPath1%>/list.medi">복약관리</a></li>
                    <li><a href="<%=contextPath1%>/updateForm.me">회원정보 수정</a></li>
                    <li><a href="<%=contextPath1%>/customerService.mp">고객센터</a></li>
                    <li><a href="#">자기 게시글 확인</a></li>
                    <li><a href="#">예약 관리</a></li>
                    <li><a href="first.bm">병원즐겨찾기</a></li>
                    <li><a href="<%=contextPath1%>/first.mehi">진료 내역 관리</a>
                        <ul>
                            <li><a href="/reservation.h">진료 내역 관리</a></li>
                            <li><a href="/prescription.h">처방전</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=contextPath1%>/main.hc">건강 관리</a></li>


                    <li><a href="<%=contextPath1 %>/first.di">다이어리</a>
                        <ul>
                            <li><a href="<%=contextPath1 %>/first.di">내 다이어리</a></li>
                            <li><a href="<%=contextPath1 %>/first.di">가족 다이어리</a></li>

                        </ul>
                    </li>

                    <li><a href="#">가족 계정 추가</a></li>
                </ul>


            </div>
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