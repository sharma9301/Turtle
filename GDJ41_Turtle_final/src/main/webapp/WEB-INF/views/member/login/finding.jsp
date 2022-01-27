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
    <link href="signup.css" rel="stylesheet">
  </head>
  <body>
    
    <style>

     /* ----------------- 페이지 내용 부분 ------------------ */
    
     input{
       margin: 10px 0 10px 0;
       width: 100%;
     }

     .finding{
      margin: 0 auto;
      width: 200px;
     }

     label{
       display: block;
       text-align: left;
     }
    </style>


  <!-- 페이지내용 -->
  
  <div class="container">
    <div class="row">
      <div class="col">
        <div class="csTitle"><h1>아이디 찾기</h1></div>
        <form name="finding" style="text-align: center;">
          <div class="finding">
              <label for="fname">이름</label>
              <input name="userName" type="text" placeholder="이름"><br>
              <label for="fname">이메일</label>
              <input name="email" type="text" placeholder="abc@turtle.com"><br>
              <p>가입시 작성한 이메일입력</p>
              <button type="submit" class="btn btn-dark">확인</button>
          </div>
        </form>
      </div>
      <div class="col">
        <div class="csTitle"><h1>비밀번호 찾기</h1></div>
        <form name="finding" style="text-align: center;">
          <div class="finding">
              <label for="fname">아이디</label>
              <input name="userId" type="text" placeholder="아이디"><br>
              <label for="fname">이메일</label>
              <input name="email" type="text" placeholder="abc@turtle.com"><br>
              <p>가입시 작성한 이메일입력</p>
              <button type="submit" class="btn btn-dark">확인</button>
            </div>
          </form>
      </div>
    </div>
  </div>




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
