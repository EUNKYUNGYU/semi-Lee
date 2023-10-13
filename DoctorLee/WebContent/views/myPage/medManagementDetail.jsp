<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.DoctorLee.mpBoard.model.vo.MedManagement" %>
<%
	MedManagement mm = (MedManagement)request.getAttribute("mm");
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
        
        #deletebtn{
            text-decoration: none;
            color: white;
        	margin-left: 1500px;
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
                          <td>• 셀트리온클래리트로</td>
                          <td>[마크로라이드계 항생제]</td>
                          <td>위장장애 유발 가능</td>
                        <tr>
                            <td>• 코슈정</td>
                            <td>[비염&콧물약]</td>
                            <td>어지러움 / 늦은 시간 복용 피하기</td>
                        </tr>
                        <tr>
                            <td>• 뮤코세린캅셀</td>
                            <td>[진해거담제&기침감기약]</td>
                            <td>어지러움 / 늦은 시간 복용 피하기</td>
                        </tr>
                        <tr>
                            <td>• 코푸정</td>
                            <td>[진해거담제&기침감기약]</td>
                            <td>입마름 / 졸음</td>
                        </tr>
                        <tr>
                            <td>• 펠루비정</td>
                            <td>[비스테로이드성 소염진통제]</td>
                            <td>운전 및 기계 조작 주의</td>
                        </tr>
                        </tbody>
                  </table>
               </div>
            </div>
			<a href="<%=contextPath%>/delete.medi?nno=<%= mm.getMedManNo()%>" id="deletebtn" class="btn btn-sm btn-primary">삭제하기</a>
        </div>
</body>
</html>