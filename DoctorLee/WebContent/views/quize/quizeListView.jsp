<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD:DoctorLee/WebContent/views/quize/quizeList.jsp
=======
<%@ page import ="com.kh.DoctorLee.quize.model.vo.Quize,
				 java.util.ArrayList"  %>
    
<% 
	ArrayList<Quize> list = (ArrayList<Quize>)request.getAttribute("list");
	String contextPath = request.getContextPath();
%>
>>>>>>> 9b356505bb66efe18c8d2ee946ae49081d681282:DoctorLee/WebContent/views/quize/quizeListView.jsp
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
            background-color: rgb(218, 218, 218);
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

    <%@ include file="../common/navi.jsp" %>
    
    <div id="quizewrap">
        <div id="quize"> 
            <h1>퀴즈게시판</h1>
        </div>
<<<<<<< HEAD:DoctorLee/WebContent/views/quize/quizeList.jsp
=======
        
>>>>>>> 9b356505bb66efe18c8d2ee946ae49081d681282:DoctorLee/WebContent/views/quize/quizeListView.jsp
        <div id="quizeboard"> 

            <div id="board">
        <% if(list.isEmpty()) { %>
        
        <% } else { %>
        <% for(Quize q : list) { %>
                <div id="header">
                    <div id="title"><%= q.getQuizeTitle() %></div>
                    <div id="vote"><%= q.getVote() %></div>
                    <div id="deadline"><%= q.getDeadline() %>일 남음</div>
                </div>
                <div id="content">
<<<<<<< HEAD:DoctorLee/WebContent/views/quize/quizeList.jsp
                    퀴즈 내용 <br>
=======
                   	 <%= q.getQuizeContent() %> <br>
>>>>>>> 9b356505bb66efe18c8d2ee946ae49081d681282:DoctorLee/WebContent/views/quize/quizeListView.jsp

                    <form>
                        
                        <input type="radio" name="choice" value="선택지1" id="choice1" checked>
                        <label for="choice1"><%= q.getChoice1() %></label> <br>
    
                        <input type="radio" name="choice" value="선택지2" id="choice2" >
                        <label for="choice2"><%= q.getChoice2() %></label> <br>
    
                        <input type="radio" name="choice" value="선택지3" id="choice3" >
                        <label for="choice3"><%= q.getChoice3() %></label> <br>
    
                        <input type="radio" name="choice" value="선택지4" id="choice4" >
                        <label for="choice4"><%= q.getChoice4() %></label> <br>

                        
                    </div>
                    <div id="footer">
                        <div id="footer1">
                            <input type="submit" id="quizeButton" class="btn btn-default">
                        </div>
                    </form>

                    <div id="footer2">
<<<<<<< HEAD
                        <a href="#" >정답 확인하기 &gt;</a>
=======
                        <a href="<%= contextPath %>/quize/controller/list.qz?qno=<%= q.getQuizeNo() %>" >정답 확인하기 &gt;</a>
>>>>>>> 165e7a4a7a8829564a6320af1d77ee9401a7faaa
                    </div>
                </div>

            </div>
      
        </div>
        	<% } %>
        <% } %>
    	
		



    </div>


</body>
</html>