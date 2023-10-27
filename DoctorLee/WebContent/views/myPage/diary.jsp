<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.DoctorLee.mpBoard.model.vo.MyDiary" %>
<%@ page import="com.kh.DoctorLee.mpBoard.model.vo.FamDiary" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//ArrayList<FamDiary> famList = (ArrayList<FamDiary>)request.getAttribute("famList");
	//Member loginUser = (Member)session.getAttribute("loginUser");
	//ArrayList<MyDiary> list = (ArrayList<MyDiary>)request.getAttribute("list");
	String contextPath = request.getContextPath();
	
	//System.out.println(list);
	//System.out.println(famList);
	//System.out.println(loginUser2);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 페이지</title>
<link rel="stylesheet" href="resources/css/myPage/diary.css">
</head>
<body>
	<jsp:include page="../common/navi.jsp"/>
	
	
	
	
    <br><br><br>
    <h2 align="center">다이어리</h2>
    <br><hr>
   
    <div id="diary">
        <div id="area">
        	<jsp:include page="../common/myPageNavi.jsp"/>
        	

        </div>
    	
    	
    	 
   	 	
   	 	
   	 	<input type="hidden" name="memNo" value=${sessionScope.loginUser.memNo }>
        <div id="diary1">
            
        	<div id="my_diary">
        		<h3>내 다이어리</h3>
        		
                <table id="customers" class="list-area">
                    <tr>
                      <th>다이어리 번호</th>
                      <th>제목</th>
                      <th>생성 날짜</th>
                    </tr>
                    <c:choose>
                    <c:when test="${empty requestScope.list}">
                    
                 	<tr>
                 		<td>공지사항이 존재하지 않습니다.</td>
                 	</tr>
                    </c:when>
                    <c:otherwise>
                    
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
                    <c:forEach items="${requestScope.list}" var="mdList">
                    
                    	<tr>
                    		
                    		<td>${mdList.diaryNo }</td>
                    		<td>${mdList.diaryTitle }</td>
                    		<td>${mdList.createDate }</td>
                    	</tr>
                   	</c:forEach>
                    </c:otherwise>
                    </c:choose>
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
                    <c:choose>
                    <c:when test="${empty requestScope.famList }">
                    
                    	<tr>
                 			<td>공지사항이 존재하지 않습니다.</td>
                 		</tr>
                    </c:when>
                    <c:otherwise>
                   
                    
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
                   		<c:forEach items="${requestScope.famList }" var="fdList">
		                   
		                    	<tr>
		                    		<td>${fdList.famDirNo}</td>
		                    		<td>${fdList.famDirTitle}</td>
		                    		<td>${fdList.createDate}</td>
		                    	</tr>
                   		</c:forEach>
                    </c:otherwise>
                    </c:choose>
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
	

</body>
</html>