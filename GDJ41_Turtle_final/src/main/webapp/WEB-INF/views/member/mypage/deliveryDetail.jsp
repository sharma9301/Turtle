<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path }/resources/css/service.css" rel="stylesheet" type="text/css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="header-line"></div>
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
     .col {
       text-align: center;
       margin: auto;
     }









    </style>

<!-- 헤더들어갈자리 -->


<!-- 경로 -->
<nav aria-label="breadcrumb" style="margin:20px;">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="${path }/member/mypage/myMain">마이페이지</a></li>
    <li class="breadcrumb-item"><a href="${path }/member/mypage/delivery">주문내역</a></li>
    <li class="breadcrumb-item active" aria-current="page">주문내역상세</li>
  </ol>
 </nav>




  <!-- 페이지내용 -->
<div class="container">

      <!-- 페이지본문 -->
    <div class="csTitle"><h1>주문내역 상세보기</h1></div>
    
    <!-- 주문내역 주문자 기본정보 -->
    <div class="col" style="margin-top: 20px;">
        <div class="card" >
            <div class="card-body">
                <div class="container">
                    <div class="row" style="border-bottom: lightgray solid 1px; padding: 10px;">
                        <!-- 주문일자 주문자 주소 운송장번호 주문취소버튼 -->
                        <table>
                          <tbody>
                              <tr>
                                  <td>2021/12/18</td>
                                  <td>김동동</td>
                                  <td>서울특별시 구로구 디지털로 306</td>
                                  <td>주문번호</td>
                                  <td>운송장번호</td>
                                  <td style="text-align: right;"><button type="button" class="btn btn-outline-secondary">주문취소</button></td>
                                  <!-- 배송상태에 따라 '주문취소' 혹은 '반품요청' -->
                              </tr>
                          </tbody>
                      </table>
                    </div>    
                    <div class="row">
                      <style>
                        td{
                          vertical-align: middle;
                        }
                      </style>
                      <table class="table table-borderless">
                        <tr>
                          <th></th>
                          <th>상품명</th>
                          <th>상품코드</th>
                          <th>수량</th>
                          <th>상품가격</th>
                        </tr>
                        <!-- 사진 이름 상품코드 갯수 가격 -->
                          <tr style="border-bottom: lightgray solid 1px; padding: 10px;">
                              <td><img src="https://dummyimage.com/80x80/dee2e6/6c757d.jpg" alt="상품사진"></td>
                              <td>커플반지</td>
                              <td>ring-0001</td>
                              <td>1</td>
                              <td>90,000</td>
                          </tr>
                          <!--  총갯수 총가격 -->
                          <tr>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td>상품총갯수</td>
                            <td>상품총가격</td>
                          </tr>
                      </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
      
      


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
