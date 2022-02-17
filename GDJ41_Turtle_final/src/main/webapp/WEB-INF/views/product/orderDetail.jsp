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
    <h1 style="text-align: center; margin-bottom:50px; margin-top:50px;">상품 주문</h1>
    <div class="container" style="display: flex;">
        <div class="receiver-info-container">
            <div style="margin-bottom: 30px;">
                <span>상품 주문 &gt; 수령자 정보입력</span>
            </div>
            <div class="receiver-header" style="padding:0 30px 0 30px;">
                <h5><strong>수령자 정보</strong></h5>
                <label><input type="checkbox" id="sameUser"> 주문자와 동일</label>
            </div>
            <input type="hidden" class="inputUserName" value="${loginMember.userName }">
            <input type="hidden" class="inputPhone" value="${loginMember.phone }">
            <input type="hidden" class="inputEmail" value="${loginMember.email }">
            <input type="hidden" class="inputAddress" value="${loginMember.address }">
            <script>
            	$("#sameUser").change(e=>{
	           		if($("#sameUser").is(":checked")){
	           			let inputUserName=$(".inputUserName").val();
	           			let inputPhone=$(".inputPhone").val();
	           			let inputEmail=$(".inputEmail").val();
	           			let inputAddress=$(".inputAddress").val();
	           			$("input[name=userName]").attr({value:inputUserName});
	           			$("input[name=phone]").attr({value:inputPhone});
	           			$("input[name=email]").attr({value:inputEmail});
	           			$("input[name=address]").attr({value:inputAddress});
	           		}else{
	           			$("input[name=userName]").attr({value:""});
	           			$("input[name=phone]").attr({value:""});
	           			$("input[name=email]").attr({value:""});
	           			$("input[name=address]").attr({value:""});
	           		}
            	});
            		
            	
            </script>
            <div class="receiver-content">
                <form action="${path }/product/orderCheck.do?pdCode=${product.pdCode}&size=${size}&amount=${amount}&userId=${loginMember.userId}" 
                		id="receiver-info" method="post">
                    <h5>수령자 이름</h5>
                    <input type="text" name="userName" placeholder="홍길동" size="70%" value="" required>
                    <h5>수령자 연락처</h5>
                    <input type="text" name="phone" placeholder="01012341234(-생략)" size="70%" value="" required>
                    <h5>수령자 이메일</h5>
                    <input type="email" name="email" placeholder="abc@naver.com" size="70%" value="" required>
                    <h5>수령자 주소</h5>
                    <input type="text" name="address" placeholder="상세주소" size="70%" value="" required>
                </form>
            </div>
            <button type="button" class="beforeBtn" style="float:left; margin-left:40px;" onclick="history.back();">이전</button>
            <button type="submit" class="daumBtn" style="float:right; margin-right:40px;" form="receiver-info" >다음</button>

        </div>
        <div class="payment-container">
            <div class="payment-content">
                <div class="payment-top">
                    <div><img src="${path }/resources/images/product/${product.pdImage}" width="120px" height="120px"></div>
                    <div class="productName" style="text-align: left; font-size:20px; width:300px; padding-top:10px;" >
                    	상품코드 : <c:out value="${product.pdCode }"/><br>
                    	상품명 : <c:out value="${product.pdName }"/><br> 
                    	<c:if test="${product.categoryCode.categoryCode == 'ring' }">
                    		사이즈 : <c:out value="${size }"/>
                    	</c:if>
                    	<c:if test="${product.categoryCode.categoryCode != 'ring' }">
                    		사이즈 : FREE
                    		<c:set var="size" value="${size }"/>
                    	</c:if>
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
                        <h6><input type="number" value="${amount }" min="1" max="10" style="width:40px;" class="amount"></h6>
                        <h6>￦<fmt:formatNumber value="${(product.pdPrice - product.pdPrice*product.pdDiscountrate/100)*amount}" pattern="#,###,###" /></h6>
                        
                    </div>
                    
                </div>
                <div class="reviews-line"></div>
                <button style="float: right;" onclick="updateAmount();" class="updateAmount" >수량변경</button>
                <script>
                	const updateAmount=()=>{
                		let amount = $(".amount").val();
                		location.assign('/product/orderProduct.do?pdCode=${product.pdCode}&size=${size}&userId=${loginMember.userId }&amount='+amount);
                	}
                </script>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>