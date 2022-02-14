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
    <h1 style="text-align: center; margin-bottom:50px; margin-top:50px;">주문 정보 확인</h1>
    <div class="container" style="display: flex;">
        <div class="receiver-info-container">
            <div style="margin-bottom: 30px;">
                <span>상품 주문 &gt; 주문정보 확인</span>
            </div>
            <div class="receiver-header" style="padding:0 30px 0 30px;">
                <h5><strong>수령자 정보</strong></h5><span>*주문 정보를 수정하려면 이전버튼을 눌러주세요.</span>
                
            </div>
            <div class="receiver-content">
                <form action="${path }/product/payment.do?userId=${userId}&pdName=${product.pdName}&amount=${amount}&payTotalPrice=${(product.pdPrice - product.pdPrice*product.pdDiscountrate/100)*amount}" 
                		id="receiver-info-orderFrm" method="post">
                    <h5>수령자 이름</h5>
                    <input type="text" name="userName" size="70%" value="${userName }" readonly>
                    <h5>수령자 연락처</h5>
                    <input type="text" name="phone" size="70%" value="${phone }" readonly>
                    <h5>수령자 이메일</h5>
                    <input type="email" name="email" size="70%" value="${ email}" readonly>
                    <h5>수령자 주소</h5>
                    <input type="text" name="address" size="70%" value="${address }" readonly>
                </form>
            </div>
            <button type="button" class="beforeBtn" style="float:left; margin-left:40px;" onclick="history.back();">이전</button>
            <button type="submit" class="kakaoPayBtn" style="float:right; margin-right:40px;" form="receiver-info-orderFrm">카카오페이로<br>결제하기</button>
        </div>
        <div class="payment-container">
            <div class="payment-content">
                <div class="payment-top">
                    <div><img src="${path }/resources/images/product/${product.pdImage}" width="120px" height="120px"></div>
                    <div class="productName" style="text-align: left; font-size:20px; width:300px; padding-top:10px;" >
                    	상품코드 : <c:out value="${product.pdCode }"/><br>
                    	상품명 : <c:out value="${product.pdName }"/><br>
                    	사이즈 : <c:out value="${size }"/>
                    </div> 
                </div>
               
                <div class="reviews-line"></div>
                <div class="payment-detail">
                    <div class="detail-title">
                        <h6>상품가격</h6>
                        <h6>할인율</h6>
                        <h6>배송비</h6>
                        <h6>수량</h6>
                        <h6>총 가격</h6>
                    </div>
                    <div class="detail-content">
                        <h6>￦<fmt:formatNumber value="${product.pdPrice }" pattern="#,###,###" /></h6>
                        <h6><c:out value="${product.pdDiscountrate }"/>%</h6>
                        <h6>무료</h6>
                        <h6><c:out value="${amount }"/>개</h6>
                        <h6>￦<fmt:formatNumber value="${(product.pdPrice - product.pdPrice*product.pdDiscountrate/100)*amount}" pattern="#,###,###" /></h6>
                    </div>
                </div>
                <div class="reviews-line"></div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>