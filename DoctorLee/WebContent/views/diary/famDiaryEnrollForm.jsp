<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath2 = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/myPage/diary.css">
<head>
<meta charset="UTF-8">
<title>가족 다이어리 쓰기  here</title>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">가족 다이어리 쓰기</h2>
        <form action="<%=contextPath2%>/famInsert.di" id="enroll-form" method="post">
            
            <br><br><br>
            <table align="center">
                <tr>
                    <th width="50">제목</th>
                    <td width="700" ><input type="text" name="title"></td>
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
            <br><br>
            <div align="center">
                <button type="submit">작성하기</button>
                <button type="button"  onclick="history.back();">뒤로가기</button>
            </div>
           
        </form>
        <br><br>
        $(function(){
                $('#content').keyup(function(){
                    console.log($(this).val().length);
                    $('#count').text($(this).val().length);
                })
            })
        
       
    </div>
    <%@ include file="../common/footer.jsp"%>

</body>
</html>