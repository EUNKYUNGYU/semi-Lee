<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.DoctorLee.mpBoard.model.vo.CustomerService"%>
<%
	ArrayList<CustomerService> list = (ArrayList<CustomerService>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/myPage/customerService.css">
<meta charset="UTF-8">
<title>고객센터</title>
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
            
                <p id="p11">마이페이지</p>
            
                <p id="p21">고객센터</p>
                <br>
                <hr>
                <div id="inqbtn" align="center">
                    <input type="button" value="문의하기" id="inq2" onclick="adminInqPage();">
                </div>

                <table class="list-area" align="center">
                    <thead>
                      <tr>
                        <th id="th1">번호</th>
                        <th id="th2">문의</th>
                        <th id="th3">제목</th>
                        <th id="th4">작성일</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%if(list.isEmpty()) { %>
                    <!-- 없을때 -->
                    <tr>
                    	<td>작성한 문의글이 없습니다.</td>
                    </tr>
                    <%} else { %>
                    <!-- 있을때 -->
                    	<% for(CustomerService cs : list) {%>
                    	
                      <tr>
                        <td><%=cs.getInqNo() %></td>
                        <td><%=cs.getInqType() %></td>
                        <td id="th33"><%=cs.getInqTitle() %></td>
                        <td id="th44"><%=cs.getCreateDate() %></td>
                      </tr>
                    <%} %>
                    	<%} %>
                    </tbody>
                  </table> 

            </div>
        </div>
     </div>
      <%@ include file="../common/footer.jsp" %>
     <script>
     	
     	function personalInqPage(){
    	 	location.href="<%=contextPath%>/personalInq.mp";
     	}
     
     	function adminInqPage(){
     		location.href = "<%=contextPath%>/adminInq.mp";
     	}
     	
     	$(function(){
     		$('.list-area>tbody>tr').click(function(){
     			
     			const nno = ($(this).children().eq(0).text());
     			
     			location.href= "<%=contextPath%>/detail.cs?nno=" + nno;
     			//location.href= "<%=contextPath%>/detail.cs";
     		
     		})
     	});
     </script>
</body>
</html>