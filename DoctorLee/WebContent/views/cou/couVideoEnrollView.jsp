<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리 영상 등록 페이지</title>
<style>
    /*영상 등록 폼*/
    .video-list{
        border: 1px solid red;
    }
    .enrollVideo{
            background-color: #1E376F;
            border-radius: 10px;
            width: 1260PX;
        }

        .enrollVideo th, .enrollVideo h3{
            color: white;
        }

        input[type=text]{
            width: 500px;
            height: 40px;
            margin-bottom: 30px;
        }

        #submitBtn{
            width: 100px;
            height: 30px;
            border-radius: 10px;
        }
</style>
</head>
<body>
    <div class="outer">
        <%@ include file="../common/nav.jsp"%>
    
        <div class="content">
            <div class="left-menu">
                <!--상단 네비게이션 메뉴 div-->
                <%@ include file="../common/couNavi.jsp"%>
            </div>
        
        
            <!--심리 영상 내용 출력 영역 div-->
            <div id="video-list">
                <div class="enrollVideo" align="center">
                    <form action="enrollVideo.co">
                        <table align="center">
                            <br>
                            <h3>영상 게시하기</h3>
                            <br>
                                <tr>
                                    <th width="150">제목</th>
                                    <td colspan="3"><input type="text" name="title" id="title" required></td>
                                </tr>
        
                                <tr>
                                    <th>채널명</th>
                                    <td colspan="3"><input type="text" name="channel" id="channel" required></td>
                                </tr>
        
                                <tr>
                                    <th>영상 주소</th>
                                    <td colspan="3"><input type="text" name="address" id="address" required></td>
                                </tr>
                        </table>
                        
                        <div>
                            <button type="submit" id="submitBtn">등록하기</button>
                        </div>
                        <br>
                    </form>
                    
                </div>
    
            </div>
        </div>
    
        </div>

</body>
</html>