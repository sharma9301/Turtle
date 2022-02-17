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
    <li class="breadcrumb-item"><a href="${path }/member/mypage/myMain?userId=${loginMember.userId}">마이페이지</a></li>
    <li class="breadcrumb-item"><a href="${path }/member/mypage/delivery?userId=${loginMember.userId}">주문내역</a></li>
    <li class="breadcrumb-item active" aria-current="page">주문내역상세</li>
  </ol>
 </nav>




  <!-- 페이지내용 -->
<div class="container">

      <!-- 페이지본문 -->
    <div class="csTitle"><h1>주문내역 상세보기</h1></div>
    	
			
		${pdList }
    <!-- 주문내역 주문자 기본정보 -->
    
	    <div class="col" style="margin-top: 20px;">
	        <div class="card" >
	            <div class="card-body">
	                <div class="container">
	                    <div class="row" style="border-bottom: lightgray solid 1px; padding: 10px;">
	                        <!-- 주문일자 주문자 주소 운송장번호 주문취소버튼 -->
	                        <table>
	                          <tbody>
							<c:forEach items="${pdList }" var="pd" begin="1" end="1">
							<input type="hidden" id="orderNo" value="${pd.ORDER_NO }">	
	                              <tr>
	                                  <td><fmt:formatDate value="${pd.ORDER_DATE }" type="date" dateStyle="long"/></td>
	                                  <td><c:out value="${pd.RC_NAME}"/></td>
	                                  <td><c:out value="${pd.RC_ADDRESS}"/></td>
	                                  <td><c:out value="주문번호 : ${pd.ORDER_NO}"/></td>
	                                  <td><c:out value="${pd.DELIVERY_COMP}"/><c:out value="${pd.INVOICE}"/></td>
	                                  <c:if test="${pd.EXPIRY lt 8}">
	                                  	<c:choose>
								        	<c:when test = "${pd.ORDER_STATUS == '결제 완료'} ">
								            	<td style="text-align: right;"><button type="button" class="btn btn-outline-secondary" id="cancelBtn">주문취소</button></td>
								         	</c:when>
								         	<c:when test = "${pd.ORDER_STATUS == '환불 요청'} ">
								            	<td style="text-align: right;"><button type="button" class="btn btn-outline-secondary" id="cancelBtn" disabled>환불요청 처리중</button></td>
								         	</c:when>
									        <c:when test = "${pd.ORDER_STATUS == '주문 취소'} ">
									           <td style="text-align: right;"><button type="button" class="btn btn-outline-secondary" id="cancelBtn" disabled>주문취소 완료</button></td>
									        </c:when>
									        <c:otherwise>
									           <td style="text-align: right;"><button type="button" class="btn btn-outline-secondary" id="refundBtn">환불요청</button></td>
									        </c:otherwise>
								      </c:choose>
								      </c:if>
								      <c:if test="${pd.EXPIRY gt 7 }">
								      	<td><c:out value="구매완료"/></td>
								      </c:if>
	                              </tr>
	                          </c:forEach>
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
	                        <c:if test="${not empty pdList}">
								<c:forEach items="${pdList }" var="pd">
		                          <tr style="border-bottom: lightgray solid 1px; padding: 10px;">
		                              <td><img src="${path }/resources/images/product/${pd.PD_IMAGE}" width="80px" height="80px" alt="상품사진"></td>
		                              <td><c:out value="${pd.PD_NAME }"/></td>
		                              <td><c:out value="${pd.PD_CODE }"/></td>
		                              <td><c:out value="${pd.ORDER_AMOUNT }"/></td>
		                              <td><c:out value="${pd.PD_PRICE }"/></td>
		                          </tr>
	                          </c:forEach>
							</c:if>
	                          <!--  총갯수 총가격 -->
	                          <tr>
	                            <td> </td>
	                            <td> </td>
	                            <td> </td>
                           		<c:forEach items="${pdList }" var="pd" begin="1" end="1">
	                            	<td><c:out value="상품 총 수량 : ${pd.TOTAL_AMOUNT } 개"/></td>
	                            	<td><c:out value="상품 총 금액 : ${pd.TOTAL_PRICE } 원"/></td>
								</c:forEach>
	                          </tr>
	                      </table>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
</div>
<script>



let orderNo = $("#orderNo").val();



$("#cancelBtn").click(e=>{ 
	if (confirm("주문취소 후 취소가 불가합니다. 주문을 취소하시겠습니까?")) { 
		location.assign("/member/mypage/orderCancel.do?orderNo="+orderNo);
	} 
	else{ 
		return false;
	}
});
		
$("#refundBtn").click(e=>{ 
	if (confirm("환불요청 후 취소가 불가합니다. 환불요청을 하시겠습니까?")) { 
		location.assign("/member/mypage/refundRequest.do?orderNo="+orderNo);
	} 
	else{ 
		return false;
	}
});
		 	




</script>     
      


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
