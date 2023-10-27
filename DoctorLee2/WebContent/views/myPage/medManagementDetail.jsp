<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.DoctorLee.mpBoard.model.vo.MedManagement, com.kh.DoctorLee.medicine.model.vo.Medicine" %>
<%
	MedManagement mm = (MedManagement)request.getAttribute("mm");
	Medicine med = (Medicine)request.getAttribute("med");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/myPage/medManagementDetail.css">
<meta charset="UTF-8">
<title>복약관리상세조회</title>
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
            
                <p id="p21">복약관리</p>
                <hr>
                <br>

                <table id="detail-area" align="center">
                    <thead>
                      <tr>
                        <th>병원명:<%=mm.getHosName() %></th>
                        <th>진료일자:<%=mm.getTreateDate() %></th>
                        <th>처방전발급일:<%=mm.getPreDate() %></th>
                      </tr>
                      
                      <tr>
                          <th>약품명</th>
                          <th>복약안내</th>
                          <th>주의사항</th>
                      </tr>
                    </thead>
                      <tbody>
                        <tr>
                          <td><%=med.getMedName() %></td>
                          <td><%=med.getPreInfo() %></td>
                          <td><%=med.getCauction() %></td>
                        <tr>
                           
                        </tbody>
                  </table>
            <span><a href="<%=contextPath%>/delete.medi?nno=<%= mm.getMedManNo()%>" class="deletebtn" id="csdelete2">삭제하기</a></span>
            <span><a href="<%=contextPath%>/list.medi" class="deletebtn" id="csdelete">목록가기</a></span>
               </div>
            </div>
        </div>
         <%@ include file="../common/footer.jsp" %>
</body>
</html>