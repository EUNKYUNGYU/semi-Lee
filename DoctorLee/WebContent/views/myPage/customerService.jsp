<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.DoctorLee.mpBoard.model.vo.CustomerService"  %>
<%
ArrayList<CustomerService> list = (ArrayList<CustomerService>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
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
                border: 1px solid #ddd;
                background-color: white;
                margin-top: 50px;
                }

                /* 테이블 행 */
                th, td {
                padding: 8px;
                margin: auto;
                text-align: center;
                border-bottom: 1px solid #ddd;
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

                #count{
                    margin-left: 240px;
                    margin-top: 100px;
                }
      
                #date1{
                 margin-left: 635px;
                }
        
                #inqbtn{
                    margin-top: 30px;
                    
                }

                #inq1:hover{
                    background-color: #1E376F;
                    color: white;
                }
                #inq2:hover{
                    background-color: #1E376F;
                    color: white;
                }
                #inq1, #inq2{
                    width: 150px;
                    height: 50px;
                    border-radius: 3px;
                    border: 1px solid #1E376F;
                    background-color: white;
                }

                #inq1{
                    margin-right: 80px;
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
            padding-left: 200px;
        }
        
        #th1{
        	padding-left: 80px;
        }
        
        #th2{
        	padding-left: 50px;
        }
        #th3{
        	padding-left: 170px;
        }
        
        #th4{
        	padding-left: 70px;
        }
        #th33{
        padding-right: 30px;
        }
        
        #th44{
        padding-right: 20px;
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
                    	<td>문의글이 없습니다.</td>
                    </tr>
                    <%} else { %>
                    <!-- 있을때 -->
                    	<% for(CustomerService cs : list) {%>
                      <tr>
                        <td><%=cs.getInqNo() %></td>
                        <td><%=cs.getCategory() %></td>
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