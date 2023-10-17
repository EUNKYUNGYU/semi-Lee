<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ page import = "com.kh.DoctorLee.mpBoard.model.vo.MedManagement, com.kh.DoctorLee.medicine.model.vo.Medicine" %>
=======
<%@ page import = "com.kh.DoctorLee.mpBoard.model.vo.MedManagement,com.kh.DoctorLee.medicine.model.vo.Medicine" %>
>>>>>>> 149694f55af4d4092001019e0c4db182797ed4da
<%
	MedManagement mm = (MedManagement)request.getAttribute("mm");
	Medicine med = (Medicine)request.getAttribute("med");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>복약관리상세조회</title>
<style>
	div{
            box-sizing: border-box;
        }

        #wrap{
            width: 1800px;
            height: 1000px;
            margin: auto;
        }

        #wrap > div {
            width: 100%;
        }

        #header{
            height: 5%;
        }

        #content{
            height: 95%;
        }

        #content > div{
            height: 100%;
            float: left;
        }

        #content_1{
            width: 20%;
            height: 100%;
        }

        #content_2{
            width: 80%;
            height: 100%;
        }

        table {
                border-collapse: collapse;
                width: 950px;
                margin-left: 100;
                margin-top: 30px;
                border: 1px solid #ddd;
                background-color: white;
                }

                /* 테이블 행 */
                th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
                text-align: center;
                }

                th {
                background-color: #1E376F;
                color: #e6e6e6;
                }

                /* 테이블 올렸을 때 */
                tbody tr:hover {
                background-color: #ecf1ff;
                opacity: 0.9;
                cursor: pointer;
                }

                /* 테이블 비율 */
                th:nth-child(1),
                td:nth-child(1) {
                width: 40%;
                }

                th:nth-child(2),
                td:nth-child(2) {
                width: 40%;
                }

                th:nth-child(3),
                td:nth-child(3) {
                width: 40%;
                }

                #date1{
                 margin-left: 635px;
                }

                #p11{
			            text-align: center;
			            font-size: 38px;
			            font-weight: bolder;
			        }

            #p21{
		            font-size: 23px;
		            color: #1E376F;
		            font-weight: 600;
		            padding-top: 30px;
		            padding-left: 150px;
		        }
        
                .deletebtn{
                    text-decoration: none;
                    border: 1px solid #1E376F;
                    color: #1E376F;
                    float: right;
                    width: 100px;
                    height: 40px;
                    border-radius: 3px;
                    text-align: center;
                    padding-top: 7px;
                    margin-top: 100px;
		        }

                .deletebtn:hover{
                    background-color: #1E376F;
                    color: white;
                    text-decoration: none;
                }
                
                #csdelete2{
                	margin-right: 250px;
                	margin-left: 30px;
                }
</style>
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
            
                <p id="p21" style="text-align: left;">복약관리</p>
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
</body>
</html>