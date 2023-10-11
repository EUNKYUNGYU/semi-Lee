<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴폼</title>
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

        h1{
            text-align: center;
        }

        
        #p2{
            text-align: center;
            font-size: 23px;
            color: #1E376F;
            font-weight: 600;
        }
        
        #p3{
            text-align: center;
            font-size: 18px;
        }

        h2{
            padding-left: 50px;
            padding-top: 90px;
            
        }
        
        .check1{    
            margin-top: 30px;
        }

        #check1{
            margin-left: 350px;
        }
        
        #check2{
           margin-left: 30px;
        }
        #check3{
            margin-left: 350px;
        }

        #check4{
            margin-left: 30px;
        }

        /*-------------텍스트 창--------------*/
        #textcontent{
            padding: 30px;
            font-size: 15px;
            width: 780px;
            height: 200px;
            margin-left: 350px;
            margin-top: -70px;
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
                <h1>회원탈퇴</h1>
                <hr>
                <p id="p2">낭만닥터 이사부 회원탈퇴 신청</p>
                <p id="p3">
                * 홈페이지 회원탈퇴에 대한 사유를 선택해주시기 바랍니다. <br> 
                * 기타 의견이 있으실 경우에는 작성해 주시기 바랍니다.
                </p>
                <br>
                <hr>
            
                <input type="checkbox" class="check1" id="check1"><label>거주이전에 따라서 더 이상 병원 방문을 하기 어렵기 때문</label>
                <input type="checkbox" class="check1" id="check2"><label>홈페이지 서비스를 이용할 필요성을 느끼지 못해서</label> 
                <br><br>
                <input type="checkbox" class="check1" id="check3"><label>타병원을 이용하기 때문에</label>
                <input type="checkbox" class="check1" id="check4"><label>기타의견</label>
                
                <h2>회원탈퇴 사유</h2>
                <textarea id="textcontent" placeholder="회원탈퇴 사유를 작성해주시면 더욱 발전된 낭만닥터 이사부가 되겠습니다." cols="30" rows="10" style="resize: none;"></textarea>
                
                
                <br><br><br><br>
                <hr>
                
                <button type="submit" id="pwd_1" onclick=" return deleteMember();">신청</button>
                
            </div>
            <script>
            	function deleteMember(){
            		
            		const deleteStr = prompt("입력하세요");
            		
            		if(deleteStr == '어쩌고'){
            			return true;
            		} else {
            			return false;
            		}
            	}
            </script>
        
        </div>
    </div>

    <br><br><br><br><br><br><br><br>
</body>
</html>