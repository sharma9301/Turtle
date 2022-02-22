<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp"/>
<main>
                    <div class="container-fluid w-100">
                        <form class="form" style="margin: 50px auto 50px auto;" action="${path }/admin/searchOrder.do" method="get">
                            <div class="container">
                            	<%-- ${selectOrderList}
                            	==================
                            	${selectOrderCount } --%>
                                <h1 class="mt-4 mb-4">주문 관리</h1>
                                <style>
                                    th{
                                        width: 150px;
                                    }
                                </style>
                                <table class="table align-middle">
                                    <tr>
                                        <th class="table-active">검색어</th>
                                        <td>
                                            <div id="searchTypeDiv" style="display: flex;">
                                                <select class="form-select me-2" id="searchType" name="searchType" style="width: 150px;">
                                                    <option value="ORDER_NO">주문 번호</option>
                                                    <option value="INVOICE">운송장 번호</option>
                                                    <option value="divider" disabled>---------------</option>
                                                    <option value="USER_ID">주문자 아이디</option>
                                                    <option value="USER_NAME">주문자 이름</option>
                                                    <option value="USER_EMAIL">주문자 이메일</option>
                                                    <option value="USER_PHONE">주문자 연락처</option>
                                                    <option value="divider" disabled>---------------</option>
                                                    <option value="RC_NAME">수령자 이름</option>
                                                    <option value="RC_PHONE">수령자 연락처</option>
                                                    <option value="RC_ADDRESS">수령자 주소</option>

                                                </select>
                                                <div id="search-ORDER_NO">
                                                    <input type="hidden" name="searchType" value="ORDER_NO">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'ORDER_NO'?keyword:''}"
                                                    placeholder="주문 번호를 입력하세요">
                                                </div>
                                                <div id="search-INVOICE">
                                                    <input type="hidden" name="searchType" value="INVOICE">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'INVOICE'?keyword:''}"
                                                    placeholder="운송장 번호를 입력하세요">
                                                </div>
                                                <div id="search-USER_ID">
                                                    <input type="hidden" name="searchType" value="USER_ID">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'USER_ID'?keyword:''}"
                                                    placeholder="주문자 아이디를 입력하세요">
                                                </div>
                                                <div id="search-USER_NAME">
                                                    <input type="hidden" name="searchType" value="USER_NAME">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'USER_NAME'?keyword:''}"
                                                    placeholder="주문자 이름을 입력하세요">
                                                </div>
                                                <div id="search-USER_EMAIL">
                                                    <input type="hidden" name="searchType" value="USER_EMAIL">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'USER_EMAIL'?keyword:''}"
                                                    placeholder="주문자 이메일을 입력하세요">
                                                </div>
                                                <div id="search-USER_PHONE">
                                                    <input type="hidden" name="searchType" value="USER_PHONE">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'USER_PHONE'?keyword:''}"
                                                    placeholder="주문자 연락처를 입력하세요">
                                                </div>
                                                <div id="search-RC_NAME">
                                                    <input type="hidden" name="searchType" value="RC_NAME">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'RC_NAME'?keyword:''}"
                                                    placeholder="수령자 이름을 입력하세요">
                                                </div>
                                                <div id="search-RC_PHONE">
                                                    <input type="hidden" name="searchType" value="RC_PHONE">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'RC_PHONE'?keyword:''}"
                                                    placeholder="수령자 연락처를 입력하세요">
                                                </div>
                                                <div id="search-RC_ADDRESS">
                                                    <input type="hidden" name="searchType" value="RC_ADDRESS">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'RC_ADDRESS'?keyword:''}"
                                                    placeholder="수령자 주소를 입력하세요">
                                                </div>
                                            </div>
                                            <script>
                                            	$("#searchTypeDiv>div[id^=search]").css("display","none");//처음 시작할때 모두 안보이게 설정
                                                $(()=>{
                                                    $("#searchType").change(e=>{
                                                        console.log($(e.target).val());
                                                        const value = $(e.target).val();
                                                        $("#searchTypeDiv>div[id^=search]").css("display","none");
                                                        $("div#search-"+value).css("display","inline-block");
                                                    })
                                                })
                                                
                                                $(()=>{
                                                    $("#searchType").change();
                                                })
                                            </script>    
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="table-active">결제 수단</th>
                                        <td>
                                            <div id="searchTypeDiv" style="display: flex;">
                                                <select class="form-select me-2" id="pay_method" name="pay_method" style="width: 150px;">
                                                    <option selected value="">분류 선택</option>
                                                    <option value="카드">카드</option>
                                                    <option value="네이버페이">네이버 페이</option>
                                                    <option value="카카오페이">카카오 페이</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="table-active">주문일</th>
                                        <td>
                                            <div class="btn-group btn-group-sm" role="group">
                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDateToday">
                                                <label class="btn btn-outline-secondary" for="enrollDateToday">오늘</label>
                                                
                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDateYesterday">
                                                <label class="btn btn-outline-secondary" for="enrollDateYesterday">어제</label>

                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDate3day">
                                                <label class="btn btn-outline-secondary" for="enrollDate3day">3일</label>
                                            
                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDate7day">
                                                <label class="btn btn-outline-secondary" for="enrollDate7day">7일</label>

                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDate15day">
                                                <label class="btn btn-outline-secondary" for="enrollDate15day">15일</label>

                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDate1month">
                                                <label class="btn btn-outline-secondary" for="enrollDate1month">1개월</label>

                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDate3months">
                                                <label class="btn btn-outline-secondary" for="enrollDate3months">3개월</label>

                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDate6months">
                                                <label class="btn btn-outline-secondary" for="enrollDate6months">6개월</label>

                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDate1year">
                                                <label class="btn btn-outline-secondary" for="enrollDate1year">1년</label>

                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDateAll" checked>
                                                <label class="btn btn-outline-secondary" for="enrollDateAll">전체</label>

                                                <input type="date" name="fromDate" id="fromDate" class="form-control ms-2" value="2022-01-01" style="width: 160px;"/>
                                                <span>&nbsp;~&nbsp;</span> 
                                                <input type="date" name="toDate" id="toDate" class="form-control" style="width: 160px;"/>

                                            </div>
                                            
                                            <script>
                                                var d= new Date();
                                                
                                                var kor_date = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString();
                                                /* document.getElementById('fromDate').value = kor_date.substring(0, 10); */
                                                document.getElementById('toDate').value = kor_date.substring(0, 10);
                                                
                                                $("input:radio[name=enrollDate]").click(e=>{
                                                    let selectDate = $(e.target).next()[0].innerText;
                                                    let newDate = new Date(d.getTime() - (d.getTimezoneOffset() * 60000));
                                                    // console.log(selectDate);
                                                    // console.log("변경전 newDate : " + newDate);

                                                    switch(selectDate){
                                                        case "오늘": break;
                                                        case "어제": newDate.setDate(newDate.getDate()-1); break;
                                                        case "3일": newDate.setDate(newDate.getDate()-3); break;
                                                        case "7일": newDate.setDate(newDate.getDate()-7); break;
                                                        case "15일": newDate.setDate(newDate.getDate()-15); break;
                                                        case "1개월": newDate.setMonth(newDate.getMonth()-1); break;
                                                        case "3개월": newDate.setMonth(newDate.getMonth()-3); break;
                                                        case "6개월": newDate.setMonth(newDate.getMonth()-6); break;
                                                        case "1년": newDate.setFullYear(newDate.getFullYear()-1); break;
                                                        case "전체": newDate.setFullYear(2022);
                                                   		newDate.setMonth(0);
                                                    	newDate.setDate(2);
                                                    	break;

                                                    }
                                                    // console.log("변경후 newDate : " + newDate);
                                                    let cFromDate = newDate.toISOString().substring(0,10);
                                                    console.log(cFromDate);
                                                    document.getElementById('fromDate').value = cFromDate;
                                                });
                                            </script>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="container-fluid" style="display:block; margin:10px 0; position: relative; text-align: center;">
                                <button type="submit" class="btn btn-secondary" formmethod="get">검색</button>
                                <button type="reset" class="btn btn-secondary">취소</button>
                            </div>
                        </form>
                    </div>
                    <div class="container-fluid mb-5" style="width: 95%;">
                        <style>
                            td{
                                vertical-align: middle;
                            }
                        </style>
                        <table id="datatablesSimple" class="table table-hover table-bordered">
                            <thead>
                                <tr style="background-color: darkgray;">
                                    <th scope="col" style="width: 0px;"><input type="checkbox" class="allChk"></th>
                                    <th scope="col" style="width: 80px;" class="orderDate">주문일</th>
                                    <th scope="col" style="width: 80px;" class="orderNo">주문번호</th>
                                    <th scope="col" style="width: 100px;" class="user">주문자</th>
                                    <th scope="col" class="productName">상품명</th>
                                    <th scope="col" style="width: 100px;" class="paymentTotalPrice">총결제금액</th>
                                    <th scope="col" style="width: 140px;" class="paymentMethod">결제수단</th>
                                    <th scope="col" style="width: 90px;" class="deliveryCompany">택배사</th>
                                    <th scope="col" class="invoiceNo">송장번호</th>
                                    <th scope="col" style="width: 90px;" class="undelivered">미배송</th>
                                    <th scope="col" style="width: 110px;" class="readyShipping">배송준비</th>
                                    <th scope="col" style="width: 90px;" class="shipping">배송중</th>
                                    <th scope="col" style="width: 110px;" class="deliveryCompleted">배송완료</th>
                                    <th scope="col" style="width: 80px;" class="orderCancel">취소</th>
                                    <th scope="col" style="width: 110px;" class="orderRefund">환불요청</th>
                                    <th scope="col" style="width: 110px;" class="orderRefund">환불완료</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="order" items="${orderList}">
                            		<tr>
	                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_orderNo" name="rowChk_orderNo"></td>
	                                    <td scope="col" class="orderDate">
	                                    	<fmt:formatDate value="${order.ORDER_DATE }" type="date" pattern="yy/MM/dd"/>
	                                    </td>
	                                    <td scope="col" class="orderNo">${order.ORDER_NO }</td>
	                                    <td scope="col" class="user">${order.USER_ID }<br>(${order.USER_NAME })</td>
	                                    <td scope="col" class="productName">${order.PD_NAME } 외 ${order.ALLNUM }</td>
	                                    <td scope="col" class="paymentTotalPrice">
	                                    	<fmt:formatNumber value="${order.PAYTOTALPRICE }" type="currency"/>
	                                   	</td>
	                                    <td scope="col" class="paymentMethod">${order.PAY_METHOD }</td>
	                                    <td scope="col" class="deliveryCompany">
	                                        <select class="form-select-sm" name="deliveryCompany" id="deliveryCompany">
	                                            <option value="우체국택배" ${fn:contains(order.DELIVERY_COMP,'우체국택배')?'selected':'' }>우체국택배</option>
	                                            <option value="CJ대한통운" ${fn:contains(order.DELIVERY_COMP,'CJ대한통운')?'selected':'' }>CJ대한통운</option>
	                                            <option value="한진택배" ${fn:contains(order.DELIVERY_COMP,'한진택배')?'selected':'' }>한진택배</option>
	                                            <option value="로젠택배" ${fn:contains(order.DELIVERY_COMP,'로젠택배')?'selected':'' }>로젠택배</option>
	                                            <option value="롯데택배" ${fn:contains(order.DELIVERY_COMP,'롯데택배')?'selected':'' }>롯데택배</option>
	                                        </select>
	                                    </td>
	                                    <td scope="col" class="invoiceNo">
	                                        <input type="text" name="invoice" id="invoice" value="${order.INVOICE }" size="15" maxlength="13" placeholder="송장 번호 입력">
	                                    </td>
	                                    <td scope="col" class="undelivered">${fn:contains(order.ORDER_STATUS,'결제 완료')?'1':'0' }</td>
	                                    <td scope="col" class="readyShipping">${fn:contains(order.ORDER_STATUS,'배송 준비중')?'1':'0' }</td>
	                                    <td scope="col" class="shipping">${fn:contains(order.ORDER_STATUS,'배송 중')?'1':'0' }</td>
	                                    <td scope="col" class="deliveryCompleted">${fn:contains(order.ORDER_STATUS,'배송 완료')?'1':'0' }</td>
	                                    <td scope="col" class="orderCancel">${fn:contains(order.ORDER_STATUS,'주문 취소')?'1':'0' }</td>
	                                    <td scope="col" class="orderRefundRequest">${fn:contains(order.ORDER_STATUS,'환불 요청')?'1':'0' }</td>
	                                    <td scope="col" class="orderRefundFinish">${fn:contains(order.ORDER_STATUS,'환불 완료')?'1':'0' }</td>
                                	</tr>
                            	</c:forEach>
                                
                                
                            </tbody>
                        </table>
                        <table class="table table-borderless">
                            <tr>
                                <td colspan="11">
                                    <div style="text-align: left;">
                                        <button class="btn btn-secondary updateInvoice">송장 번호 저장</button>
                                        <div class="btn-group">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                            배송 상태 변경
                                            </button>
                                            
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <li><a class="dropdown-item" >미배송</a></li>
                                            <li><a class="dropdown-item" >배송 준비중</a></li>
                                            <li><a class="dropdown-item" >배송 중</a></li>
                                            <li><a class="dropdown-item" >배송 완료</a></li>
                                            </ul>
                                        </div>
                                        <div class="btn-group" style="float: right;">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                            취소/환불
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <li><a class="dropdown-item" >주문 취소</a></li>
                                            <li><a class="dropdown-item" >환불 요청</a></li>
                                            <li><a class="dropdown-item" >환불 완료</a></li>
                                            </ul>
                                        </div>
                                        <script>
                                        	
                                        
                                        
                                            $(()=>{
                                            	//최소 한개 이상 클릭 안하면 온클릭 작동 못하게 하는 로직
                                                let rowChk = document.getElementsByClassName("rowChk_orderNo");
                                                console.log(rowChk);
                                                let orderNo = "";
                                                let deliveryComp = "";
                                                let invoice = "";
                                                let updateData = "";
                                                
                                                //송장 번호 저장하는 로직
                                                $(".updateInvoice").click(e=>{
                                                    console.log(rowChk);
                                                    let i = 0;
                                                    let count = 0;
                                                    updateData = "";
                                                    for(i=0; i<rowChk.length; i++) {
                                                        if(rowChk[i].checked){
                                                            console.log("체크 됨");
                                                            count++;
                                                            console.log("orderNo : "+rowChk[i].parentNode.parentNode.childNodes[2].childNodes[0].data);
                                                        	orderNo = rowChk[i].parentNode.parentNode.childNodes[2].childNodes[0].data;
                                                        	console.log("deliveryComp : "+rowChk[i].parentNode.parentNode.childNodes[7].childNodes[1].value);
                                                        	deliveryComp = rowChk[i].parentNode.parentNode.childNodes[7].childNodes[1].value;
                                                        	if(confirm("주문번호 ["+orderNo+"] 의 택배사가 ["+deliveryComp+"]가 맞습니까?")){
                                                        		
                                                        	}else{
                                                        		alert("택배사를 선택 후 다시 실행해주세요.");
                                                    			return;
                                                        	}
                                                        	
                                                        	console.log("invoice : "+rowChk[i].parentNode.parentNode.childNodes[8].childNodes[1].value);
                                                        	invoice = rowChk[i].parentNode.parentNode.childNodes[8].childNodes[1].value;
                                                        	if(invoice == ""){
                                                        		alert("주문번호 ["+orderNo+"]의 송장 번호를 기입해주세요");
                                                        		return;
                                                        	}
                                                        	updateData += orderNo+"/"+deliveryComp+"/"+invoice;
                                                        	updateData += ",";
                                                        	
                                                        }
                                                    }
                                                    if(count==0){
                                                        console.log("체크 아무것도 안됨");
                                                        alert("최소 1개 이상의 주문 내역을 선택해주세요.");
                                                        return;
                                                    }
                                                    console.log("여기까지 도달하면 체크 한개 이상 된 것.");
                                                    // 여기 밑에 로직 적기
                                                    updateData = updateData.replace(/,$/, "");
                                                    console.log(updateData);
                                                    
                                                    location.assign("${path}/admin/updateInvoice.do?updateData="+updateData);
                                                    
                                                    
                                                });
                                                //배송 상태 변경 하는 로직
                                                let status = "";
                                                
                                                $(".dropdown-item").click(e=>{
                                                	console.log(e.target.innerText);
                                                	status = e.target.innerText;
                                                	console.log("status : "+status)
                                                	let i = 0;
                                                    let count = 0;
                                                	for(i=0; i<rowChk.length; i++) {
                                                        if(rowChk[i].checked){
                                                            console.log("체크 됨");
                                                            count++;
                                                            console.log("orderNo : "+rowChk[i].parentNode.parentNode.childNodes[2].childNodes[0].data);
                                                        	orderNo = rowChk[i].parentNode.parentNode.childNodes[2].childNodes[0].data;
                                                        	updateData += orderNo+"/"+status;
                                                        	updateData += ",";
                                                        	
                                                        }
                                                    }
                                                    if(count==0){
                                                        console.log("체크 아무것도 안됨");
                                                        alert("최소 1개 이상의 주문 내역을 선택해주세요.");
                                                        return;
                                                    }
                                                    console.log("여기까지 도달하면 체크 한개 이상 된 것.");
                                                    // 여기 밑에 로직 적기
                                                    updateData = updateData.replace(/,$/, "");
                                                    console.log(updateData);
                                                    
                                                    location.assign("${path}/admin/updateStatus.do?updateData="+updateData);
                                                })
                                                //===========================================================
                                                //allChk 로직
                                                $(".allChk").click(e=>{
                                                    if($(".allChk").is(":checked")){
                                                        $(".rowChk_orderNo").prop("checked", true);
                                                    }else{
                                                        $(".rowChk_orderNo").prop("checked", false);
                                                    }
                                                });

                                                $(".rowChk_orderNo").click(e=>{
                                                    let total = $(".rowChk_orderNo").length;
                                                    let checked = $(".rowChk_orderNo:checked").length;

                                                    if(total != checked){
                                                        $(".allChk").prop("checked",false);
                                                    }else{
                                                        $(".allChk").prop("checked",true);
                                                    }
                                                    
                                                });
                                                //===========================================================
                                                
                                                
                                            });
                                        </script>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </main>

<script>
window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple,{
            "columns": [
                { select:[0,1,2,3,4,5,6] , sortable:false},
                { select: 5, type: "number"},
                { select: 1, type: "date", format: "YY/MM/DD"}
            ],
            fixedColumns : false,
            labels: {
                placeholder: "검색",
                perPage: "{select}개씩 보기",
                noRows: "검색 결과가 없습니다.",
                noResults: "검색 결과가 없습니다.",
                info: "[총 <span style='color: red;'>{rows}</span>개]"
            },
            perPage : 10,
            perPageSelect : [5, 10, 15, 30, 50],
            layout: {
                top: "{info}{select}",
                bottom: "{pager}"
            },
            search: {
                "search" : "가"
            }
        });
    }
});
</script>
<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"/>
