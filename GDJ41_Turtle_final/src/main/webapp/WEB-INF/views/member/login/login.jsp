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
			    <button type="submit" class="btn btn-primary" style="width:300px;">로그인</button>
		    </form>
		    <div id="forLogin">
				<a href="${path }/member/login/finding"><span>아이디/비밀번호찾기</span></a>
				<a href="${path }/member/login/enrollment"><span style="margin-left:100px;">회원가입</span></a>
		    </div>
      </div>
      
</section>  
          
            

         





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>