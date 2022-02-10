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
            <h1 style="text-align: center; margin-bottom: 40px;">${title }</h1>
            <input type="hidden" class="title" value="${title }">
            <input type="hidden" class="selectedValue" value="${selectedValue }">
            
            <div style="display:flex; justify-content: space-between; margin-bottom:10px;">
            	<h5 style="text-align: right;">총 <c:out value="${totalContents }"/>개의 상품</h5>
            	<c:if test="${title != 'New' and title != 'Best' }">
	            	<select name="kindSelect" id="kindSelect">
	            		<option class="kindSelectValue" value="new">최신상품순</option>
	            		<option class="kindSelectValue" value="best">인기상품순</option>
	            		<option class="kindSelectValue" value="low">낮은가격순</option>
	            		<option class="kindSelectValue" value="high">높은가격순</option>
	            	</select>
            	</c:if>
            	<c:if test="${title == 'New' and title == 'Best' }">
	            	<div style="width:10px;"></div>
            	</c:if>
            </div>
            <script>
            		
            	$("#kindSelect").change(e=>{
            		let selectedValue = $(e.target).val();
            		let title = $(".title").val();
            		
            		if(title!="All"){
            			location.assign("/product/productCategoryList.do?title="+title+"&selectedValue="+selectedValue);
            		}else{
            			location.assign("/product/productList.do?title="+title+"&selectedValue="+selectedValue);
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
               <%-- ${list} --%>
                <!-- 리스트 시작 -->
                <c:if test="${not empty list }">
                	<c:forEach var="p" items="${list }">
		                <div class="col mb-5" onclick="location.assign('${path}/product/productDetail.do?pdCode=${p.pdCode }')">
		                    <div class="card h-100">
		                        <!-- Sale badge-->
		                        <c:if test="${p.pdIsDiscount eq 'Y'}">
		                        	<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
		                        </c:if>
		                        <!-- Product image-->
		                        <img class="card-img-top" src="${path }/resources/images/product/${p.pdImage}" alt="" style="height:175px"/>
		                        <!-- Product details-->
		                        <div class="card-body p-4">
		                            <div class="text-center">
		                                <!-- Product name-->
		                                <h5 class="fw-bolder">${p.pdName }</h5>
		                                <!-- Product reviews-->
		                                <div class="d-flex justify-content-center small text-warning mb-2">
		                                    <div class="bi-star-fill"></div>
		                                    <div class="bi-star-fill"></div>
		                                    <div class="bi-star-fill"></div>
		                                    <div class="bi-star-fill"></div>
		                                    <div class="bi-star"></div>
		                                </div>
		                                <c:if test="${p.pdIsDiscount == 'Y'}">
		                                <!-- Product price-->
		                                <span class="text-muted text-decoration-line-through">
		                                	￦<fmt:formatNumber value="${p.pdPrice }" pattern="#,###,###" />
										</span>
										&nbsp; ￦<fmt:formatNumber value="${p.pdPrice - p.pdPrice*p.pdDiscountrate/100}" pattern="#,###,###" />
										</c:if>
										<c:if test="${p.pdIsDiscount == 'N'}">
											<!-- Product price-->
											&nbsp; ￦<fmt:formatNumber value="${p.pdPrice}" pattern="#,###,###" />
										</c:if>
		                            </div>
		                        </div>
		                        <!-- Product actions-->
		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
		                        </div>
		                    </div>
		                </div>
		        	</c:forEach>        
                </c:if>             
            </div>
    	</div>
        <div id="pageBar">
      		${pageBar }
      	</div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>