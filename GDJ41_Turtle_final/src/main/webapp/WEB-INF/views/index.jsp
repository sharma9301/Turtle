<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
            <div class="main-section">                
                <img src="${path }/resources/images/main1.png" width="100%" height="600px" alt="메인사진">
                <button class="all-product-btn" onclick="location.assign('${path }/product/productList.do?title=All')">All Products</button>
            </div>
            <div class="main-kind">
                <div class="kind-earring">
                    <p>Earrings</p>
                    <a href="${path }/product/productCategoryList.do?title=Earrings">
                        <img src="${path }/resources/images/main-earring.png" alt="메인귀걸이" width="300px" height="250px">
                    </a>
                    </div>
                    <div class="kind-necklace">
                    <p>Necklaces</p>
                    <a href="${path }/product/productCategoryList.do?title=Necklaces">
                        <img src="${path }/resources/images/main-necklace.png" alt="메인목걸이" width="300px" height="250px">
                    </a>    
                </div>
                <div class="kind-bracelet">
                    <p>Bracelets</p>
                    <a href="${path }/product/productCategoryList.do?title=Bracelets">
                        <img src="${path }/resources/images/main-bracelet.png" alt="메인팔찌" width="300px" height="250px">
                    </a>    
                </div>
                <div class="kind-ring">
                    <p>Rings</p>
                    <a href="${path }/product/productCategoryList.do?title=Rings">
                        <img src="${path }/resources/images/main-ring.png" alt="메인반지" width="300px" height="250px">
                    </a>
                </div>
            </div>
            <div class="main-newBest">
                <div class="main-new-arrivals">
                    <img src="${path }/resources/images/main-new.png" alt="메인새상품" width="700px" height="500px">
                    <button class="newArrivals-btn" onclick="location.assign('${path }/product/productNewList.do?title=New')">New Arrivals</button>
                </div>
                <div>
                    <img src="${path }/resources/images/main-best.png" alt="메인베스트" width="700px" height="500px">
                    <button class="best-btn" onclick="location.assign('${path }/product/productBestList.do?title=Best')">Best</button>
                </div>
            </div>
            <div class="container px-4 px-lg-5 mt-5">
                <h1>Sales</h1>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-around">
                <c:forEach begin="1" end="8" step="1" var="p" items="${list }">
                    <div class="col mb-5" onclick="location.assign('${path}/product/productDetail.do?pdCode=${p.pdCode }')">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="${path }/resources/images/product/${p.pdImage}" alt="" style="height:175px" />
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
                                    &nbsp; ￦<fmt:formatNumber value="${p.pdPrice - p.pdPrice*p.pdDiscountrate/100 }" pattern="#,###,###" />
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </div>
                <button class="more-btn" onclick="location.assign('${path }/product/productSaleList.do?title=Sales')">More</button>
            </div>
        </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
