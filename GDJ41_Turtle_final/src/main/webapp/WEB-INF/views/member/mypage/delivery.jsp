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
    <style>

      

     /* ----------------- 페이지 내용 부분 ------------------ */
     .col {
       text-align: center;
       margin: auto;
     }








    </style>
  <body>
    

<!-- 헤더들어갈자리 -->






<!-- 경로 -->
<nav aria-label="breadcrumb" style="margin:20px;">
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
          <button class="nav-link active" id="order1" data-bs-toggle="tab" data-bs-target="#delCon1" type="button" role="tab" aria-controls="delCon1" aria-selected="true" style="color: black;">전체</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="order2" data-bs-toggle="tab" data-bs-target="#delCon2" type="button" role="tab" aria-controls="delCon2" aria-selected="false" style="color: black;">결제완료</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="order3" data-bs-toggle="tab" data-bs-target="#delCon3" type="button" role="tab" aria-controls="delCon3" aria-selected="false" style="color: black;">배송준비중</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="order4" data-bs-toggle="tab" data-bs-target="#delCon4" type="button" role="tab" aria-controls="delCon4" aria-selected="false" style="color: black;">배송중</button>
        </li> 
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="order5" data-bs-toggle="tab" data-bs-target="#delCon5" type="button" role="tab" aria-controls="delCon5" aria-selected="false" style="color: black;">배송완료</button>
        </li>   
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="order6" data-bs-toggle="tab" data-bs-target="#delCon6" type="button" role="tab" aria-controls="delCon6" aria-selected="false" style="color: black;">주문취소</button>
        </li>      
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="order7" data-bs-toggle="tab" data-bs-target="#delCon7" type="button" role="tab" aria-controls="delCon7" aria-selected="false" style="color: black;">환불요청/완료</button>
        </li>      
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="delCon1" role="tabpanel" aria-labelledby="order1-tab">
         <%-- ${oDList }
         ==================================================================
         ${oDListCount }
         ================================================================== --%>
         <%-- ${first} --%>
          <!-- 1111 -->
          <c:if test="${not empty first}">
          	<c:forEach items="${first }" var="f">
            <div class="col" style="margin-top: 20px;">
                <div class="card" >
                    <div class="card-body">
                        <div class="container">
                            <div class="row row-cols-6" id="orderList1">
                                <div class="col">                                    
                                  <img src="${path }/resources/images/product/${f.PD_IMAGE}" width="80px" height="80px" alt="상품사진">                                    
                                </div>
                                <div class="col"><fmt:formatDate value="${f.ORDER_DATE }" type="date" dateStyle="long"/></div>
                                <div class="col"><c:out value="${f.PD_NAME} 외 ${f.ALLNUM}개 "/></div>
                                <div class="col"><c:out value="${f.ORDER_NO }"/></div>
                                <div class="col"><c:out value="${f.ORDER_STATUS}"/></div>
                                <div class="col">
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;" onclick="location.href='${path }/member/mypage/deliveryDetail?userId=${loginMember.userId}&orderNo=${f.ORDER_NO }&orderDate=${f.ORDER_DATE }';">상세보기</button>
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">배송조회</button>
                                </div>
                            </div>
                          </div>
                    </div>
                  </div>
   			</div>
        </c:forEach>		
    </c:if>

    </div>
        <div class="tab-pane fade" id="delCon2" role="tabpanel" aria-labelledby="order2-tab">
          
          <!-- 2222 -->    
          
<c:if test="${not empty first}">
	<c:forEach items="${first }" var="f">
   		<c:if test="${f.ORDER_STATUS == '결제 완료'}">
            <div class="col" style="margin-top: 20px;">
                <div class="card" >
                    <div class="card-body">
                        <div class="container">
                            <div class="row row-cols-6" id="orderList1">
                                <div class="col">                                    
                                  <img src="${path }/resources/images/product/${f.PD_IMAGE}" width="80px" height="80px" alt="상품사진">                                    
                                </div>
                                <div class="col"><fmt:formatDate value="${f.ORDER_DATE }" type="date" dateStyle="long"/></div>
                                <div class="col"><c:out value="${f.PD_NAME} 외 ${f.ALLNUM}개 "/></div>
                                <div class="col"><c:out value="${f.ORDER_NO }"/></div>
                                <div class="col"><c:out value="${f.ORDER_STATUS}"/></div>
                                <div class="col">
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;" onclick="location.href='${path }/member/mypage/deliveryDetail?userId=${loginMember.userId}&orderNo=${f.ORDER_NO }&orderDate=${f.ORDER_DATE }';">상세보기</button>
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">배송조회</button>
                                </div>
                            </div>
                          </div>
                    </div>
                  </div>
   			</div>
		</c:if>
    </c:forEach>		
</c:if>
        

    </div>
        <div class="tab-pane fade" id="delCon3" role="tabpanel" aria-labelledby="order3-tab">
          
          <!-- 3333 -->
            <c:if test="${not empty first}">
	<c:forEach items="${first }" var="f">
   		<c:if test="${f.ORDER_STATUS == '배송 준비중'}">
            <div class="col" style="margin-top: 20px;">
                <div class="card" >
                    <div class="card-body">
                        <div class="container">
                            <div class="row row-cols-6" id="orderList1">
                                <div class="col">                                    
                                  <img src="${path }/resources/images/product/${f.PD_IMAGE}" width="80px" height="80px" alt="상품사진">                                    
                                </div>
                                <div class="col"><fmt:formatDate value="${f.ORDER_DATE }" type="date" dateStyle="long"/></div>
                                <div class="col"><c:out value="${f.PD_NAME} 외 ${f.ALLNUM}개 "/></div>
                                <div class="col"><c:out value="${f.ORDER_NO }"/></div>
                                <div class="col"><c:out value="${f.ORDER_STATUS}"/></div>
                                <div class="col">
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;" onclick="location.href='${path }/member/mypage/deliveryDetail?userId=${loginMember.userId}&orderNo=${f.ORDER_NO }&orderDate=${f.ORDER_DATE }';">상세보기</button>
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">배송조회</button>
                                </div>
                            </div>
                          </div>
                    </div>
                  </div>
   			</div>
		</c:if>
    </c:forEach>		
</c:if>
        
          
          

        </div>
        <div class="tab-pane fade" id="delCon4" role="tabpanel" aria-labelledby="order4-tab">
          
            <!-- 4444 -->
<c:if test="${not empty first}">
	<c:forEach items="${first }" var="f">
   		<c:if test="${f.ORDER_STATUS == '배송 중'}">
            <div class="col" style="margin-top: 20px;">
                <div class="card" >
                    <div class="card-body">
                        <div class="container">
                            <div class="row row-cols-6" id="orderList1">
                                <div class="col">                                    
                                  <img src="${path }/resources/images/product/${f.PD_IMAGE}" width="80px" height="80px" alt="상품사진">                                    
                                </div>
                                <div class="col"><fmt:formatDate value="${f.ORDER_DATE }" type="date" dateStyle="long"/></div>
                                <div class="col"><c:out value="${f.PD_NAME} 외 ${f.ALLNUM}개 "/></div>
                                <div class="col"><c:out value="${f.ORDER_NO }"/></div>
                                <div class="col"><c:out value="${f.ORDER_STATUS}"/></div>
                                <div class="col">
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;" onclick="location.href='${path }/member/mypage/deliveryDetail?userId=${loginMember.userId}&orderNo=${f.ORDER_NO }&orderDate=${f.ORDER_DATE }';">상세보기</button>
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">배송조회</button>
                                </div>
                            </div>
                          </div>
                    </div>
                  </div>
   			</div>
		</c:if>
    </c:forEach>		
</c:if>
          
          

        </div>
        <div class="tab-pane fade" id="delCon5" role="tabpanel" aria-labelledby="order5-tab">
            <!-- 5555 -->
              <c:if test="${not empty first}">
	<c:forEach items="${first }" var="f">
   		<c:if test="${f.ORDER_STATUS == '배송 완료'}">
            <div class="col" style="margin-top: 20px;">
                <div class="card" >
                    <div class="card-body">
                        <div class="container">
                            <div class="row row-cols-6" id="orderList1">
                                <div class="col">                                    
                                  <img src="${path }/resources/images/product/${f.PD_IMAGE}" width="80px" height="80px" alt="상품사진">                                    
                                </div>
                                <div class="col"><fmt:formatDate value="${f.ORDER_DATE }" type="date" dateStyle="long"/></div>
                                <div class="col"><c:out value="${f.PD_NAME} 외 ${f.ALLNUM}개 "/></div>
                                <div class="col"><c:out value="${f.ORDER_NO }"/></div>
                                <div class="col"><c:out value="${f.ORDER_STATUS}"/></div>
                                <div class="col">
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;" onclick="location.href='${path }/member/mypage/deliveryDetail?userId=${loginMember.userId}&orderNo=${f.ORDER_NO }&orderDate=${f.ORDER_DATE }';">상세보기</button>
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">배송조회</button>
                                </div>
                            </div>
                          </div>
                    </div>
                  </div>
   			</div>
		</c:if>
    </c:forEach>		
</c:if>
          
          </div>
          
          <div class="tab-pane fade" id="delCon6" role="tabpanel" aria-labelledby="order6-tab">
          
            <!-- 6666 -->
            
              <c:if test="${not empty first}">
	<c:forEach items="${first }" var="f">
   		<c:if test="${f.ORDER_STATUS == '주문 취소'}">
            <div class="col" style="margin-top: 20px;">
                <div class="card" >
                    <div class="card-body">
                        <div class="container">
                            <div class="row row-cols-6" id="orderList1">
                                <div class="col">                                    
                                  <img src="${path }/resources/images/product/${f.PD_IMAGE}" width="80px" height="80px" alt="상품사진">                                    
                                </div>
                                <div class="col"><fmt:formatDate value="${f.ORDER_DATE }" type="date" dateStyle="long"/></div>
                                <div class="col"><c:out value="${f.PD_NAME} 외 ${f.ALLNUM}개 "/></div>
                                <div class="col"><c:out value="${f.ORDER_NO }"/></div>
                                <div class="col"><c:out value="${f.ORDER_STATUS}"/></div>
                                <div class="col">
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;" onclick="location.href='${path }/member/mypage/deliveryDetail?userId=${loginMember.userId}&orderNo=${f.ORDER_NO }&orderDate=${f.ORDER_DATE }';">상세보기</button>
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">배송조회</button>
                                </div>
                            </div>
                          </div>
                    </div>
                  </div>
   			</div>
		</c:if>
			
    </c:forEach>
    
</c:if>
          </div>
          
                  <div class="tab-pane fade" id="delCon7" role="tabpanel" aria-labelledby="order7-tab">
          
            <!-- 7777 -->
<c:if test="${not empty first}">
	<c:forEach items="${first }" var="f">
   		<c:if test="${f.ORDER_STATUS == '환불 요청' || f.ORDER_STATUS == '환불 완료'}">
            <div class="col" style="margin-top: 20px;">
                <div class="card" >
                    <div class="card-body">
                        <div class="container">
                            <div class="row row-cols-6" id="orderList1">
                                <div class="col">                                    
                                  <img src="${path }/resources/images/product/${f.PD_IMAGE}" width="80px" height="80px" alt="상품사진">                                    
                                </div>
                                <div class="col"><fmt:formatDate value="${f.ORDER_DATE }" type="date" dateStyle="long"/></div>
                                <div class="col"><c:out value="${f.PD_NAME} 외 ${f.ALLNUM}개 "/></div>
                                <div class="col"><c:out value="${f.ORDER_NO }"/></div>
                                <div class="col"><c:out value="${f.ORDER_STATUS}"/></div>
                                <div class="col">
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;" onclick="location.href='${path }/member/mypage/deliveryDetail?userId=${loginMember.userId}&orderNo=${f.ORDER_NO }&orderDate=${f.ORDER_DATE }';">상세보기</button>
                                  <button type="button" class="btn btn-outline-info" style="margin: 3px;">배송조회</button>
                                </div>
                            </div>
                          </div>
                    </div>
                  </div>
   			</div>
		</c:if>
    </c:forEach>		
</c:if>
          
          

        </div>
          
          
      </div>
  </div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
