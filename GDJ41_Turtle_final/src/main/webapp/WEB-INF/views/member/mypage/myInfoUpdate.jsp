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
    </style>

    
    <!-- Custom styles for this template -->
    <link href="mypage.css" rel="stylesheet">
  </head>
  <body>
    
    <style>

     
     /* ----------------- 페이지 내용 부분 ------------------ */
     



     input{
       margin: 10px 0 10px 0;
       width: 100%;
     }

     .csDelete{
       padding: 0px;
       width: 200px;
       
     }

     label{
       display: block;
       text-align: left;
       
     }

     nav {
       margin: 20px;
     }

     

    </style>


<!-- 헤더들어갈자리(?) -->

<!-- 경로 -->
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="${path }/member/mypage/myMain">마이페이지</a></li>
    <li class="breadcrumb-item"><a href="${path }/member/mypage/myInfo">내정보</a></li>
    <li class="breadcrumb-item active" aria-current="page">내정보수정하기</li>
  </ol>
</nav>




  <!-- 페이지내용 -->
  <div class="container">

      <div class="csTitle"><h1>내 정보 수정</h1></div>

      <form name="csDelete" style="text-align: center;" action="${path }/member/mypage/myInfoUpdateEnd" method="get">
        <div style="width: 400px; margin: 0 auto;" >
            <div class="csDelete">
              <label>이름</label>
              <input name="userName" type="text" value="${loginMember.userName}" required><br>
              <label>아이디</label>
              <input name="userId" type="text" value="${loginMember.userId}" required><br>
              <label>현재 비밀번호</label>
              <input name="oriPassword" id="oriPassword" type="password" placeholder="현재 비밀번호" required>
              <input name="oriPassword2" id="oriPassword2" type="password" value="${loginMember.password}" style="display:none"><br>
              <label>새로운 비밀번호</label>
              <input name="newPassword" type="password" placeholder="새로운 비밀번호"><br>
              <label>비밀번호 확인</label>
              <input name="passwordCh" type="password" placeholder="새로운 비밀번호 확인"><br>
              <label>연락처</label>
              <input name="phone" type="text" value="${loginMember.phone}" required><br>
            </div>
            <div class="d-flex" style="width: 300px;">
            <c:set var="addressArr" value="${fn:split(loginMember.address,'|')}"/>
            
              <input type="text" id="sample6_postcode" value="${addressArr[0]}" style="margin-right: 10px;" required>
              <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
            </div>
            <div style="width: 400px">
              <input type="text" id="sample6_address" value="${addressArr[1]}" required><br>
              <input type="text" id="sample6_detailAddress" value="${addressArr[2]}">
              <input type="text" id="sample6_extraAddress" value="유저참고항목" style="display:none">
            </div>
          </div>
          <button id="updateBtn" type="submit" class="btn btn-dark" >확인</button>
        </form>
      </div>
      
         

    <script>
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
   
   $("#updateBtn").click(e=>{
	   let oriPassword = $("#oriPassword").val();
	   let oriPassword2 = $("#oriPassword2").val();
	   let newPassword = $("#newPassword").val();
	   let passwordCh = $("#passwordCh").val();
	   /* console.log(oriPassword);
	   console.log(oriPassword2); */
	   if(oriPassword != oriPassword2){
		   alert("비밀번호가 일치하지 않습니다.");
		   $("#oriPassword").focus();
		   return false;
	   }else{
		   if(newPassword == null) {
			   alert("회원정보가 수정되었습니다."); 
		   }else{
			   if(newPassword != passwordCh){
				   alert("비밀번호 확인이 일치하지 않습니다.");
				   $("#newPassword").focus();
				   return false;
			   }
		   }
		    
	   }
	   
   });
   
   
   
   
   
   
   
   
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
