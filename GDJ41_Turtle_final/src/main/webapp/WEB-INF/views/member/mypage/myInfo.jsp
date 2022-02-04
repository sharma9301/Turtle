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
    <li class="breadcrumb-item"><a href="${path}/member/mypage/myMain">마이페이지</a></li>
    <li class="breadcrumb-item active" aria-current="page">내정보</li>
  </ol>
</nav>



  <!-- 페이지내용 -->
  <div class="container">

    <div class="csTitle"><h1>내 정보</h1></div>

    <form name="csDelete" style="text-align: center;" action="${path }/member/mypage/myInfoUpdate" method="post">
      <div style="width: 400px; margin: 0 auto;" >
          <div class="csDelete">
          	<%-- ${loginMember} --%>
            <label>이름</label>
            <input name="userName" type="text" value="${loginMember.userName}" readonly><br>
            <label>아이디</label>
            <input name="userId" type="text" value="${loginMember.userId}" readonly><br>
            <label>비밀번호</label>
            <input name="password" type="password" readonly><br>
            <label>연락처</label>
            <input name="phone" type="text" value="${loginMember.phone}" readonly><br>
            
          </div>
          <div class="d-flex" style="width: 300px;">
          	<c:set var="addressArr" value="${fn:split(loginMember.address,'|')}"/>
            <input type="text" id="sample6_postcode" value="${addressArr[0]}" style="margin-right: 10px;" readonly>
          </div>
          <div style="width: 400px">
            <input type="text" id="sample6_address" value="${addressArr[1]}" readonly><br>
            <input type="text" id="sample6_detailAddress" value="${addressArr[2]}" readonly>
            <%-- <input type="text" id="sample6_extraAddress" value="${addressArr[2]}" readonly> --%>
          </div>
        </div>
        <button type="submit" class="btn btn-dark" >수정하기</button>
      </form>
    </div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
