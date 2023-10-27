<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.member.model.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String contextPath2 = request.getContextPath();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 다이어리 쓰기</title>
<link rel="stylesheet" href="resources/css/myPage/diary.css">
</head>
<body>
	<jsp:include page="../common/navi.jsp"/>
	

    <div class="outer">
        <br>
        <h2 align="center">내 다이어리 쓰기</h2>
        <form action="<%=contextPath2%>/myInsert.di" id="enroll-form" method="post">
        <input type="hidden" name="memNo" value="${sessionScope.loginUser.memNo }">
            
            <br><br><br>
            <table align="center">
                <tr>
                    <th width="50">제목</th>
                    <td width="700" ><input type="text" name="title" maxlength="300"></td>
                </tr>
                <br><br><br>
                <tr>
                    <th >내용</th>
                </tr>
                <tr>
                    
                    <td colspan="3">
                        <textarea name="content" id="content" style="resize:none;" rows="20"></textarea>
                        <span id="count">0</span>/300
                    </td>
                </tr>
            </table>
            <!-- 글자수 function -->
            <script>
            $(function(){
                $('#content').keyup(function(){
                    console.log($(this).val().length);
                    $('#count').text($(this).val().length);
                })
            })
            	
            </script>
            <br><br>
            <div align="center">
                <button type="submit">작성하기</button>
                <button type="button"  onclick="history.back();">뒤로가기</button>
            </div>
           
        </form>
        <br><br>
        
       
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
   

</body>
</html>