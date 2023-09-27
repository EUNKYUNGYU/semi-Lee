<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.kh.DoctorLee.quize.model.vo.QuizeAnswer,
				 java.util.ArrayList"  %>
    
<% 
	String contextPath = request.getContextPath();
	QuizeAnswer qa = (QuizeAnswer)request.getAttribute("qa");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈게시판 정답</title>


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

        #title{
            height: 100%;
            font-size: 30px;
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
                    <div id="title"><%= qa.getQuizeTitle() %></div>
                </div>
                <div id="content">

					<%= qa.getAnswer() %> <br>
					<%= qa.getAnswerDetail() %>
                    
                </div>
                <div id="footer">
                	<div id="footer1">
                    </div>
               

                    <div id="footer2">
                    </div>
                </div>

            </div>
      
        </div>
    	

    </div>


</body>
</html>