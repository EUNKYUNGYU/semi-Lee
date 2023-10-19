<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>


	
	
 <style>
        div{
            
            box-sizing: border-box;
        }

        #wrap{
            width: 100%;
            height: 1800px;
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

        /*-----------------------------------------------*/
        h1{
            text-align: center;
        }

        #p11{
            text-align: left;
            font-size: 15px;
            color: #1E376F;
            font-weight: 600;
            padding-top: 30px;
            padding-left: 380px;
        }

        /*-----------------------------------------------*/
        #checked_id{
            margin-left: 550px;
            margin-top: -50px;
        }
       
        /*-----------버튼---------*/
        .register{
            background-color: #1E376F;
            color: white;
            border: 1px solid #1E376F;
            border-radius: 3px;
            width: 140px;
            height: 50px;
            font-size: 17px;
            margin-top: 120px;
        }
        
        #cancel{
            background-color: white;
            color: #1E376F;
            border: 1px solid #1E376F;
            border-radius: 3px;
            width: 140px;
            height: 50px;
            font-size: 17px;
            margin-right: 40px;
            
        }

        #cancel:hover{
            background-color: #1E376F;
            color: white;
        }

        .register{
            margin-left: 100px;
        }
        
        #updatePwdButton, #deleteMemberButton{
        	background-color: white;
        	color: #1E376F
        }
       
       #updatePwdButton:hover{
       		background-color: #1E376F;
            color: white;
       }
       
       #deleteMemberButton:hover{
       		background-color: #1E376F;
            color: white;
       }
        
        #height, #weight{
        	text-align: right;
        }
        
        .spanfont{
        	font-size: 14px;
        }
        
        #memName{
        	margin-left: 50px;
        }
        #memNickName{
        	margin-left: 35px;
        }
        #email{
        	margin-left: 35px;
        }
        #phone{
        	margin-left: 19px;
        }
        #height{
        	margin-left: 65px;
        }
        #weight{
        	margin-left: 35px;
        }
        
        .allBtn{
        	margin-left : 30px;
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
            
            <%
				//System.out.println(loginUser);
				String memName = loginUser.getMemName();
				String nickName = loginUser.getNickName();
				String phone = loginUser.getPhone();
				String email = loginUser.getEmail();
				int height = loginUser.getHeight();
				int weight = loginUser.getWeight();
				String diseases = loginUser.getDiseases();
				String inhaleAll = loginUser.getInhaleAll();
				String foodAll = loginUser.getFoodAll();
			%>
            
            <div id="content_2">
                <h1>마이페이지</h1>
                <hr>
                <p id="p11">
                    * 최선의 서비스 제공을 위해서 회원정보를 최신정보로 변경하여 주시기 바랍니다. <br>
                    * 아래 회원정보는 홈페이지 회원가입자에 대한 개인정보이며 정보보호를 위해 암호화하여 관리합니다. <br>
                    * 온라인 회원가입정보와 병원내 진료시스템 개인정보는 별도로 관리되므로 온라인 회원정보가 변경될 경우 <br>
                    * 콜센터(☎1577-0000)에 연락하시어 진료시스템상 개인정보도 변경해 주십시오.       
                </p>
                
                <hr>

                <form name="login" action="<%=contextPath %>/update.me" method="post" class="formfont">
                    <input type="hidden" name="memId" value="<%= loginUser.getMemId() %>" class="box"> <br>
                    <h2>회원정보수정</h2>
                    <hr>
                    
                    
                    이름
                    
                    <input type="text" id="memName" name="memName" value="<%= memName %>" class="box"> <br>
                    <hr>
                    
                  닉네임
                    <input type="text" id="memNickName" name="nickName" value="<%= nickName %>" class="box"> <br>
                    <hr>
                    
                    이메일
                    <input type="email" id="email" name="email" value="<%= email %>"placeholder="email@gmail.com" class="box">
                    <hr>
                    휴대전화
                    <input type="text" id="phone" name="phone" value="<%= phone %>" placeholder="-를 제외하고 입력하시오." class="box">
                    <hr>                       
                    <h2>건강관리입력사항 </h2>
                    <hr>
                    키
                    <input type="text" id="height" value="<%= height %>" class="box" id="height" name="height" required>
                    <hr>
                    몸무게
                    <input type="text" id="weight" value="<%= weight %>" class="box" id="weight" name="weight" required>
                    <hr>
                    질병
                    <span class="spanfont">(중복 선택 가능)</span>
                    <input type="checkbox" value="암" name="diseases" class="allBtn">암
                    <input type="checkbox" value="간질환" name="diseases" class="allBtn">간질환
                    <input type="checkbox" value="심장질환" name="diseases" class="allBtn">심장질환
                    <input type="checkbox" value="뇌혈관질환" name="diseases" class="allBtn">뇌혈관질환
                    <input type="checkbox" value="당뇨병" name="diseases" class="allBtn">당뇨병
                    <input type="checkbox" value="고혈압" name="diseases" class="allBtn">고혈압
                    <input type="checkbox" value="호흡기질환" name="diseases" class="allBtn">호흡기질환
                    <input type="checkbox" value="기타" name="diseases" class="allBtn">기타
                    <hr>
                    흡입 알레르기
                    <span class="spanfont">(중복 선택 가능)</span>
                    <input type="checkbox" value="곤충류" name="inhaleAll" class="allBtn">곤충류
                    <input type="checkbox" value="진드기류" name="inhaleAll" class="allBtn">진드기류
                    <input type="checkbox" value="목초화분" name="inhaleAll" class="allBtn">목초화분
                    <input type="checkbox" value="비듬&상피세포" name="inhaleAll" class="allBtn">비듬&상피세포
                    <input type="checkbox" value="잡초화분" name="inhaleAll" class="allBtn">잡초화분
                    <input type="checkbox" value="수목화분" name="inhaleAll" class="allBtn">수목화분
                    <input type="checkbox" value="곰팡이류" name="inhaleAll" class="allBtn">곰팡이류
                    <input type="checkbox" value="기타" name="inhaleAll" class="allBtn">기타
                    <hr>
                    음식물 알레르기
                    <span class="spanfont">(중복 선택 가능)</span>
                    <input type="checkbox" value="곡류" name="foodAll" class="allBtn">곡류
                    <input type="checkbox" value="해산물" name="foodAll" class="allBtn">해산물
                    <input type="checkbox" value="채소류" name="foodAll" class="allBtn">채소류
                    <input type="checkbox" value="동물성식품" name="foodAll" class="allBtn">동물성식품
                    <input type="checkbox" value="과일류" name="foodAll" class="allBtn">과일류
                    <input type="checkbox" value="견과류" name="foodAll" class="allBtn">견과류
                    <input type="checkbox" value="기타" name="foodAll" class="allBtn">기타
                    <hr>
                    
                    <span id="button">
                        <button type="button" class="register" id="updatePwdButton" data-toggle="modal" data-target="#updatePwdForm">비밀번호 변경</button>
                        <button type="button" class="register" id="deleteMemberButton" data-toggle="modal" data-target="#deleteMemberForm">회원탈퇴</button>
                        <button type="submit" class="register" id="submitBtn">확인</button>
                    </span>

                </form>
               
            </div>
        </div>
    </div>
    <script>
    	let diseases = '<%= diseases%>';
    	let inhaleAll = '<%= inhaleAll%>';
    	let foodAll = '<%= foodAll%>';
    	
    	$('input[type=checkbox]').each(function(){
    		if (diseases.search($(this).val()) != -1){
    			$(this).attr('checked', true);
    		}
    	
    		if (inhaleAll.search($(this).val()) != -1){
    			$(this).attr('checked', true);
    		}
    		
    		if (foodAll.search($(this).val()) != -1){
    			$(this).attr('checked', true);
    		}
    	});
    </script>
	<!--비밀번호 변경 모달-->
	<div class="modal" id="updatePwdForm">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    
                    <div class="modal-header">
                    <h4 class="modal-title">비밀번호 변경</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    
                    <div class="modal-body">
                        <form method="post" action="<%= contextPath %>/updatePwd.me">

                            <!--현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 재입력-->
                            <div class="form-group">
                                    <label for="memPwd">현재 비밀번호:</label>
                                    <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." id="memPwd" name="memPwd" required>
                              </div>

                              <div class="form-group">
                                    <label for="updatePwd">변경할 비밀번호:</label>
                                    <input type="password" class="form-control" placeholder="변경할 비밀번호를 입력해주세요." id="updatePwd" name="updatePwd" required>
                              </div>

                              <div class="form-group">
                                    <label for="checkPwd">변경할 비밀번호 확인:</label>
                                    <input type="password" class="form-control" placeholder="변경할 비밀번호를 다시 입력해주세요." id="checkPwd" required>
                              </div>
                              <button type="submit" onclick="return validatePwd();" class="btn btn-sm btn-secondary">비밀번호 변경</button>
							  <input type="hidden" name="memNo" value="<%=loginUser.getMemNo() %>">
	
								<script>
									
									function validatePwd(){
										
										if($('#updatePwd').val() != $('#checkPwd').val()){
											alert('비밀번호를 다시 입력해주세요.');
											$('#checkPwd').focus();
											return false;
										}
										
										return true;
									}
									
								</script>
							</form>
						</div>
					</div>
				</div>	
			</div>	
		<!-- 회원탈퇴 -->
		<div class="modal" id="deleteMemberForm">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- 모달 헤더 -->
                    <div class="modal-header">
                    <h4 class="modal-title">비밀번호 확인</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- 모달 바디 -->
                    <div class="modal-body">
                        <form method="post" action="<%= contextPath %>/delete.me">
                            <div class="form-group">
                                    <label for="memPwd">비밀번호:</label>
                                    <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." id="memPwd" name="memPwd" required>
                              </div>

                              <button type="submit" onclick="return deleteMember();" class="btn btn-sm btn-secondary">회원탈퇴</button>
						 </form>
					</div>
				</div>
			</div>
		</div>
			
			<%@ include file="../common/footer.jsp" %>
		
								<script>
									function deleteMember(){
										
										const deleteStr = propmt('다시');
										
										if(deleteStr = 'ddd'){
											return true;
										} else{
											return false;
										}
										
									}
								</script>
</body>
</html>