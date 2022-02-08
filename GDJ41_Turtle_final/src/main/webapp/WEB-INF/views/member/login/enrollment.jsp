<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path }/resources/css/service.css" rel="stylesheet" type="text/css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


 <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sidebars/">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>

    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      

     

     label{
       display: block;
       text-align: left;
       
     }
     .memberInfo input{
     	display: inline;
     	width: 200px;
     	
     	
     }
     .memberInfo {
     	margin-bottom:10px;
     }
     
     
     
    </style>

    
  </head>
  <body>
    
    
  <!-- 페이지내용 -->
  <div class="container">
	<div class="header-line"></div>
      <div class="csTitle mb-5">
      	<h1>회원가입</h1>
      </div>
<%-- action="${path }/enrollmentEnd"  --%>
      <form name="csDelete" method="post" enctype="multipart/form-data" action="${path }/enrollmentEnd">
        <div style="width: 400px; margin: 0 auto; text-align: left;">
			<div class="memberInfo">
				<label class="mt-2 mb-1">이름</label>
				<input name="userName" class="form-control" id="userName" type="text" placeholder="이름" required>
				<label class="mt-2 mb-1">아이디</label>
				<div class="memberInfo d-flex">
					<input name="userId" class="form-control" id="userId" type="text" placeholder="아이디" required>
					<button type="button" class="btn btn-secondary ms-3" id="userIdChk">중복확인</button>
				</div>
				<label class="mt-2 mb-1">비밀번호</label>
				<input name="password" class="form-control" id="password" type="password" placeholder="비밀번호" required>
			 
				<label class="mt-2 mb-1">비밀번호 확인</label>
				<input name="passwordCh" class="form-control" id="passwordCh" type="password" placeholder="비밀번호 확인" required>
			
				<label class="mt-2 mb-1">연락처</label>
				<input name="phone" class="form-control" id="phone" type="text" placeholder="- 제외 입력" required>
				
				<label class="mt-2 mb-1">주소</label>
				<div class="memberInfo d-flex">
					<input type="text" class="form-control" name="addr0" id="sample6_postcode" placeholder="우편번호" required>
					<button type="button" class="btn btn-secondary ms-3" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
				</div>
				
				<div class="memberInfo">
					<input type="text" class="form-control" name="addr1" id="sample6_address" placeholder="주소" required style="margin-bottom:10px; width:80%">
					<input type="text" class="form-control" name="addr2" id="sample6_detailAddress" placeholder="상세주소" style="margin-bottom:10px; width:80%">
					<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목" style="display:none">
				</div>
				
				<label class="mt-2 mb-1">이메일</label>
				<div class="memberInfo d-flex">
					<input type="text" class="form-control" name="email" id="email" placeholder="turtle@gmail.com" required>
					<button type="button" class="btn btn-secondary ms-3" id="emailBt">인증하기</button>
				</div>
				
				<div class="memberInfo d-flex">
					<input type="text" class="form-control" name="token" id="token" placeholder="인증코드를 입력해주세요." required>
					<button type="button" class="btn btn-secondary ms-3" id="tokenBt">확인</button>
				</div>
				
				<input type="hidden" class="form-control" id="tokenYN" value="false">
				<input type="hidden" class="form-control" id="userIdChkYN" value="false">
				
			</div>
			
          </div>
          <div  style="margin: 50px auto 50px auto; text-align:center;">
          	<button type="submit" id="signUpBt" class="btn btn-dark" >가입하기</button>
          </div>
        </form>
      </div>
        
    <script>
    	$("#emailBt").click(e=>{
    		let email = $("#email").val();
    		let data = {email : email};
    		
    		console.log(email);
    		console.log(data);
    		$.ajax({
    			type : "post",
    			url: "/sendEmail.do",
    			data : data,
    			success : function(result) {
    				console.log("메일 전송 완료");
    				alert("인증번호를 해당 이메일로 발송했습니다. 확인해주세요!");
    			}
    		});
    	});
    
    	
    	$("#signUpBt").click(e=>{
    		
    		let tokenYN = $("#tokenYN").val();
    		let userIdChk = $("#userIdChkYN").val();
    		console.log(tokenYN);
    		
    		if(tokenYN != "true"){
    			alert("이메일 인증을 해주세요");
    			return false;
    		}
    		
    		if(userIdChk != "true"){
    			alert("아이디 중복 확인을 해주세요");
    			return false;
    		}
    	});
    

	   function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                    document.getElementById("sample6_address").value = addr+extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                    document.getElementById("sample6_address").value = addr;
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                /* document.getElementById("sample6_address").value = addr; */
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	   
	   
		$("#signUpBt").click(e=>{
			let password = $("#password").val();
			let passwordCh = $("#passwordCh").val();
			let userName = $("#userName").val();
			let userId = $("#userId").val();
			let phone = $("#phone").val();
			
			console.log("password : "+password);
			console.log("pk : "+passwordCh);
			
			if(password != passwordCh){
				alert("비밀번호가 일치하지 않습니다.");
				$("#password").focus();
				return false;
			}
			
			var regPhone = /^01([0|1|6|7|8|9])?([0-9]{7,8})$/;
			
			if (regPhone.test(phone) === false) {
				alert("잘못된 전화번호입니다.");
				$("#phone").focus();
				return false; 
			}
		 
		  
		}); 
	   
	   
		$("#tokenBt").click(e=>{
		
			let email = document.getElementById('email').value;
	   		let token = document.getElementById('token').value;
	   		
	   		console.log('이메일' + email);
	   		console.log('인증코드' + token);
	   		
	   		$.ajax({
	   			type:"POST",
	   			url: "/checkToken.do",
	   			data:{email:email,token:token},
	   			success : function(result){
	   				console.log(result);
	   				if(result==true){
	   					alert('인증완료');
	   					document.getElementById('tokenYN').value = "true";
	   					email.onchange = function(){
	   						document.getElementById('tokenYN').value = "false";
	   					}
	   				}else{
	   					alert('인증번호가 일치하지 않습니다.');
	   					$("#token").val("");
	   					$("#token").focus;
	   				}
	   			}
	   			
	   			
	   		});
	   
	   });
   
   
   
			
			
		$("#userIdChk").click(e=>{
			let userId = $("#userId").val();
			
			if(userId == ""){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			
			let data = {userId : userId};
			console.log(userId);
			console.log(data);
			
			$.ajax({
				type : "post",
				url : "/userIdChk.do",
				data : data,
				success : function(result) {
					
					if(result == 'fail'){
						alert("중복되는 아이디입니다.");
						$("#userId").focus();
						$("#userId").val("");
					}else{
						alert("사용할 수 있는 아이디입니다.");
						document.getElementById('userIdChkYN').value = "true";
						//$("#userIdChkYN").val("true");
	   					userId.onchange = function(){
	   						document.getElementById('userIdChkYN').value = "false";
	   					}
					}
				}
			});
		});

   
	</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
