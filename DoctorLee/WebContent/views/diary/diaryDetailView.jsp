<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.mpBoard.model.vo.MyDiary" %>
<%
	MyDiary md = (MyDiary)request.getAttribute("md");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 디테일</title>
<link rel="stylesheet" href="resources/css/myPage/diary.css">




</style>
</head>
<body>
	<%@ include file="../common/navi.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">내 다이어리 </h2>
        
        <form action="<%=contextPath%>/myInsert.di" id="enroll-form" method="post">
        
            
            <br><br><br>
            <table align="center">
                <tr>
                    <th width="50">제목</th>
                    <td width="700" ><input type="text" name="title" maxlength="300" value=<%=md.getDiaryTitle() %> readonly></td>
                </tr>
                <br><br><br>
                <tr>
                    <th >내용</th>
                </tr>
                <tr>
                    
                    <td colspan="3">
                        <textarea name="content" id="content" style="resize:none;" rows="20" readonly><%=md.getDiaryContent() %></textarea>
                        
                    </td>
                </tr>
            </table>
            
            <script>
            
            	
            </script>
            <br><br>
            <div align="center">
            	<a href="<%= contextPath %>/updateForm.di?dno=<%=md.getDiaryNo()%>" >수정하기</a>
                <a href="<%= contextPath %>/delete.di?dno=<%=md.getDiaryNo()%>">삭제하기</a>
                <button type="button"  onclick="history.back();">뒤로가기</button>
                
            </div>
           
        </form>
        <br><br>
        
        
       
    </div>
    <%@ include file="../common/footer.jsp"%>

</body>
</html>