<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.DoctorLee.mpBoard.model.vo.Category" %>
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자문의</title>
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

        #p11{
            font-size: 38px;
            font-weight: bolder;
            text-align: center;
        }

        #p21{
            margin-left: 200px;
            font-size: 23px;
            font-weight: 600;
            margin-top: 35px;
           
           
        }
        
         #inqTitle{
            padding: 20px;
            font-size: 15px;
            margin-left: 200px;
            width: 600px;
            height: 10px;
            overflow: hidden;
        }
        
        #inqContent{
            padding: 30px;
            font-size: 15px;
            width: 978px;
            height: 500px;
            margin-left: 200px;
            margin-top: 30px;
            
        }
       
        #count{
            margin-left:200px;
           
        }
       
        /*-----------버튼---------*/
        #pwd_1{
            background-color: white;
            color: #1E376F;
            border: 1px solid #1E376F;
            border-radius: 3px;
            width: 140px;
            height: 50px;
            font-size: 17px;
            margin-top: 50px;
            margin-left: 1100px;
        }

        #pwd_1:hover{
            background-color: #1E376F;
            color: white;
        }
        
        #optionbtn{
            float: right;
            margin-right: 400px;
            width: 150px;
            height: 30px;
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
            <form action="<%=contextPath%>/insert.cs" method="post">
            <input type="hidden" name="memNo" value=<%=loginUser.getMemNo() %>>
                <p id="p11">마이페이지</p>
                <hr>
                <p id="p21">관리자 문의하기</p>
                
                <br>
                <hr>
				<br>
				<select name="category" id="optionbtn">
				<% for(Category c : list) { %>
                    <option value="<%= c.getCategoryNo()%>">
                    	<%=c.getCategoryName() %>
                    </option>
				<%} %>
                </select>
                <textarea id="inqTitle" name="inqTitle" cols="40" rows="10" style="resize: none;" maxlength="50" placeholder="제목을 입력해주세요."></textarea>
                <textarea id="inqContent" name="inqContent" cols="40" rows="10" style="resize: none;" maxlength="1000" placeholder="내용을 입력해주세요."></textarea>
                <br>
                <span id="count">0</span>/ 1000자
                <button type="submit" id="pwd_1" onclick="insertAdminPage();">확인</button>
                
    		</form>
            </div>
        
        </div>
    </div>
    <script>
    	function insertAdminPage(){
    		location.href = "<%=contextPath%>/insert.cs";
    	}
    	
    	$(function(){
    		$('#inqContent').keyup(function(){
    			$('#count').text($(this).val().length);
    		})
    	})
    </script>
</body>
</html>