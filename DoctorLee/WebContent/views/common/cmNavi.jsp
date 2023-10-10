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
        
        #navigator > li > a:hover + ul{
            display: block;
        }
        
        #navigator > li > ul:hover{
            display: block;
        }
        
        #navigator >li > ul a{font-size: 13px;}
    </style>
</head>
<body>
            <div id="mp_navi">
                <div id="empty">
                    <table id="user" align="center">
                        <tr>
                            <br><br>
                            <th align="center">xxx님 환영합니다.</th><br>
                            
                        </tr>
                        <tr>
                            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMTlfMjA1%2FMDAxNjE2MDgwOTM1MDIx.JZKXWzM8gscL4K0VtyQuYki9jetacIhoppgLJ0PlxEcg.iqtKX-tjRe6nSqfieZ6uYV1QS-4S2LewzhkIAVyic4kg.PNG.wnsghks1017%2Fimage.png&type=a340" alt="회원사진" id="user_photo" >
                        </tr>
                    </table>
                  
                </div>
                <ul id="navigator">
                	<li><a href="#" class="btn btn-default">게시글 작성</a></li>
                    <li><a href="#" class="btn btn-default">내가 쓴 글 확인</a>
                    <li><a href="#" class="btn btn-default">쪽지함</a></li>
                	<br>
                	<br>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">자유게시판</a></li>
                    <li><a href="#">정보게시판</a></li>
                    <li><a href="#">익명게시판</a></li>
                    <li><a href="#">퀴즈게시판</a></li>
                    </li>
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