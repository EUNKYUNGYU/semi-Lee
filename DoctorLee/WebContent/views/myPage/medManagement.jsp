<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "java.util.ArrayList, com.kh.DoctorLee.mpBoard.model.vo.MedManagement" %>

<%
	ArrayList<MedManagement> list = (ArrayList<MedManagement>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/myPage/medManagement.css">
<meta charset="UTF-8">
<title>복약관리</title>
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
            
                <div id="p21" style="text-align: left;">복약관리</div>
                <hr>
                <br>

                
                <table class="list-area" align="center">
                    <thead id="thead1">
                      <tr>
                        <th>병원명</th>
                        <th>의료진</th>
                        <th>약처방</th>
                        <th>진료일자</th>
                        <th>처방전발급일</th>
                        <th>번호</th>
                      </tr>
                    </thead>
                    <tbody>
                     <!-- 복약관리 리스트가 없을때 -->
                     <%if(list.isEmpty()) { %>
                     <tr>
                     	<td>복약관리 리스트가 존재하지 않습니다.</td>
                     </tr>
                     <%} else { %>
                     <!-- 리스트 있을때 -->
                     	<%for(MedManagement mm : list) { %>
                     		<tr>
                     		<td><%=mm.getHosName() %></td>
                     		<td><%=mm.getDoctorName() %></td>
                     		<td><%=mm.getMediName() %></td>
                     		<td><%=mm.getTreateDate() %></td>
                     		<td><%=mm.getPreDate() %></td>
                     		<td><%=mm.getMedManNo() %></td>
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
    	$(function(){
    		$('.list-area>tbody>tr').click(function(){
    			
    			const nno = ($(this).children().eq(5).text());
    			
    			//console.log(this);
    			// 클릭했을떄 공지사항의 번호로 넘겨줘야함
    			//tr요소 자식의 첫번째 td의 content 영역의 값
    			
    			//번호를 이용한 요청
    			//쿼리스트링
    			location.href= "<%=contextPath%>/detail.medi?nno=" + nno;
    			//location.href = "<%=contextPath%>/detail.medi";
    			
    		})
    		
    	});
    </script>
	 
	
</body>
</html>