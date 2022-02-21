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
  </head>
  <body>
    
    <style>

     

     /* ----------------- 페이지 내용 부분 ------------------ */
     








    </style>

<!-- 헤더들어갈자리 -->



<!-- 경로 -->
<nav aria-label="breadcrumb" style="margin:20px;"> 
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="${path }/member/mypage/myMain?userId=${loginMember.userId}">마이페이지</a></li>
    <li class="breadcrumb-item active" aria-current="page">나의리뷰</li>
  </ol>
</nav>


<%-- ${reviews } --%>

  ${notYet}

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
          <c:if test="${not empty reviews}">
          	<c:forEach items="${reviews }" var="r">
            <div class="card" >
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <table>
                                <tbody>
                                    <tr>
                                        <td><img src="${path }/resources/images/product/${r.PD_IMAGE}" width="80px" height="80px" alt="상품사진"></td>
                                        <td>
                                            <div class="mb-3"><fmt:formatDate value="${r.PD_DATE }" type="date" dateStyle="long"/></div>
                                            <button type="button" class="btn btn-outline-secondary rvPage" id="rvPage">리뷰보기</button>
                                            <input type="hidden" class="rvPdCode" value="${r.PD_CODE }">
  											<input type="hidden" class="rvUserId" value="${r.USER_ID}">
                                        </td>
                                        <td><c:out value="${r.PD_NAME }"/></td>
                                        <td style="text-align:right">
                                            <button type="button" class="btn btn-outline-secondary deleteRv">삭제하기</button>
                                            <input type="hidden" class="rvNo" value="${r.ORDER_DETAIL_NO }">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
  				
            </c:forEach>
            </c:if>
        </div>
        
                



        </div>
        <div class="tab-pane fade" id="whatICan" role="tabpanel" aria-labelledby="profile-tab">
          
            <!-- 사진 이름 상품코드 갯수 가격 -->
         <div class="col" style="margin-top: 20px;">
         <c:if test="${not empty notYet}">
          	<c:forEach items="${notYet }" var="n">
            <div class="card" >
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <table>
                                <tbody>
                                    <tr>
                                        <td><img src="${path }/resources/images/product/${n.PD_IMAGE}" width="80px" height="80px" alt="상품사진"></td>
                                        <td>
                                            <div>리뷰를 작성해주세요 :)</div>
                                        </td>
                                        <td><c:out value="${n.PD_NAME }"/></td>
                                        <td style="text-align:right">
                                            <button type="button" class="btn btn-outline-secondary insertReview">리뷰작성</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            </c:if>
        </div>
        </div>
        <script>
        	$(".insertReview").click(e=>{
        		location.assign('${path}/product/insertReview.do?userId=${loginMember.userId}');
        	})
        </script>
      </div>
  </div>
  
<input type="hidden" id="reviewsUserId" value="${loginMember.userId }">  
<script>
  
	let pdCode = "";
	let userId = "";
	let detailNo = "";
	
	$(".rvPage").click(e=>{ 
		console.log(e.target.parentNode.childNodes[5].value);
		console.log(e.target.nextElementSibling.value);
		
		pdCode = e.target.parentNode.childNodes[5].value;
		console.log(e.target.parentNode.childNodes[7].value);
		userId = e.target.parentNode.childNodes[7].value
		location.assign("${path}/product/productDetail.do?pdCode="+pdCode);
	});
  
	$(".deleteRv").click(e=>{ 
		
		console.log(e.target.nextElementSibling.value);
		detailNo = e.target.nextElementSibling.value
		userId = $("#reviewsUserId").val();
		console.log(userId);
		if (confirm("리뷰삭제 후 복구가 불가합니다. 리뷰를 삭제하시겠습니까?")) { 
			location.assign("${path}/member/deleteRv.do?detailNo="+detailNo+"&userId="+userId);
		} 
		else{ 
			return false;
		}
	});
  
  
	
  
  
  
</script>
  
  
  
  
  
  

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
