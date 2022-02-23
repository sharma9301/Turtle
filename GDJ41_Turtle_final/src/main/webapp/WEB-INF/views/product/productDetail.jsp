<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="header-line"></div>
<section class="py-5">
    <div class="container px-4 px-lg-5 my-5" style="margin-bottom: 100px;">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6 img-div"><img class="card-img-top2 mb-5 mb-md-0" src="${path }/resources/images/product/${product.pdCode.pdImage}" alt="" /></div>
            <div class="col-md-6">
                <div class="small mb-2">상품 코드: <c:out value="${product.pdCode.pdCode }"/></div>
                <h1 class="display-5 fw-bolder"><c:out value="${product.pdCode.pdName }"/></h1>
                <c:if test="${reviewsSum !=null and reviewsSum2 !=null }">
	                <input type="hidden" id="aa" value="${reviewsSum }">
	                <div class="starRev" style="margin-bottom:10px;">
						<span class="starR starG1">별1</span>
						<span class="starR starG2">별2</span>
						<span class="starR starG3">별3</span>
						<span class="starR starG4">별4</span>
						<span class="starR starG5">별5</span>
						<span>&nbsp;${reviewsSum2 }&nbsp;(${totalData } reviews)</span>			
					</div>
				</c:if>
				<c:if test="${reviewsSum ==null and reviewsSum2 ==null}">
					<input type="hidden" id="aa" value="0">
	                <div class="starRev" style="margin-bottom:10px;">
						<span class="starR starG1">별1</span>
						<span class="starR starG2">별2</span>
						<span class="starR starG3">별3</span>
						<span class="starR starG4">별4</span>
						<span class="starR starG5">별5</span>
						<span>&nbsp;${reviewsSum2 }&nbsp;(${totalData } reviews)</span>			
					</div>
				</c:if>
                <style>
					.starR{
						background: url('${path}/resources/images/ico_review.png') no-repeat right 0;
						background-size: auto 100%;
						color: #FF9600;
						width: 30px;
						height: 30px;
						display: inline-block;
						text-indent: -9999px;
						
					}
					.starR.on{background-position:0 0;}
                </style>
                    
                <script>
                $(()=>{
                	let rv_grade = $("#aa").val(); //4
                	console.log(rv_grade);
                	$(".starG"+rv_grade).addClass('on').prevAll('span').addClass('on');
                });
                </script>
                <div class="fs-5 mb-3">
                    <c:if test="${product.pdCode.pdIsDiscount =='Y' }">
	                    <span class="text-decoration-line-through">￦<fmt:formatNumber value="${product.pdCode.pdPrice }" pattern="#,###,###" /></span>
	                    &nbsp;
	                    <span>
	                    	￦<fmt:formatNumber value="${product.pdCode.pdPrice - product.pdCode.pdPrice*product.pdCode.pdDiscountrate/100}" pattern="#,###,###" />
	                    </span>
	                </c:if>
	                <c:if test="${product.pdCode.pdIsDiscount !='Y' }">
	                    <span>
	                    	￦<fmt:formatNumber value="${product.pdCode.pdPrice}" pattern="#,###,###" />
	                    </span>
	                </c:if>
                </div>
               	<c:if test="${product.pdCode.categoryCode.categoryCode eq 'ring' }">
	                <div class="fs-5 mb-3">
	                    <span class="fs-5 mb-1 d-block">Size</span>
	                    <c:forEach items="${sizeList }" var="size">
	                    	<input type="radio" id="size${size.size}" name="size" value="${size.size}" checked><label for="size${size.size}" class="selectSize">${size.size}</label>
	                    </c:forEach>
	                </div>
	            </c:if>
	            <c:if test="${product.pdCode.categoryCode.categoryCode != 'ring' }">
	            <div class="fs-5 mb-5">
                    <span class="fs-5 mb-1 d-block">Size</span>
	            	<input type="radio" id="size${size.size}" name="size" value="0" checked readonly><label for="size${size.size}" class="selectSize">FREE</label>
	            </div>
	            </c:if>
	            <script>
		           
	            </script>
	            
	            
                <style>
                    input[type='radio'] {display: none;}
                    input[type="radio"] + label {
                        display: inline-block;
                        width: 15%;
                        height: 50px;
                        border: 1px solid #dfdfdf;
                        background-color: #ffffff;
                        text-align: center;
                        padding: 7px;
                        cursor: pointer;
                        margin-bottom: 10px;
                    }
                    input[type="radio"]:checked + label {
                        background-color: #000;
                        color: #ffffff;
                    }  
                </style>
                <%-- ${sizeList }
                ${sizeCount } --%>
                <div class="fs-5 mb-3">
                    <table class="table table-borderless">
                        <tr>
                            <td colspan="2"><h4>PRODUCT DETAIL</h4></td>
                        </tr>
                        <tr>
                            <td>MATERIAL</td>
                            <td><c:out value="${product.material }"/></td>
                        </tr>
                        <tr>
                            <td>COLOR</td>
                            <td><c:out value="${product.color }"/></td>
                        </tr>
                        <tr>
                            <td>WEIGHT</td>
                            <td><c:out value="${product.weight }"/></td>
                        </tr>
                        <tr>
                            <td>재고</td>
                            <td>
                                <c:out value="${product.stock }"/>
                            </td>
                        </tr>
                        <tr>
                            <td>구매수량</td>
                            <td>
                               	<input type="number" id="amount" name="amount" style="width: 30%;" placeholder="0" min="1" max="10"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="fs-5 mb-3">
                    <button class="btn btn-lg btn-outline-dark flex-shrink-0" type="button" onclick="orderBtn();">
                        <i class="bi-cart-fill me-1"></i>
                        바로 구매
                    </button>
					<script>
						const orderBtn=()=>{
							if(${loginMember==null}){
								alert('로그인 후 상품구매가 가능합니다.');
							}else{
								if($("#amount").val()<1){
									alert('구매 수량을 선택해주세요.');
								}else{
									let amount=$("#amount").val();
									console.log(amount);
									let size=$("input[name=size]:checked").val();
									console.log(size);
									location.assign('${path}/product/orderProduct.do?pdCode=${product.pdCode.pdCode}&userId=${loginMember.userId }&amount='+amount+'&size='+size);
									
								}
							}
						}
					</script>
                    <button class="btn btn-lg btn-outline-dark flex-shrink-0" type="button" onclick="cartBtn();">
                        <i class="bi bi-bag-plus"></i>
                        장바구니
                    </button>
                    <script>
                    	const cartBtn=()=>{
                    		if(${loginMember==null}){
                    			alert('로그인 후 장바구니 담기가 가능합니다.');
                    		}else{
                    			if($("#amount").val()<1){
                    				alert('상품 수량을 선택해주세요.')
                    			}else{
                    				let amount=$("#amount").val();
                    				let size=$("input[name=size]:checked").val();
                    				location.assign('${path}/product/addCart.do?pdName=${product.pdCode.pdName}&userId=${loginMember.userId }&amount='+amount+'&size='+size)
                    			}
                    		}
                    	}
                    </script>
                </div>
            </div>
        </div>
    </div>
    <div class="container px-4 px-lg-5 my-5">
        <h2 class="fw-bolder mb-4">Photo Review</h2>
        <div class="scrollbar">
            <div class="handle">
                <div class="mousearea"></div>
            </div>
        </div>
        <div class="frame">
            <ul class="slidee">
            	<c:if test="${not empty reviews2}">
            		<c:forEach var="r2" items="${reviews2 }">
	            		<c:if test="${r2.rvIsImage == 'Y' }">
	            			<li><img src="${path }/resources/images/reviews/${r2.rvImage}" width="240px" height="270px"></li>
	            		</c:if>
            		</c:forEach>
                </c:if>
                <c:if test="${empty reviews2}">
					<h3 style="text-align: center; margin-top:30px;">등록된 포토리뷰가 없습니다.</h3>
                </c:if>
            </ul>
        </div>
        <script>
            var sly = new Sly($('.frame'), {
                horizontal: 1, // required
                itemNav: 'basic', // required
                smart: 1,
                mouseDragging: 1,
                touchDragging: 1,
                releaseSwing: 1,
                scrollBy: 1,
                speed: 300,
                elasticBounds: 1,
                dragHandle: 1,
                dynamicHandle: 1,
                scrollBar : $(".scrollbar"),
                clickBar: 1
            }, null).init();
            
        </script>
    </div>
    <div class="container px-5 px-lg-5 my-5">
        <div class="reviews-title">
            <h1>Reviews</h1>
        </div>
        <div class="reviews-header">
            <div class='RatingStar mb-3'>
                <div class='RatingScore'>
                    <div class='outer-star'>
                        <div class='inner-star'></div>
                    </div>
                    <span>
                        ${reviewsSum2 } (${totalData } reviews)
                    </span>
                </div>
            </div>
            <button class="insert-review" onclick="insertReviewBtn();">리뷰 작성하기</button>
        </div>
        <script>
        	const insertReviewBtn=()=>{
        		location.assign('${path}/member/mypage/reviews?userId=${loginMember.userId}');
        	}
        </script>
        <div class="reviews-line"></div>
       	<c:if test="${not empty reviews }">
       		<c:forEach var="r" items="${reviews }">
		        <div class="reviews-content">
		            <div class="review-info">
		                <p><c:out value="${r.userId.userId }"/></p>
		                <p><c:out value="${r.rvDate }"/></p>
		                <input type="hidden" id="bb${r.rvNo }" value="${r.rvGrade }">
		                <div class="starRev2" style="margin-bottom:10px;">
							<p>별점 : ${r.rvGrade } 점</p>
							<span class="starR2 ${r.rvNo }starG1">별1</span>
							<span class="starR2 ${r.rvNo }starG2">별2</span>
							<span class="starR2 ${r.rvNo }starG3">별3</span>
							<span class="starR2 ${r.rvNo }starG4">별4</span>
							<span class="starR2 ${r.rvNo }starG5">별5</span>
						</div>
		                <style>
							.starR2{
								background: url('${path}/resources/images/ico_review.png') no-repeat right 0;
								background-size: auto 100%;
								color: #FF9600;
								width: 15px;
								height: 15px;
								display: inline-block;
								text-indent: -9999px;
								
							}
							.starR2.on{background-position:0 0;}
		                </style>
		                <script>
		                $(()=>{
		                	let rv_grade = $("#bb${r.rvNo }").val();
		                	console.log(rv_grade);
		                	$(".${r.rvNo }starG"+rv_grade).addClass('on').prevAll('span').addClass('on');
		                });
		                </script>
		            </div>
		            <div class="review-detail">
		                <h5><c:out value="${r.rvTitle }"/></h5>
		                <p><c:out value="${r.rvContent }"/></p>
		            </div>
		            <div class="review-img">
		                <img src="${path }/resources/images/reviews/${r.rvImage}" width="120px" height="120px">
		            </div>
		        </div>
		        <div class="reviews-line"></div>
	        </c:forEach>
        </c:if>
        <c:if test="${empty reviews }">
        	<div class="Noreviews-content" >
        		<h5 style="text-align: center; margin: 50px 0 50px 0;">해당 상품에 등록된 리뷰가 없습니다.</h5>
        	</div>
        	<div class="reviews-line"></div>
        </c:if>
    </div>
    <!-- 페이지바 -->
    <c:if test="${not empty reviews }">
	    <div id="pageBar">
	   		${pageBar }
	   	</div>
	</c:if>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>