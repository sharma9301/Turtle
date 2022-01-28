<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
    <h1 style="text-align: center;">주문하기</h1>
    <div class="container" style="display: flex;">
        <div class="receiver-info-container">
            <div style="margin-bottom: 30px;">
                <span>수령자 정보 &gt; 결제</span>
            </div>
            <div class="receiver-header">
                <h5><strong>수령자 정보</strong></h5>
                <label><input type="checkbox"> 주문자와 동일</label>
            </div>
            <div class="receiver-content">
                <form action="#" id="receiver-info">
                    <h5>수령자 이름</h5>
                    <input type="text" name="userName" placeholder="홍길동" size="70%">
                    <h5>수령자 연락처</h5>
                    <input type="text" name="phone" placeholder="01012341234(-생략)" size="70%">
                    <h5>수령자 이메일</h5>
                    <input type="email" name="email" placeholder="abc@naver.com" size="70%">
                    <h5>수령자 주소</h5>
                    <input type="text" name="address" placeholder="상세주소" size="70%">
                </form>
            </div>
            <button type="submit" class="daumBtn">다음</button>
        </div>
        <div class="payment-container">
            <div class="payment-content">
                <div class="payment-top">
                    <div><img src="${path }/resources/images/sale1.png" width="120px" height="120px"></div>
                    <div class="productName" style="text-align: right;">상품 이름</div>
                    <div style="text-align: right; display: block;"> 
                        ₩99,000 
                        <input type="number" style="width:20%" placeholder="1">
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
                        <h6>₩99,000</h6>
                        <h6>10%</h6>
                        <h6>무료</h6>
                        <h6>1 개</h6>
                        <h6>₩99,000</h6>
                    </div>
                    
                </div>
                <div class="reviews-line"></div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>