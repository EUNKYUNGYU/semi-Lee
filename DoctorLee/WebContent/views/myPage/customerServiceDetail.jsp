<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.DoctorLee.mpBoard.model.vo.CustomerService" %>
<%
	CustomerService cs = (CustomerService)request.getAttribute("cs");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 상세보기</title>
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

        th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
                text-align: center;
                }

              
        #csTitle{
            width: 800px;
            height: 30px;
            
        }

        #csContent{
            width: 800px;
            height: 500px;
            text-align: center;
        }

		.deletebtn{
		
		text-decoration: none;
        border: 1px solid #1E376F;
        color: #1E376F;
		float: right;
        margin-right: 30px;
        width: 100px;
        height: 40px;
        border-radius: 3px;
        text-align: center;
        padding-top: 7px;
		}

        .deletebtn:hover{
            background-color: #1E376F;
            color: white;
            text-decoration: none;
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
            padding-left: 200px;
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
                <span><a href="<%=contextPath%>/delete.cs?nno=<%=cs.getInqNo() %>" class="deletebtn" id="csdelete2">삭제하기</a></span>
                <span><a href="<%=contextPath %>/customerService.mp" class="deletebtn" id="csdelete">목록가기</a></span>
            </div>
        </div>
        </div>
    </div>
</body>
</html>