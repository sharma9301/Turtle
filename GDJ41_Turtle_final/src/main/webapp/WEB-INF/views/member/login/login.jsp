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

	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

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
    <link href="signup.css" rel="stylesheet">
  </head>
  <body>
    
    <style>

     
     /* ----------------- 페이지 내용 부분 ------------------ */
     



#login{
    width: 300px;
    margin:0 auto;
    padding: 0;
}
 .log{
 	width:300px;
     margin: 0;
 }

#saveId{
    text-align: left;
    margin: 10px 0 10px 0;
}

#forLogin{
	width:300px;
	margin:10 auto;
	
}

     

    </style>


<!-- 헤더들어갈자리(?) -->






  <!-- 페이지내용 -->
<section >
  
<div class="header-line"></div>
  <div class="container" style="margin-top:150px;">
      <div class="csTitle"><h1>Please sign in</h1></div>

          	<form id="login" action="${path }/member/login/login.do">
		        <input class="log" name="userId" type="text" placeholder="아이디">
		        <input class="log" name="password" type="password" placeholder="비밀번호"><br>   
		        <input type="checkbox" id="saveId" name="check" value="">
		        <label for="saveId">아이디 저장</label><br>
			    <button type="submit" class="btn btn-primary" name="loginbtn" style="width:300px;">로그인</button>
		    </form>
		    <div id="forLogin">
				<a href="${path }/member/login/finding"><span>아이디/비밀번호찾기</span></a>
				<a href="${path }/member/login/enrollment"><span style="margin-left:100px;">회원가입</span></a>
		    </div>
      </div>
      
      
       <ul>
		<li onclick="kakaoLogin();" style="list-style:none;">
	      <a href="javascript:void(0)">
	          <img src="${path }/resources/images/login/kakao_login_medium_wide.png" alt="카카오로그인버튼"> 
	      </a>
		</li>
	</ul> 
	      
      <script>
		Kakao.init('40107ef843d459334464468561c5d265'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		let userId = "";
		let userName = "";
		function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		    	  console.log(response);
		    	  Kakao.Auth.setAccessToken(response.access_token);
		    	  console.log(Kakao.Auth.getAccessToken())
		        Kakao.API.request({
		          url: '${path}/v2/user/me',
		          
		          success: function (response) {
		        	  console.log(response)
		        	  console.log("email : "+response.kakao_account.email)
		        	  console.log("userName : "+response.properties.nickname)
		        	  userId = response.kakao_account.email;
		        	  userName = response.properties.nickname;
		        	  updateData = userId+"/"+userName
		        	  
		        	  location.assign("${path}/member/login/kakaologin.do?updateData="+updateData);
		        	  
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    });
		  }
		//카카오로그아웃  
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '${path}/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  
		</script>
      
      
      
      
      
      
</section>  
          
<script>
        $(document).ready(function(){
    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    $("input[name='userId']").val(userInputId); 
     
    if($("input[name='userId']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#saveId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#saveId").change(function(){ // 체크박스에 변화가 발생시
        if($("#saveId").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='userId']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='userId']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#saveId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='userId']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
     </script>


         





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>