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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<div class="header-line"></div>
<section>
${product }
    <h1 style="text-align: center; margin-bottom:50px; margin-top:50px;">주문 정보 확인</h1>
    <div class="container" style="display: flex;">
        <div class="receiver-info-container">
            <div style="margin-bottom: 30px;">
                <span>상품 주문 &gt; 주문정보 확인</span>
            </div>
            <div class="receiver-header" style="padding:0 30px 0 30px;">
                <h5><strong>수령자 정보</strong></h5><span>*주문 정보를 수정하려면 이전버튼을 눌러주세요.</span>
            </div>
            <div class="receiver-content checkInput">
                <h5>수령자 이름</h5>
                <input type="text" name="userName" size="70%" value="${userName }" readonly>
                <h5>수령자 연락처</h5>
                <input type="text" name="phone" size="70%" value="${phone }" readonly>
                <h5>수령자 이메일</h5>
                <input type="email" name="email" size="70%" value="${ email}" readonly>
                <h5>수령자 주소</h5>
                <input type="text" name="address" size="70%" value="${address }" readonly>
            </div>
            <button type="button" class="beforeBtn" style="float:left; margin-left:40px;" onclick="history.back();">이전</button>
            
            <table id="paymentTbl">
            	<tr style="height:30px;">
            		<td id="niceCardBtn" class="niceCardBtn">일반카드결제</td>
            	</tr>
            	<tr style="height:30px;">
            		<td id="kakaoPayBtn" class="kakaoPayBtn"><img src="${path }/resources/images/kakao.png" style="width:70px; height:25px;"> 카카오페이결제</td>
            	</tr>
            </table>
            <input type="hidden" value="${product.pdName }" class="pdName"> 
            <script>
            /* 일반결제 */
            $("#niceCardBtn").click(e=>{
            	var date = new Date();
                var year = date.getFullYear().toString();
                var month = date.getMonth() + 1;
                month = month < 10 ? '0' + month.toString() : month.toString();
                var day = date.getDate();
                day = day < 10 ? '0' + day.toString() : day.toString();
                let today = year + month + day ;

                let orderNo = today+(Math.ceil(Math.random()*10000));
              	console.log(orderNo);
        		let pdName=$(".pdName").val();
        		pdName = pdName.replace(/\n/g,"");
              	console.log(pdName);
        		
              	//가맹점 식별코드
               	IMP.init('imp77938975');
             	IMP.request_pay({
        	        pg : 'nice',
        		    pay_method : 'card', //생략 가능
        		    merchant_uid: orderNo, // 상점에서 관리하는 주문 번호 (임의의 값 설정하기)
        		    name : pdName,
        		    amount : <fmt:formatNumber value="${(product.pdPrice - product.pdPrice*product.pdDiscountrate/100)*amount}" pattern="####" type="number" maxFractionDigits="0"/>,
        		    buyer_email : '${ email}',
        		    buyer_name : '${userName }',
        		    buyer_tel : '${phone }',
        		    buyer_addr : '${address}'
        		}, function(rsp) {
                	console.log("rsp : "+rsp);
                	if ( rsp.success ) {
        		        var msg = '결제가 완료되었습니다.';
        		        location.assign('${path}/product/insertOrder.do?orderNo='+orderNo+'&pdName='+pdName+'&size=${size}&userId=${userId}&rcName=${userName}&rcPhone=${phone}&rcAddress=${address}&payMethod=카드&amount=${amount}&payTotalPrice=<fmt:formatNumber value="${(product.pdPrice - product.pdPrice*product.pdDiscountrate/100)*amount}" pattern="####" type="number" maxFractionDigits="0"/>');
        			} else {
                    	var msg = '결제에 실패하였습니다. 다시 시도해주시기 바랍니다.';
                    	msg += '에러내용 : ' + rsp.error_msg;
                    	location.assign('${path}/product/productDetail.do?pdCode=${product.pdCode}');
        			}
        	        alert(msg);
        		});  
            });
            
	        /* 카카오페이 */
            $("#kakaoPayBtn").click(e=>{
            	var date = new Date();
                var year = date.getFullYear().toString();
                var month = date.getMonth() + 1;
                month = month < 10 ? '0' + month.toString() : month.toString();
                var day = date.getDate();
                day = day < 10 ? '0' + day.toString() : day.toString();
                let today = year + month + day ;

                let orderNo = today+(Math.ceil(Math.random()*10000));
              	console.log(orderNo);
        		let pdName=$(".pdName").val();
        		pdName = pdName.replace(/\n/g,"");
              	console.log(pdName);
        		
              	//가맹점 식별코드
               	IMP.init('imp77938975');
             	IMP.request_pay({
        	        pg : 'kakaopay',
        		    pay_method : 'kakao', //생략 가능
        		    merchant_uid: orderNo, // 상점에서 관리하는 주문 번호 (임의의 값 설정하기)
        		    name : pdName,
        		    amount : <fmt:formatNumber value="${(product.pdPrice - product.pdPrice*product.pdDiscountrate/100)*amount}" pattern="####" type="number" maxFractionDigits="0"/>,
        		    buyer_email : '${ email}',
        		    buyer_name : '${userName }',
        		    buyer_tel : '${phone }',
        		    buyer_addr : '${address}'
        		}, function(rsp) {
                	console.log("rsp : "+rsp);
                	if ( rsp.success ) {
        		        var msg = '결제가 완료되었습니다.';
        		        location.assign('${path}/product/insertOrder.do?orderNo='+orderNo+'&pdName='+pdName+'&size=${size}&userId=${userId}&rcName=${userName}&rcPhone=${phone}&rcAddress=${address}&payMethod=카카오페이&amount=${amount}&payTotalPrice=<fmt:formatNumber value="${(product.pdPrice - product.pdPrice*product.pdDiscountrate/100)*amount}" pattern="####" type="number" maxFractionDigits="0"/>');
        			} else {
                    	var msg = '결제에 실패하였습니다. 다시 시도해주시기 바랍니다.';
                    	msg += '에러내용 : ' + rsp.error_msg;
                    	location.assign('${path}/product/productDetail.do?pdCode=${product.pdCode}');
        			}
        	        alert(msg);
        		});  
            });
            </script>
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
                        <h6><c:out value="${amount }"/>개</h6>
                        <h6>
                        ￦<fmt:formatNumber value="${(product.pdPrice - product.pdPrice*product.pdDiscountrate/100)*amount}" pattern="#,###,###" type="number" />
                        </h6>
                    </div>
                </div>
                <div class="reviews-line"></div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>