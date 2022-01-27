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
  <body>
    
    <style>

     

     /* ----------------- 페이지 내용 부분 ------------------ */
     



     nav {
       margin: 20px;
     }




    </style>

<!-- 헤더들어갈자리 -->



<!-- 경로 -->
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="${path }/mypage/myMain">마이페이지</a></li>
    <li class="breadcrumb-item active" aria-current="page">나의리뷰</li>
  </ol>
</nav>




  

  <!-- 페이지내용 -->

  <div class="container">




      <!-- 페이지본문 -->
      <div class="csTitle"><h1>나의 리뷰</h1></div>

      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="fnqtab1" data-bs-toggle="tab" data-bs-target="#whatIDid" type="button" role="tab" aria-controls="home" aria-selected="true" style="color: black;">내가 작성한 리뷰</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="fnqtab2" data-bs-toggle="tab" data-bs-target="#whatICan" type="button" role="tab" aria-controls="profile" aria-selected="false" style="color: black;">작성가능한 리뷰</button>
        </li>       
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="whatIDid" role="tabpanel" aria-labelledby="home-tab">
         
         <!-- 사진 이름 상품코드 갯수 가격 -->
         <div class="col" style="margin-top: 20px;">
            <div class="card" >
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <table>
                                <tbody>
                                    <tr>
                                        <td><img src="" alt="상품사진"></td>
                                        <td>
                                            <div>구매날짜</div>
                                            <button type="button" class="btn btn-outline-secondary">리뷰보기</button>
                                        </td>
                                        <td>상품이름</td>
                                        <td style="text-align:right">
                                            <button type="button" class="btn btn-outline-secondary">수정하기</button>
                                            <button type="button" class="btn btn-outline-secondary">삭제하기</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
                



        </div>
        <div class="tab-pane fade" id="whatICan" role="tabpanel" aria-labelledby="profile-tab">
          
            <!-- 사진 이름 상품코드 갯수 가격 -->
         <div class="col" style="margin-top: 20px;">
            <div class="card" >
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <table>
                                <tbody>
                                    <tr>
                                        <td><img src="" alt="상품사진"></td>
                                        <td>
                                            <div>구매날짜</div>
                                        </td>
                                        <td>상품이름</td>
                                        <td style="text-align:right">
                                            <button type="button" class="btn btn-outline-secondary">리뷰작성</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
          
          



        </div>
        
      </div>
  </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
