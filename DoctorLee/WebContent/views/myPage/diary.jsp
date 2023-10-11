<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.mpBoard.model.vo.MyDiary" %>
<%@ page import="com.kh.DoctorLee.mpBoard.model.vo.FamDiary" %>
<%
	ArrayList<MyDiary> list = (ArrayList<MyDiary>)request.getAttribute("list");
%>
<%
	ArrayList<FamDiary> famList = (ArrayList<FamDiary>)request.getAttribute("famList");
	Member loginUser = (Member)session.getAttribute("loginUser");
	
	//System.out.println(list);
	//System.out.println(famList);
	//System.out.println(loginUser2);
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
		   margin : auto;
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
    	
    	
    	 <% if(loginUser == null) { %>
   			 <form action="<%= contextPath %>/login.me" id="login-form" method="post">
    		 	<button type="submit" >로그인하러가기</button>
   	 		 </form>
   	 	<% } else { %>
   	 	
   	 	<input type="hidden" name="memNo" value=<%=loginUser.getMemNo() %>>
        <div id="diary1">
            
        	<div id="my_diary">
        		<h3>내 다이어리</h3>
        		
                <table id="customers" class="list-area">
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
                  <a href="<%=contextPath%>/myEnroll.di">작성하기</a>
                  
                <br><br>
        	</div>
        	
        	
        	<div id="fam_diary">
        	
        
        
        		<h3>가족 다이어리</h3>
        		
        		<table id="customers1">
                    <table id="customers" class="list-area">
                    <thead>
                    <tr>
                      <th>다이어리 번호</th>
                      <th>제목</th>
                      <th>생성 날짜</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% if(famList.isEmpty()){%>
                    	<tr>
                 			<td>공지사항이 존재하지 않습니다.</td>
                 		</tr>
                    
                    <% } else { %>
                    
                    <!--  
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
                    </tr>-->
                   <% for(FamDiary fd : famList){ %>
                    	<tr>
                    		<td><%= fd.getFamDirNo() %></td>
                    		<td><%= fd.getFamDirTitle() %></td>
                    		<td><%= fd.getCreateDate()%></td>
                    	</tr>
                    <%} %>

                    <%} %>
                    </tbody>
                    
                  </table>
                  <br>
                  <a href="<%=contextPath%>/famEnroll.di">작성하기</a>
                <br><br>
                
        	</div>
            
        	
        <%// System.out.println(famList); %>
        <% //System.out.println(loginUser); %>
        <% //System.out.println(list); %>
            
        </div>
        
       
        
    </div>
        
        	<script>
        		$(function(){
        			$('.list-area>tbody>tr').click(function(){
        				//console.log($(this).children().eq(0).text());
        				const dno = $(this).children().eq(0).text();
        				location.href="<%=contextPath%>/detail.di?dno="+ dno;
        			})
        		});
        	</script>
        	<form>
        		<input type="hidden" name = "dno" id=dno>
        	</form>
    <%@ include file="../common/footer.jsp" %>
	<%} %>

</body>
</html>