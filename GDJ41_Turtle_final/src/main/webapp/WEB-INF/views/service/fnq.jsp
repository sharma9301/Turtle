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

    

    

    <!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

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

  </head>
  <body>
    
    <style>

      /* ----------------- 사이드바 부분 ------------------ */
      #csSide1{
       background-color: tan;
     }
      

     /* ----------------- 페이지 내용 부분 ------------------ */
     .accordion {
        background-color: #eee;
        color: #444;
        cursor: pointer;
        padding: 18px;
        width: 100%;
        text-align: left;
        border: none;
        outline: none;
        transition: 0.4s;
      }

      /* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
      .active, .accordion:hover {
        background-color: #ccc;
        
      }

      /* Style the accordion panel. Note: hidden by default */
      

      .panel {
        padding: 0 18px;
        background-color: white;
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.2s ease-out;
      }

    </style>

<!-- 헤더들어갈자리 -->





<main>
  <!-- 사이드바 -->
  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px; text-align: center;">
      <span class="fs-4">고객센터</span>
    <hr>
    <ul class="sidebarUl">
      <li class="sidebar" id="csSide1">
        <a href="${path }/service/fnq" class="nav-link link-dark" >
          F&Q
        </a>
      </li>
      <li class="sidebar" id="csSide2">
        <a href="${path }/service/email" class="nav-link link-dark" >
          문의사항
        </a>
      </li>
      <li class="sidebar" id="csSide3">
        <a href="${path }/service/delete" class="nav-link link-dark" >
          계정탈퇴
        </a>
      </li>
    </ul>
  </div>
  <div class="b-example-divider"></div>
  
  

  <!-- 페이지내용 -->

  <div class="container">




      <!-- 페이지본문 -->
      <div class="csTitle"><h1>F&Q</h1></div>

      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="fnqtab1" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true" style="color: black;">계정</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="fnqtab2" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false" style="color: black;">배송문의</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="fnqtab3" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false" style="color: black;">취소/교환/반품문의</button>
        </li>        
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
         
          <!-- 계정질문 -->
          <button class="accordion">계정질문 1</button>
          <div class="panel">
            <p>계정질문에 대한 답변</p>
          </div>

          <button class="accordion">계정질문 2</button>
          <div class="panel">
            <p>계정질문에 대한 답변</p>
          </div>

          <button class="accordion">계정질문 3</button>
          <div class="panel">
            <p>계정질문에 대한 답변</p>
          </div>

        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
          
          <!-- 배송문의 -->
          <button class="accordion">배송문의 1</button>
          <div class="panel">
            <p>배송문의에 대한 답변</p>
          </div>

          <button class="accordion">배송문의 2</button>
          <div class="panel">
            <p>배송문의에 대한 답변</p>
          </div>

          <button class="accordion">배송문의 3</button>
          <div class="panel">
            <p>배송문의에 대한 답변</p>
          </div>

          <button class="accordion">배송문의 4</button>
          <div class="panel">
            <p>배송문의에 대한 답변</p>
          </div>

          <button class="accordion">배송문의 5</button>
          <div class="panel">
            <p>배송문의에 대한 답변</p>
          </div>

          <button class="accordion">배송문의 6</button>
          <div class="panel">
            <p>배송문의에 대한 답변</p>
          </div>
          

        </div>
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
          
          <!-- 취소/교환/반품문의 -->
          <button class="accordion">취소/교환/반품문의 1</button>
          <div class="panel">
            <p>취소/교환/반품문의에 대한 답변</p>
          </div>

          <button class="accordion">취소/교환/반품문의 2</button>
          <div class="panel">
            <p>취소/교환/반품문의에 대한 답변</p>
          </div>

          <button class="accordion">취소/교환/반품문의 3</button>
          <div class="panel">
            <p>취소/교환/반품문의에 대한 답변</p>
          </div>

          <button class="accordion">취소/교환/반품문의 4</button>
          <div class="panel">
            <p>취소/교환/반품문의에 대한 답변</p>
          </div>
          

        </div>
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
