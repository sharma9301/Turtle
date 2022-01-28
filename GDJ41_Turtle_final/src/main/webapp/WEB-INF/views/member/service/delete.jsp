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
    <link href="sidebars.css" rel="stylesheet">
  </head>
  <body>
    
    <style>

      /* ----------------- 사이드바 부분 ------------------ */
      #csSide3{
       background-color: tan;
     }
      

     /* ----------------- 페이지 내용 부분 ------------------ */
    


     input{
       margin: 10px 0 10px 0;
       width: 100%;
     }

     .csDelete{
       padding: 10px;
       text-align: center;
       width: 200px;
       margin: 0 auto;
     }

     label{
       display: block;
       text-align: left;
       
     }
    </style>


<!-- 헤더들어갈자리(?) -->



<main>
  <!-- 사이드바 -->
  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px; text-align: center;">
      <span class="fs-4">고객센터</span>
    <hr>
    <ul class="sidebarUl">
      <li class="sidebar" id="csSide1">
        <a href="${path }/member/service/faq" class="nav-link link-dark" >
          FAQ
        </a>
      </li>
      <li class="sidebar" id="csSide2">
        <a href="${path }/member/service/email" class="nav-link link-dark" >
          문의사항
        </a>
      </li>
      <li class="sidebar" id="csSide3">
        <a href="${path }/member/service/delete" class="nav-link link-dark" >
          계정탈퇴
        </a>
      </li>
    </ul>
  </div>
  <div class="b-example-divider"></div>
  <!-- 사이드바 -->


  <!-- 페이지내용 -->
  <div class="container">

      <div class="csTitle"><h1>계정탈퇴</h1></div>

      <div class="csDelete">
          <form name="csDelete">
            <label>아이디</label>
            <input name="userId" type="text" value="userId" readonly><br>
            <label>비밀번호</label>
            <input name="password" type="password" placeholder="비밀번호"><br>
            <button type="button" class="btn btn-dark">확인</button>
          </form>
      </div>
      
  </div>

  
  <div class="b-example-divider"></div>

</main>

    <script>
    
    var acc = document.getElementsByClassName("accordion");
    var i;
    
    for (i = 0; i < acc.length; i++) {
      acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.maxHeight) {
          panel.style.maxHeight = null;
        } else {
          panel.style.maxHeight = panel.scrollHeight + "px";
        }
      });
    }
    
    </script>








<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
