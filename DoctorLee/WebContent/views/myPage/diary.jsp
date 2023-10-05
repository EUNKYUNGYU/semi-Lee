<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.mpBoard.model.vo.MyDiary" %>
<%
	ArrayList<MyDiary> list = (ArrayList<MyDiary>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 페이지</title>
<style>
    div{
        box-sizing : border-box;
    }
	#diary{width : 1000px;
		   height : 600px;
	}
	#diary{
		width : 100%;
		
	}
	#diary1 {
		width : 80%;
		height : 100%;
		float : left;

		
	}
	#diary > div {
		height : 100%;
	}
	#diary1 > div{
		height : 100%;
		float : left;
		
	}
	#my_diary , #fam_diary{
		width : 50%;
	}
	
    #area{
        width : 20%;
        float: left;
        
    }
    #my_diary > a{
        text-decoration: none;
        color : black;
        margin-left : 170px;
    }
    #fam_diary > a{
        text-decoration: none;
        color : black;
        margin-left : 170px;
        
    }
    
    #customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 60%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
   #customers1 {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 60%;
}

#customers1 td, #customers1 th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers1 tr:nth-child(even){background-color: #f2f2f2;}

#customers1 tr:hover {background-color: #ddd;}

#customers1 th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
	
	
			   
	
	
	
    
</style>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>
	
	
	
    <br><br><br>
    <h2 align="center">다이어리</h2>
    <br><hr>
   
    <div id="diary">
        <div id="area">
        
        	<%@ include file="../common/myPageNavi.jsp" %>

        </div>
    	
    	
    	
        <div id="diary1">
            
        	<div id="my_diary">
        		<h3>내 다이어리</h3>
                <table id="customers">
                    <tr>
                      <th>다이어리 번호</th>
                      <th>제목</th>
                      <th>생성 날짜</th>
                    </tr>
                    <% if(list.isEmpty()){%>
                 	<tr>
                 		<td>공지사항이 존재하지 않습니다.</td>
                 	</tr>
                    
                    <% } else { %>
                      <!-- <tr> 
                      <td>1</td>
                      <td>ㅎㅇ</td>
                      <td>2023-09-05</td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>ㅎㅇㅎㅇ</td>
                      <td>2023-09-15</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>ㅎㅇㅎㅇㅎㅇ</td>
                      <td>2023-09-21</td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>ㅎㅇㅎㅇㅎㅇ</td>
                      <td>ㅎㅇㅎㅇㅎㅇ</td>
                    </tr>
                    <tr>
                      <td>5</td>
                      <td>ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ</td>
                      <td>2023-09-25</td>
                    </tr>
                    <tr>
                      <td>6</td>
                      <td>ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ</td>
                      <td>2023-09-26</td>
                    </tr>
                    <tr>
                      <td>7</td>
                      <td>ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ</td>
                      <td>2023-09-26</td>
                    </tr>
                    <tr>
                      <td>8</td>
                      <td>ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ</td>
                      <td>2023-09-27</td>
                    </tr>
                    -->
                    <% for(MyDiary md : list){ %>
                    	<tr>
                    		<td><%= md.getDiaryNo()%></td>
                    		<td><%= md.getDiaryTitle()%></td>
                    		<td><%= md.getCreateDate()%></td>
                    	</tr>
                    <%} %>

                    <%} %>
                    
                  </table>
                  <br>
                  <a href="<%=contextPath%>/views/diary/myDiaryEnrollForm.jsp">작성하기</a>
                  
                <br><br>
        	</div>
        
        
        
        	<div id="fam_diary">
        		<h3>가족 다이어리</h3>
        		
        		<table id="customers1">
                    <table id="customers">
                    <tr>
                      <th>다이어리 번호</th>
                      <th>제목</th>
                      <th>생성 날짜</th>
                    </tr>
                    <tr>
                      <td>1</td>
                      <td>ㅎㅇ</td>
                      <td>2023-09-05</td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>ㅎㅇㅎㅇ</td>
                      <td>2023-09-15</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>ㅎㅇㅎㅇㅎㅇ</td>
                      <td>2023-09-21</td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>ㅎㅇㅎㅇㅎㅇ</td>
                      <td>ㅎㅇㅎㅇㅎㅇ</td>
                    </tr>
                    <tr>
                      <td>5</td>
                      <td>ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ</td>
                      <td>2023-09-25</td>
                    </tr>
                    <tr>
                      <td>6</td>
                      <td>ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ</td>
                      <td>2023-09-26</td>
                    </tr>
                    <tr>
                      <td>7</td>
                      <td>ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ</td>
                      <td>2023-09-26</td>
                    </tr>
                    <tr>
                      <td>8</td>
                      <td>ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ</td>
                      <td>2023-09-27</td>
                    </tr>
                    
                    
                  </table>
                  <br>
                  <a href="<%=contextPath%>/views/diary/famDiaryEnrollForm.jsp">작성하기</a>
                <br><br>
                
        	</div>
            <hr>
        	
        
            
        </div>
        
        
       
        
    </div>
    <%@ include file="../common/footer.jsp" %>


</body>
</html>