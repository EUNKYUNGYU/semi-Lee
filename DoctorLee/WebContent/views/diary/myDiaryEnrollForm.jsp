<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath2 = request.getContextPath();

%>
<style>
#enroll-form > table{
        border : 1px solid white;
    }
#enroll-form input, #enroll-form textarea{
        width : 100%;
    }



</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 다이어리 쓰기</title>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">내 다이어리 쓰기</h2>
        <form action="<%=contextPath2%>/myInsert.di" id="enroll-form" method="post">
            
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
                        <textarea name="content" style="resize:none;" rows="20"></textarea>
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
        
       
    </div>
    <%@ include file="../common/footer.jsp"%>
   

</body>
</html>