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
    <link href="mypage.css" rel="stylesheet">
  </head>
    <style>

      

     /* ----------------- 페이지 내용 부분 ------------------ */
     .col {
       text-align: center;
       margin: auto;
     }


     nav {
       margin: 20px;
     }







    </style>
  <body>
    

<!-- 헤더들어갈자리 -->






<!-- 경로 -->
<nav aria-label="breadcrumb">
 <ol class="breadcrumb">
   <li class="breadcrumb-item"><a href="${path }/member/mypage/myMain">마이페이지</a></li>
   <li class="breadcrumb-item active" aria-current="page">주문내역</li>
 </ol>
</nav>

  <!-- 페이지내용 -->
  <div class="container" style="margin-bottom: 300px">




      <!-- 페이지본문 -->
      <div class="csTitle"><h1>주문내역</h1></div>

      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="fnqtab1" data-bs-toggle="tab" data-bs-target="#delCon1" type="button" role="tab" aria-controls="home" aria-selected="true" style="color: black;">전체</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="fnqtab4" data-bs-toggle="tab" data-bs-target="#delCon2" type="button" role="tab" aria-controls="contact" aria-selected="false" style="color: black;">배송대기</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="fnqtab2" data-bs-toggle="tab" data-bs-target="#delCon3" type="button" role="tab" aria-controls="profile" aria-selected="false" style="color: black;">배송준비중</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="fnqtab3" data-bs-toggle="tab" data-bs-target="#delCon4" type="button" role="tab" aria-controls="contact" aria-selected="false" style="color: black;">배송중</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="fnqtab4" data-bs-toggle="tab" data-bs-target="#delCon5" type="button" role="tab" aria-controls="contact" aria-selected="false" style="color: black;">배송완료</button>
        </li>        
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="delCon1" role="tabpanel" aria-labelledby="home-tab">
         
          <!-- 1111 -->
          
            <div class="col" style="margin-top: 20px;">
                <div class="card" >
                    <div class="card-body">
                        <div class="container">
                            <div class="row row-cols-6" id="orderList">
                                <div class="col">                                    
                                  <img src="https://dummyimage.com/80x80/dee2e6/6c757d.jpg" alt="상품사진">                                    
                                </div>
                                <div class="col">구매날짜</div>
                                <div class="col">상품이름+외n개</div>
                                <div class="col">주문번호</div>
                                <div class="col">주소</div>
                                <div class="col">
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">상세보기</button>
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">배송조회</button>
                                </div>
                            </div>
                          </div>
                    </div>
                  </div>
            </div>
        

        </div>
        <div class="tab-pane fade" id="delCon2" role="tabpanel" aria-labelledby="profile-tab">
          
          <!-- 2222 -->
          
            <div class="col" style="margin-top: 20px;">
                <div class="card" >
                    <div class="card-body">
                        <div class="container">
                            <div class="row row-cols-6" id="orderList">
                                <div class="col">                                    
                                  <img src="https://dummyimage.com/80x80/dee2e6/6c757d.jpg" alt="상품사진">                                    
                                </div>
                                <div class="col">구매날짜</div>
                                <div class="col">상품이름+외n개</div>
                                <div class="col">주문번호</div>
                                <div class="col">주소</div>
                                <div class="col">
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">상세보기</button>
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">배송조회</button>
                              </div>
                            </div>
                          </div>
                    </div>
                  </div>
            </div>
        
          
          
          

        </div>
        <div class="tab-pane fade" id="delCon3" role="tabpanel" aria-labelledby="contact-tab">
          
          <!-- 3333 -->
          
            <div class="col" style="margin-top: 20px;">
                <div class="card" >
                    <div class="card-body">
                        <div class="container">
                            <div class="row row-cols-6" id="orderList">
                                <div class="col">                                    
                                  <img src="https://dummyimage.com/80x80/dee2e6/6c757d.jpg" alt="상품사진">                                    
                                </div>
                                <div class="col">구매날짜</div>
                                <div class="col">상품이름+외n개</div>
                                <div class="col">주문번호</div>
                                <div class="col">주소</div>
                                <div class="col">
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">상세보기</button>
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">배송조회</button>
                              </div>
                            </div>
                          </div>
                    </div>
                  </div>
            </div>
        
          
          

        </div>
        <div class="tab-pane fade" id="delCon4" role="tabpanel" aria-labelledby="contact-tab">
          
            <!-- 4444 -->
            
              <div class="col" style="margin-top: 20px;">
                  <div class="card" >
                      <div class="card-body">
                          <div class="container">
                              <div class="row row-cols-6" id="orderList">
                                  <div class="col">                                    
                                    <img src="https://dummyimage.com/80x80/dee2e6/6c757d.jpg" alt="상품사진">                                    
                                  </div>
                                  <div class="col">구매날짜</div>
                                  <div class="col">상품이름+외n개</div>
                                  <div class="col">주문번호</div>
                                  <div class="col">주소</div>
                                  <div class="col">
                                    <button type="button" class="btn btn-outline-info" style="margin: 3px;">상세보기</button>
                                    <button type="button" class="btn btn-outline-info" style="margin: 3px;">배송조회</button>
                                  </div>
                              </div>
                            </div>
                      </div>
                    </div>
              </div>
          
            
            
          </div>
          <div class="tab-pane fade" id="delCon5" role="tabpanel" aria-labelledby="contact-tab">
          
            <!-- 5555 -->
            
              <div class="col" style="margin-top: 20px;">
                  <div class="card" >
                      <div class="card-body">
                          <div class="container">
                              <div class="row row-cols-6" id="orderList">
                                  <div class="col">                                    
                                    <img src="https://dummyimage.com/80x80/dee2e6/6c757d.jpg" alt="상품사진">                                    
                                  </div>
                                  <div class="col">구매날짜</div>
                                  <div class="col">상품이름+외n개</div>
                                  <div class="col">주문번호</div>
                                  <div class="col">주소</div>
                                  <div class="col">
                                    <button type="button" class="btn btn-outline-info" style="margin: 3px;">상세보기</button>
                                    <button type="button" class="btn btn-outline-info" style="margin: 3px;">배송조회</button>
                                </div>
                              </div>
                            </div>
                      </div>
                    </div>
              </div>
          
            
            
  
          </div>
      </div>
  </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
