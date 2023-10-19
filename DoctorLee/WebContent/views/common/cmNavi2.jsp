<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 사이드바</title>

 <style>

        #mp_navi {
            width : 225px;
            height: 700px;
            background-color:#1E376F;
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
            color : whitesmoke;
            display : block;
            line-height: 35px;;
        }
        
        #navigator a:hover {
            font-size : 16px;
            color : rgba(245, 245, 245, 0.445)
        }
        
        #user_photo{
            width:100px;
            height:100px;
            margin-left: 50px;
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
            padding : 10px;
        }
        
        #navigator > li > a:hover + ul{
            display: block;
        }
        
        #navigator > li > ul:hover{
            display: block;
        }
        
        #navigator >li > ul a{font-size: 13px;}
        
        .loginMemUser{width: 150px; height: 40px; border-radius: 7px; }
    </style>
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
		                    <br><br>
		                    <div align="center"><%=loginUser.getMemName()%>님 환영합니다.</div><br>
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
                		<li><a  href="<%= contextPath %>/views/board/boardEnrollForm.jsp" class="btn btn-primary loginMemUser">게시글 작성</a></li>
                    	<li><a href="#" class="btn btn-primary loginMemUser">내가 쓴 글 확인</a>
                    	<li><a href="<%= contextPath %>/list.ms?cpage=1&memNo=<%= loginUser.getMemNo() %>&type=receiver" class="btn btn-primary loginMemUser">쪽지함</a></li>
                    <% } else { %>
                    	<li><a href='javascript:void(0);' onclick="alert('로그인 후 이용 가능한 기능입니다.');" class="btn btn-primary loginMemUser">게시글 작성</a></li>
                    	<li><a href='javascript:void(0);' onclick="alert('로그인 후 이용 가능한 기능입니다.');" class="btn btn-primary loginMemUser">내가 쓴 글 확인</a></li>
                    	<li><a href='javascript:void(0);' onclick="alert('로그인 후 이용 가능한 기능입니다.');" class="btn btn-primary loginMemUser">쪽지함</a></li>
                    <% } %>
                        	<li>
                                <a href="<%= contextPath %>/list.bo?cpage=1&type=10">공지사항</a>
                            </li>
                            <li>
                                <a href="<%= contextPath %>/list.bo?cpage=1&type=20">자유게시판</a>
                            </li>
                            <li>
                                <a href="<%= contextPath %>/list.bo?cpage=1&type=30">정보게시판</a>
                            </li>
                            <li>
                                <a href="<%= contextPath %>/list.bo?cpage=1&type=40">익명게시판</a>
                            </li>
                            <li><a href="<%= contextPath %>/list.qz?cpage=1">퀴즈게시판</a></li>
                            <% if(loginUser != null){ %>
                            <li><a href="<%= contextPath %>/list.ms?cpage=1&memNo=<%= loginUser.getMemNo() %>&type=receiver">쪽지함</a></li>
                        	<% } else { %>
                        	<li><a href='javascript:void(0);' onclick="alert('로그인 후 이용 가능한 기능입니다.');">쪽지함</a></li>
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