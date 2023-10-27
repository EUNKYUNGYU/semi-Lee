<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.DoctorLee.mpBoard.model.vo.Category" %>
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list"); 
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/myPage/inqForm.css">
<meta charset="UTF-8">
<title>관리자문의</title>
</head>
<body>
	 <div id="wrap">
        <div id="header">
        	<%@ include file = "../common/nav2.jsp" %>
        </div>

        <div id="content">
            <div id="content_1">
            	<%@ include file = "../common/myPageNavi.jsp" %>
            </div>
            <div id="content_2">
            <form action="<%=contextPath%>/insert.cs" method="post">
            <input type="hidden" name="memNo" value=<%=loginUser.getMemNo() %>>
                <p id="p11">마이페이지</p>
                <hr>
                <p id="p21">관리자 문의하기</p>
                
                <br>
                <hr>
				<br>
				<select name="category" id="optionbtn">
				<% for(Category c : list) { %>
                    <option value="<%= c.getCategoryNo()%>">
                    	<%=c.getCategoryName() %>
                    </option>
				<%} %>
                </select>
                <textarea id="inqTitle" name="inqTitle" maxlength="50" placeholder="제목을 입력해주세요."></textarea>
                <textarea id="inqContent" name="inqContent" maxlength="1000" placeholder="내용을 입력해주세요."></textarea>
                <br>
                <span id="count">0 </span>/ 1000자
                <button type="submit" id="pwd_1" onclick="insertAdminPage();">확인</button>
                
    		</form>
            </div>
        
        </div>
    </div>
    <br><br><br><br>
     <%@ include file="../common/footer.jsp" %>
    <script>
    	function insertAdminPage(){
    		location.href = "<%=contextPath%>/insert.cs";
    	}
    	
    	$(function(){
    		$('#inqContent').keyup(function(){
    			$('#count').text($(this).val().length);
    		})
    	})
    </script>
</body>
</html>