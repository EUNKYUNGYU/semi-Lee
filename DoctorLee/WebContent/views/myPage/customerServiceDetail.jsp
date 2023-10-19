<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.mpBoard.model.vo.CustomerService" %>
<%
	CustomerService cs = (CustomerService)request.getAttribute("cs");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/myPage/customerServiceDetail.css">
<meta charset="UTF-8">
<title>고객센터 상세보기</title>
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
                 <div id="content_2">
                <p id="p11">마이페이지</p>
                <p id="p21">고객센터</p>
                <br>
                <hr>
                <br><br>
                <table>
                    <tr>
                    	<th><%=cs.getInqNo() %></th>
                        <th id="csTitle">제목: <%=cs.getInqTitle() %> | 작성일: <%=cs.getCreateDate() %></th>
                    </tr>
                    <tr>
                        <th id="csContent"><%=cs.getInqContent() %></th>
                    </tr>
                </table>
                <span><a href="<%=contextPath %>/delete.cs?nno=<%=cs.getInqNo() %>" class="deletebtn" id="csdelete2">삭제하기</a></span>
                <span><a href="<%=contextPath %>/customerService.mp?cpage=1" class="deletebtn" id="csdelete">목록가기</a></span>
        	</div>
        </div>
      </div>
    </div>
</body>
</html>