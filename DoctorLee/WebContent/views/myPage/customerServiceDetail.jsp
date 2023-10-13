<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 상세보기</title>
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

        th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
                text-align: center;
                }

               
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
                height: 50px;
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
                <p id="p11">마이페이지</p>
                <p id="p21">고객센터</p>
                <br>
                <hr>
                <table align="center">
	                    <tr>
	                        <th>제목</th>
	                    </tr>
	                    <tr>
	                        <th>작성일</th>
	                    </tr>
	                    <tr>
	                        <th>내용</th>
	                    </tr>
                 	  
                </table>
            </div>
        
        </div>
    </div>
</body>
</html>