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
            <h5 style="text-align: right; margin-bottom:10px">총 <c:out value="${totalContents }"/>개의 상품</h5>
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
		                        <img class="card-img-top" src="${path }/resources/images/${p.pdImage}" alt="" style="height:175px"/>
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
		                                <!-- Product price-->
		                                <span class="text-muted text-decoration-line-through">
		                                ￦<fmt:formatNumber value="${p.pdPrice }" pattern="#,###,###" />
										</span>
										&nbsp; ￦<fmt:formatNumber value="${p.pdPrice }" pattern="#,###,###" />
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