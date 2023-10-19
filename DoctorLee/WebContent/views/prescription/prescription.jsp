<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList, com.kh.DoctorLee.mpBoard.model.vo.MedManagement" %>
<%
	ArrayList<MedManagement> list = (ArrayList<MedManagement>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>처방전 </title>
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

        
        #list-area {
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
       
       
    </style>
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
            
                <div id="p21" style="text-align: left;">처방전</div>
                <hr>
                <br>

                
                <table class="list-area">
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