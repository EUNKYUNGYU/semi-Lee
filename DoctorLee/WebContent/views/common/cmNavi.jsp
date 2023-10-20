<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 사이드바</title>

 <style>
 		*{font-family: 'Nanum Gothic', sans-serif;
font-family: 'Nanum Gothic Coding', monospace;}
        #mp_navi {
            width : 225px;
            height: 700px;
            border: 2px rgb(230, 230, 230);
            border-style: solid none;
        }
        
        #navigator{
            list-style:none;
            margin : 0;
            padding : 0;
            margin-top : 100x;
        }
        
        #navigator > li{
            text-align : center;
        }
        
        #navigator a{
            text-decoration: none;
            display : block;
            line-height: 35px;;
        }
        
        #navigator a:hover {
            font-size : 16px;
            color : #cbd6f2;
        }
        
        #user_photo{
            width:100px;
            height:100px;
            margin-left: 61px;
            margin-top: 20px;
        }
        #empty{
            background-color: white;
        }
        
        #navigator > li >ul{
            list-style: none;
            padding : 0;
            display:none;
        }
        
        #navigator > li {
            list-style: none;
            padding : 7px 30px;
        }
        
        #navigator > li > a:hover + ul{
            display: block;
        }
        
        #navigator > li > ul:hover{
            display: block;
        }
        
        #navigator >li > ul a{font-size: 13px;}
        
        .naviText{color: black;}
        
    </style>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
</head>
<body>
            <div id="mp_navi">
                <div id="empty">
                    <table id="user" align="center">
                        <tr>
                            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMTlfMjA1%2FMDAxNjE2MDgwOTM1MDIx.JZKXWzM8gscL4K0VtyQuYki9jetacIhoppgLJ0PlxEcg.iqtKX-tjRe6nSqfieZ6uYV1QS-4S2LewzhkIAVyic4kg.PNG.wnsghks1017%2Fimage.png&type=a340" alt="회원사진" id="user_photo" >
                        </tr>
					<%if(loginUser != null){%>
		                <tr>
		                    <div align="center"><%=loginUser.getMemName()%>님 환영합니다.</div>
		                </tr>
		                 <tr>
		                    <div align="center">포인트 : <%=loginUser.getPoint()%>점</div>
		                </tr>
                	<% } else { %>
	                    <tr>
	                        <div>로그인이 필요한 서비스입니다.</div>
	                    </tr>
	                <% } %>
                    </table>
                </div>
                <ul id="navigator">
                    <% if(loginUser != null){ %>
                		<li><a  href="<%= contextPath %>/enrollForm.bo" class="btn btn-primary" >게시글 작성</a></li>
                    	<li><a href="<%= contextPath %>/list.ms?cpage=1&memNo=<%= loginUser.getMemNo() %>&type=receiver" class="btn btn-primary">쪽지함</a></li>
                    	<li><a href="#" class="btn btn-light">내가 쓴 글 확인</a>
                    <% } else { %>
                    	<li><a href='javascript:void(0);' onclick="alert('로그인 후 이용 가능한 기능입니다.');" class="btn btn-primary">게시글 작성</a></li>
                    	<li><a href='javascript:void(0);' onclick="alert('로그인 후 이용 가능한 기능입니다.');" class="btn btn-primary">쪽지함</a></li>
                    	<li><a href='javascript:void(0);' onclick="alert('로그인 후 이용 가능한 기능입니다.');" class="btn btn-light">내가 쓴 글 확인</a></li>
                    <% } %>
                        	<li>
                                <a href="<%= contextPath %>/list.bo?cpage=1&type=10" class="naviText">공지사항</a>
                            </li>
                            <li>
                                <a href="<%= contextPath %>/list.bo?cpage=1&type=20" class="naviText">자유게시판</a>
                            </li>
                            <li>
                                <a href="<%= contextPath %>/list.bo?cpage=1&type=30" class="naviText">정보게시판</a>
                            </li>
                            <li>
                                <a href="<%= contextPath %>/list.bo?cpage=1&type=40" class="naviText">익명게시판</a>
                            </li>
                            <li><a href="<%= contextPath %>/list.qz?cpage=1" class="naviText">퀴즈게시판</a></li>
                            <% if(loginUser != null){ %>
                            <li><a href="<%= contextPath %>/list.ms?cpage=1&memNo=<%= loginUser.getMemNo() %>&type=receiver" class="naviText">쪽지함</a></li>
                        	<% } else { %>
                        	<li><a href='javascript:void(0);' onclick="alert('로그인 후 이용 가능한 기능입니다.');" class="naviText">쪽지함</a></li>
                        	<% } %>
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