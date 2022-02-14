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
  
  
  

  <!-- 페이지내용 -->

  <div class="container">




      <!-- 페이지본문 -->
      <div class="csTitle"><h1>FAQ</h1></div>

      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="fnqtab1" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true" style="color: black;">계정</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="fnqtab2" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false" style="color: black;">주문/배송문의</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="fnqtab3" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false" style="color: black;">취소/교환/반품문의</button>
        </li>        
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
         
          <!-- 계정질문 -->
          <button class="accordion">1. 회원가입시 이메일이 꼭 필요한가요?</button>
          <div class="panel">
            <p>
	            - 네, 회원가입시 작성한 이메일을 통해 아이디 및 비밀번호 찾기가 가능하기 때문에 이메일 입력은 필수입니다.<br>
				 또한 해당 이메일을 잊어버리거나 삭제할 경우, 아이디/비밀번호 찾기에 제한이 생길 수 있습니다.
			</p>
          </div>

          <button class="accordion">2. 아이디/비밀번호를 잊어버렸어요.</button>
          <div class="panel">
            <p>
            	- 아이디 혹은 비밀번호를 잊어버리신 경우, <a href="${path }/member/login/finding">아이디/비밀번호찾기</a>를 통해 찾으실 수 있습니다.
            </p>
          </div>

          <button class="accordion">3. 회원탈퇴를 하고 싶어요.</button>
          <div class="panel">
            <p>
            	- 회원탈퇴를 원하시는 경우, <a href="${path }/member/service/delete">고객센터>계정탈퇴</a>에서 가능합니다.
            </p>
          </div>

        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
          
          <!-- 배송문의 -->
          <button class="accordion">1. 주문내역을 확인하고 싶어요.</button>
          <div class="panel">
            <p>
            	- 주문내역은 마이페이지><a href="${path }/member/mypage/delivery?userId=${loginMember.userId}">주문내역</a>에서 확인 가능합니다.<br>
            	주문별 상세내역은 마이페이지>주문내역><a href="${path }/member/mypage/deliveryDetail?userId=${loginMember.userId}">주문상세내역</a>에서 확인가능합니다.
            </p>
          </div>

          <button class="accordion">2. 배송현황이 궁금해요.</button>
          <div class="panel">
            <p>
            	- 전체 배송현황은 <a href="${path }/member/mypage/myMain?userId=${loginMember.userId}">마이페이지</a>에서 확인가능하며, 주문별 배송현황은 <a href="${path }/member/mypage/delivery">주문내역</a>에 배송조회를 통해 확인가능합니다.
            </p>
          </div>

          <button class="accordion">3. 상품을 대량 주문하고 싶어요.</button>
          <div class="panel">
            <p>
				- 저희 사이트는 모든 고객님들의 원활한 주문을 위해 주문1건당 최대 5개로 제한을 두고 있습니다.<br>
				대량 구매를 원하시는 고객님께서는 <a href="${path }/member/service/email">문의사항</a>을 통해 저희에게 연락주시면 최대한 빨리 답변드리겠습니다.
			</p>
          </div>

          <button class="accordion" style="display:none">배송문의 4</button>
          <div class="panel">
            <p>배송문의에 대한 답변</p>
          </div>

          <button class="accordion" style="display:none">배송문의 5</button>
          <div class="panel">
            <p>배송문의에 대한 답변</p>
          </div>

          <button class="accordion" style="display:none">배송문의 6</button>
          <div class="panel">
            <p>배송문의에 대한 답변</p>
          </div>
          

        </div>
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
          
          <!-- 취소/교환/반품문의 -->
          <button class="accordion">1. 주문을 취소하고 싶어요.</button>
          <div class="panel">
            <p>
	            - 주문취소는 배송상태가 '배송대기'상태인 경우, <a href="${path }/member/mypage/deliveryDetail?userId=${loginMember.userId}">주문내역 상세보기</a>에서 가능합니다.<br>
				그 외의 경우에는 제품을 받으신 후 반품요청을 통해서만 가능합니다. 
			</p>
          </div>

          <button class="accordion">2. 반품요청을 하고싶어요.</button>
          <div class="panel">
            <p>
				- 반품요청은 배송상태가 '배송대기'가 아닐 경우, 마이페이지>주문내역><a href="${path }/member/mypage/deliveryDetail?userId=${loginMember.userId}">주문내역상세보기</a>에서 가능합니다.<br>
				 택배사를 통해 상품반송을 해주시면, 택배비를 차감한 금액이 환불됩니다.(택배비를 선불로 지불한 경우, 택배비 차감 없음)<br>
				반송된 제품 검수 후 환불이 진행된다는 점 양해부탁드립니다.            
			</p>
          </div>

          <button class="accordion">3. 제품을 교환하고 싶어요.</button>
          <div class="panel">
            <p>
				- 상품하자 외에 제품을 다른 제품으로 교환이 불가능합니다. 주문취소/반품요청을 한 뒤, 다시 주문해주시면 감사하겠습니다.<br>
				받으신 상품에 하자가 있는 경우, <a href="${path }/member/service/email">문의하기</a>로 저희에게 연락주시면 최대한 빠르게 처리해드리겠습니다.
			</p>
          </div>

          <button class="accordion" style="display:none">취소/교환/반품문의 4</button>
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
