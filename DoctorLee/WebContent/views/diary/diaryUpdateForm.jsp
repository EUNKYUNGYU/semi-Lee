<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.mpBoard.model.vo.MyDiary" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 업데이트</title>
<link rel="stylesheet" href="resources/css/myPage/diary.css">
</head>
<body>
	<jsp:include page="../common/navi.jsp"/>
	
	 <div class="outer">
        <br>
        <h2 align="center">내 다이어리 </h2>
        
        <form action="<%=contextPath%>/update.di" id="update-form" method="post">
        	<input type="hidden" name="dno" value="${requestScope.md.diaryNo}">
            
            <br><br><br>
            <table align="center">
                <tr>
                    <th width="50">제목</th>
                    <td width="700" ><input type="text" name="title" maxlength="300" value="${requestScope.md.diaryTitle}"></td>
                </tr>
                <br><br><br>
                <tr>
                    <th >내용</th>
                </tr>
                <tr>
                    
                    <td colspan="3">
                        <textarea name="content" id="content" style="resize:none;" rows="20">${requestScope.md.diaryContent}</textarea>
                        
                    </td>
                </tr>
            </table>
            
            <script>
            
            	
            </script>
            <br><br>
            <div align="center">
                <button type="submit">수정하기</button>
                
                <button type="button"  onclick="history.back();">뒤로가기</button>
            </div>
           
        </form>
        <br><br>
        
       
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
	

</body>
</html>