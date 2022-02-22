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
<section>
        <div class="container px-4 px-lg-5 mt-5">
			<c:if test="${keyword !=null }">
            	<h3 style="text-align: center; margin-bottom: 40px;"><strong>'${keyword }'</strong>로 검색한 결과..</h3>
            </c:if>
            <c:if test="${keyword == null}">	
	            <h1 style="text-align: center; margin-bottom: 40px;">${title }</h1>
	            <input type="hidden" class="title" value="${title }">
	            <input type="hidden" class="selectedValue" value="${selectedValue }">
	            
	            <div style="display:flex; justify-content: space-between; margin-bottom:10px;">
	            	<h5 style="text-align: right;">총 <c:out value="${totalContents }"/>개의 상품</h5>
	            	<c:if test="${title != 'New' and title != 'Best' and title !='Sales' }">
		            	<select name="kindSelect" id="kindSelect">
		            		<option class="kindSelectValue" value="new">최신상품순</option>
		            		<option class="kindSelectValue" value="best">인기상품순</option>
		            		<option class="kindSelectValue" value="low">낮은가격순</option>
		            		<option class="kindSelectValue" value="high">높은가격순</option>
		            	</select>
	            	</c:if>
	            	<c:if test="${title == 'New' or title == 'Best' or title =='Sales' }">
		            	<div style="width:10px;"></div>
	            	</c:if>
	            </div>
            </c:if>
            <script>
            		
            	$("#kindSelect").change(e=>{
            		let selectedValue = $(e.target).val();
            		let title = $(".title").val();
            		
            		if(title!="All"){
            			location.assign("${path}/product/productCategoryList.do?title="+title+"&selectedValue="+selectedValue);
            		}else{
            			location.assign("${path}/product/productList.do?title="+title+"&selectedValue="+selectedValue);
            		}
            		
            		/* let data = {selectedValue : selectedValue, title : title};
            		$.ajax({
            			type : "post",
            			url : "/product/productCategoryList.do",
            			data : data,
            			success : function(result) {
            				console.log("데이터 확인용!!!!!!");
            			}
            		}); */
            	});           	
            </script>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-around">
                <!-- 리스트 시작 -->
                <c:if test="${empty list }">
                	찾으시는 상품이 존재하지 않습니다..
                </c:if>
                <c:if test="${not empty list }">
                	<c:forEach var="p" items="${list }">
		                <div class="col mb-5" onclick="location.assign('${path}/product/productDetail.do?pdCode=${p.PD_CODE }')" style="cursor:pointer;">
		                    <div class="card h-100">
		                        <!-- Sale badge-->
		                        <c:if test="${p.pdIsDiscount eq 'Y'}">
		                        	<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
		                        </c:if>
		                        <!-- Product image-->
		                        <img class="card-img-top" src="${path }/resources/images/product/${p.PD_IMAGE}" alt="" style="height:175px"/>
		                        <!-- Product details-->
		                        <div class="card-body p-4">
		                            <div class="text-center">
		                                <!-- Product name-->
		                                <h5 class="fw-bolder">${p.PD_NAME }</h5>
		                                
		                                <!-- Product reviews-->
		                                <input type="hidden" id="aa${p.PD_CODE }" value="${p.AVGG }">
						                <div class="starRev" >
											<span class="starR ${p.PD_CODE }starG1">별1</span>
											<span class="starR ${p.PD_CODE }starG2">별2</span>
											<span class="starR ${p.PD_CODE }starG3">별3</span>
											<span class="starR ${p.PD_CODE }starG4">별4</span>
											<span class="starR ${p.PD_CODE }starG5">별5</span>
										</div>
										<style>
											.starR{
												background: url('${path}/resources/images/ico_review.png') no-repeat right 0;
												background-size: auto 100%;
												color: #FF9600;
												width: 15px;
												height: 15px;
												display: inline-block;
												text-indent: -9999px;
												
											}
											.starR.on{background-position:0 0;}
						                </style>
						                    
						                <script>
						                $(()=>{
						                	let rv_grade = $("#aa${p.PD_CODE }").val();
						                	console.log(rv_grade);
						                	$(".${p.PD_CODE }starG"+rv_grade).addClass('on').prevAll('span').addClass('on');
						                });
						                </script>
										
										
		                                <c:if test="${p.PD_IS_DISCOUNT == 'Y'}">
		                                <!-- Product price-->
		                                <span class="text-muted text-decoration-line-through">
		                                	￦<fmt:formatNumber value="${p.PD_PRICE }" pattern="#,###,###" />
										</span>
										&nbsp; ￦<fmt:formatNumber value="${p.PD_PRICE - p.PD_PRICE*p.PD_DISCOUNTRATE/100}" pattern="#,###,###" />
										</c:if>
										<c:if test="${p.PD_IS_DISCOUNT == 'N'}">
											<!-- Product price-->
											&nbsp; ￦<fmt:formatNumber value="${p.PD_PRICE}" pattern="#,###,###" />
										</c:if>
		                            </div>
		                        </div>
		                        <!-- Product actions-->
		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                            <div class="text-center" class="addToCart">
		                            	<a class="btn btn-outline-dark mt-auto" class="addToCart">Add to cart</a>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		        	</c:forEach>        
                </c:if>           
                <script>
                	$(".addToCart").click(e=>{
                		if(${loginMember==null}){
                			alert('로그인 후 이용 가능합니다.');
                		}	
                	});
                </script>  
            </div>
    	</div>
        <div id="pageBar">
      		${pageBar }
      	</div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>