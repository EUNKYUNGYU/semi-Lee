<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>복약관리</title>
<style>
 	div{
            border:  1px solid blue;
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
                width: 16%;
                }

                th:nth-child(2),
                td:nth-child(2) {
                width: 16%;
                }

                th:nth-child(3),
                td:nth-child(3) {
                width: 16%;
                }

                th:nth-child(4),
                td:nth-child(3) {
                width: 16%;
                }

                th:nth-child(5),
                td:nth-child(3) {
                width: 16%;
                }

                th:nth-child(6),
                td:nth-child(3) {
                width: 16%;
                }
                        
                #count{
                    margin-left: 250px;
                    margin-top: 100px;
                }
      
                #date1{
                 margin-left: 635px;
                }

         /*--------------------p태그---------------------*/
        #p1{
            text-align: center;
            font-size: 38px;
            font-weight: bolder;
        }

        #p2{
            font-size: 23px;
            color: #1E376F;
            font-weight: 600;
            padding-top: 30px;
            padding-left: 150px;
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
            </div>
            
            <div id="content_2">
                <p id="p1">마이페이지</p>
            
                <p id="p2" style="text-align: left;">복약관리</p>
                <hr>
                <br>

                <span id="count">⋅ Total 2
                    <input type="date" id="date1"> ~
                    <input type="date" id="date2">
                </span>
                <table align="center">
                    <thead>
                      <tr>
                        <th>병원명</th>
                        <th>의료진</th>
                        <th>약처방</th>
                        <th>처방전발급일</th>
                        <th>진료일자</th>
                        <th>복용횟수</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>코모키</td>
                        <td>김진</td>
                        <td>페니토닌</td>
                        <td>2023-04-07</td>
                        <td>2023-04-07</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>메이퓨어의원</td>
                        <td>홍박사</td>
                        <td>없음</td>
                        <td>2022-12-23</td>
                        <td>2022-12-23</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>메이퓨어의원</td>
                        <td>홍박사</td>
                        <td>없음</td>
                        <td>2022-12-23</td>
                        <td>2022-12-23</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>메이퓨어의원</td>
                        <td>홍박사</td>
                        <td>없음</td>
                        <td>2022-12-23</td>
                        <td>2022-12-23</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>메이퓨어의원</td>
                        <td>홍박사</td>
                        <td>없음</td>
                        <td>2022-12-23</td>
                        <td>2022-12-23</td>
                        <td>0</td>
                      </tr>
                     
                   </tbody>
                  </table> 
            </div>
 		</div>
 </div>
    

</body>
</html>