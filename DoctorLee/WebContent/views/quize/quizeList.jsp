<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈게시판</title>


<style>
        
        *{
            border: 0.5px solid salmon;
            box-sizing: border-box;
        }
        #quizewrap{
            width: 600px;
            height: 1000px;
        }

        #quizeboard{
            background-color: rgb(235, 233, 233);
            width: 95%;
            height: 45%;
            margin-left: 2.5%;
            margin-right: 2.5%;
            margin-top: 2.5%;
            margin-bottom: 2.5%;
        }
        #header{
            width: 100%;
            height: 70px;
            text-align: center;
            line-height: 70px;
        }

        #content{
            width: 100%;
            height: 300px;
            line-height: 30px;
        }

        #footer{
            width: 100%;
            height: 70px;
        }
        #header > div{
            float: left;
        }
        #title{
            width: 70%;
            height: 100%;
            font-size: 30px;
        }
        #vote, #endDate{
            width: 15%;
            height: 100%;
        }
        #footer > div{
            float: left;
            height: 100%;
            line-height: 70px;
        }
        #footer1{
            width: 75%;
        }
        #footer2{
            width: 25%;
            text-align: center;
            
        }
        a {
            text-decoration: none;
            color: #1E376F;

        }

        input[type=submit] {
            background-color: #1E376F;
            border-radius: 7px;
            color: white;
            width: 60px;
            height: 30px;
            margin-left: 10px;
        }

</style>
</head>
<body>

    
    
    <div id="quizewrap">
        <div id="quize"> 
            <h1>퀴즈게시판</h1>
        </div>
        <div id="quizeboard"> 

            <div id="board">
                <div id="header">
                    <div id="title">제목 넣을 공간</div>
                    <div id="vote">151명 투표</div>
                    <div id="endDate">~일 남음</div>
                </div>
                <div id="content">
                   	 퀴즈 내용 <br>

                    <form>
                        
                        <input type="radio" name="choice" value="선택지1" id="choice1" checked>
                        <label for="choice1">선택지1 공간입니다.</label> <br>
    
                        <input type="radio" name="choice" value="선택지2" id="choice2" >
                        <label for="choice2">선택지2 공간입니다.</label> <br>
    
                        <input type="radio" name="choice" value="선택지3" id="choice3" >
                        <label for="choice3">선택지3 공간입니다.</label> <br>
    
                        <input type="radio" name="choice" value="선택지4" id="choice4" >
                        <label for="choice4">선택지4 공간입니다.</label> <br>

                        
                    </div>
                    <div id="footer">
                        <div id="footer1">
                            <input type="submit" id="quizeButton" class="btn btn-default">
                        </div>
                    </form>

                    <div id="footer2">
                        <a href="<%= contextPath %>/quize/controller/list.qz" >정답 확인하기 &gt;</a>
                    </div>
                </div>

            </div>
      



        </div>
    	
		



    </div>


</body>
</html>