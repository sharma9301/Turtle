<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp"/>
<main>
                    <div class="container-fluid w-100">
                        <form class="form" style="margin: 50px auto 50px auto;">
                            <div class="container">
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
                                                <select class="form-select me-2" id="searchType" name="searchType" style="width: 120px;">
                                                    <option value="orderNo">주문 번호</option>
                                                    <option value="invoiceNo">운송장 번호</option>
                                                    <option value="divider" disabled>---------------</option>
                                                    <option value="userId">주문자 아이디</option>
                                                    <option value="userName">주문자 이름</option>
                                                    <option value="userEmail">주문자 이메일</option>
                                                    <option value="userPhone">주문자 연락처</option>
                                                    <option value="divider" disabled>---------------</option>
                                                    <option value="receiverName">수령자 이름</option>
                                                    <option value="receiverPhone">수령자 연락처</option>
                                                    <option value="receiverAddress">수령자 주소</option>

                                                </select>
                                                <div id="search-orderNo">
                                                    <input type="hidden" name="searchType" value="orderNo">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'orderNo'?keyword:''}"
                                                    placeholder="주문 번호를 입력하세요">
                                                </div>
                                                <div id="search-invoiceNo">
                                                    <input type="hidden" name="searchType" value="invoiceNo">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'invoiceNo'?keyword:''}"
                                                    placeholder="운송장 번호를 입력하세요">
                                                </div>
                                                <div id="search-userId">
                                                    <input type="hidden" name="searchType" value="userId">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'userId'?keyword:''}"
                                                    placeholder="주문자 아이디를 입력하세요">
                                                </div>
                                                <div id="search-userName">
                                                    <input type="hidden" name="searchType" value="userName">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'userName'?keyword:''}"
                                                    placeholder="주문자 이름을 입력하세요">
                                                </div>
                                                <div id="search-userEmail">
                                                    <input type="hidden" name="searchType" value="userEmail">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'userEmail'?keyword:''}"
                                                    placeholder="주문자 이메일을 입력하세요">
                                                </div>
                                                <div id="search-userPhone">
                                                    <input type="hidden" name="searchType" value="userPhone">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'userPhone'?keyword:''}"
                                                    placeholder="주문자 연락처를 입력하세요">
                                                </div>
                                                <div id="search-receiverName">
                                                    <input type="hidden" name="searchType" value="receiverName">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'receiverName'?keyword:''}"
                                                    placeholder="수령자 이름을 입력하세요">
                                                </div>
                                                <div id="search-receiverPhone">
                                                    <input type="hidden" name="searchType" value="receiverPhone">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'receiverPhone'?keyword:''}"
                                                    placeholder="수령자 연락처를 입력하세요">
                                                </div>
                                                <div id="search-receiverAddress">
                                                    <input type="hidden" name="searchType" value="receiverAddress">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'receiverAddress'?keyword:''}"
                                                    placeholder="수령자 주소를 입력하세요">
                                                </div>
                                            </div>
                                            <script>
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
                                        <th class="table-active">기간</th>
                                        <td>
                                            <div class="btn-group btn-group-sm" role="group">
                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDateToday" checked>
                                                <label class="btn btn-outline-secondary" for="enrollDateToday">오늘</label>
                                                
                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDateYesterday" checked>
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

                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDateAll">
                                                <label class="btn btn-outline-secondary" for="enrollDateAll">전체</label>

                                                <input type="date" name="fromDate" id="fromDate" class="form-control ms-2" style="width: 160px;"/>
                                                <span>&nbsp;~&nbsp;</span> 
                                                <input type="date" name="toDate" id="toDate" class="form-control" style="width: 160px;"/>

                                            </div>
                                            
                                            <script>
                                                var d= new Date();
                                                
                                                var kor_date = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString();
                                                document.getElementById('fromDate').value = kor_date.substring(0, 10);
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
                                                        case "전체": break;

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
                    <div class="container-fluid mb-5" style="width: 90%;">
                        <style>
                            td{
                                vertical-align: middle;
                            }
                        </style>
                        <table id="datatablesSimple" class="table table-hover table-bordered">
                            <thead>
                                <tr style="background-color: darkgray;">
                                    <th scope="col" style="width: 0px;"><input type="checkbox" class="allChk"></th>
                                    <th scope="col" class="orderDate">주문일</th>
                                    <th scope="col" class="orderNo">주문번호</th>
                                    <th scope="col" class="user">주문자</th>
                                    <th scope="col" class="productName">상품명</th>
                                    <th scope="col" class="paymentTotalPrice">총결제금액</th>
                                    <th scope="col" class="paymentMethod">결제수단</th>
                                    <th scope="col" class="deliveryCompany">택배사</th>
                                    <th scope="col" class="invoiceNo">송장번호</th>
                                    <th scope="col" class="undelivered">미배송</th>
                                    <th scope="col" class="shipping">배송중</th>
                                    <th scope="col" class="deliveryCompleted">배송완료</th>
                                    <th scope="col" class="orderCancel">취소</th>
                                    <th scope="col" class="orderRefund">환불</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_productNo" name="rowChk_productNo"></td>
                                    <td scope="col" class="orderDate">22/01/03</td>
                                    <td scope="col" class="orderNo">220103_0001</td>
                                    <td scope="col" class="user">user00<br>(유저공공)</td>
                                    <td scope="col" class="productName">Golden earings 외 1</td>
                                    <td scope="col" class="paymentTotalPrice">134,000</td>
                                    <td scope="col" class="paymentMethod">카드</td>
                                    <td scope="col" class="deliveryCompany">로젠택배</td>
                                    <td scope="col" class="invoiceNo">
                                        1111111111111
                                    </td>
                                    <td scope="col" class="undelivered">0</td>
                                    <td scope="col" class="shipping">0</td>
                                    <td scope="col" class="deliveryCompleted">1</td>
                                    <td scope="col" class="orderCancel">0</td>
                                    <td scope="col" class="orderRefund">0</td>
                                </tr>
                                <tr>
                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_productNo" name="rowChk_productNo"></td>
                                    <td scope="col" class="orderDate">22/01/03</td>
                                    <td scope="col" class="orderNo">220103_0002</td>
                                    <td scope="col" class="user">user01<br>(유저공일)</td>
                                    <td scope="col" class="productName">커플용 반지 외 2</td>
                                    <td scope="col" class="paymentTotalPrice">300,000</td>
                                    <td scope="col" class="paymentMethod">네이버페이</td>
                                    <td scope="col" class="deliveryCompany">롯데택배</td>
                                    <td scope="col" class="invoiceNo">
                                        2222222222222
                                    </td>
                                    <td scope="col" class="undelivered">0</td>
                                    <td scope="col" class="shipping">0</td>
                                    <td scope="col" class="deliveryCompleted">1</td>
                                    <td scope="col" class="orderCancel">0</td>
                                    <td scope="col" class="orderRefund">0</td>
                                </tr>
                                <tr>
                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_productNo" name="rowChk_productNo"></td>
                                    <td scope="col" class="orderDate">22/01/04</td>
                                    <td scope="col" class="orderNo">220104_0001</td>
                                    <td scope="col" class="user">user00<br>(유저공공)</td>
                                    <td scope="col" class="productName">커플용 목걸이</td>
                                    <td scope="col" class="paymentTotalPrice">90,000</td>
                                    <td scope="col" class="paymentMethod">네이버페이</td>
                                    <td scope="col" class="deliveryCompany">우체국 택배</td>
                                    <td scope="col" class="invoiceNo">
                                        3333333333333
                                    </td>
                                    <td scope="col" class="undelivered">0</td>
                                    <td scope="col" class="shipping">0</td>
                                    <td scope="col" class="deliveryCompleted">1</td>
                                    <td scope="col" class="orderCancel">0</td>
                                    <td scope="col" class="orderRefund">0</td>
                                </tr>
                                <tr>
                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_productNo" name="rowChk_productNo"></td>
                                    <td scope="col" class="orderDate">22/01/24</td>
                                    <td scope="col" class="orderNo">220124_0001</td>
                                    <td scope="col" class="user">user00<br>(유저공공)</td>
                                    <td scope="col" class="productName">Golden earings 외 3</td>
                                    <td scope="col" class="paymentTotalPrice">350,000</td>
                                    <td scope="col" class="paymentMethod">카카오페이</td>
                                    <td scope="col" class="deliveryCompany">
                                        <select class="form-select-sm" name="deliveryCompany" id="deliveryCompany">
                                            <option value="kr.epost">우체국 택배</option>
                                            <option value="kr.cjlogistics">CJ대한통운</option>
                                            <option value="kr.hanjin">한진택배</option>
                                            <option value="kr.logen">로젠택배</option>
                                            <option value="kr.lotte">롯데택배</option>
                                        </select>
                                    </td>
                                    <td scope="col" class="invoiceNo">
                                        <input type="text" name="invoice" id="invoice" size="15" maxlength="13">
                                    </td>
                                    <td scope="col" class="undelivered">1</td>
                                    <td scope="col" class="shipping">0</td>
                                    <td scope="col" class="deliveryCompleted">0</td>
                                    <td scope="col" class="orderCancel">0</td>
                                    <td scope="col" class="orderRefund">0</td>
                                </tr>
                                
                            </tbody>
                        </table>
                        <table class="table table-borderless">
                            <tr>
                                <td colspan="11">
                                    <div style="text-align: left;">
                                        <button class="btn btn-secondary insertInvoice" onclick="">송장 번호 저장</button>
                                        <div class="btn-group">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                            배송 상태 변경
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <li><a class="dropdown-item" href="#">미배송</a></li>
                                            <li><a class="dropdown-item" href="#">배송중</a></li>
                                            <li><a class="dropdown-item" href="#">배송완료</a></li>
                                            </ul>
                                        </div>
                                        <div class="btn-group" style="float: right;">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                            취소/환불
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <li><a class="dropdown-item" href="#">취소</a></li>
                                            <li><a class="dropdown-item" href="#">환불</a></li>
                                            </ul>
                                        </div>
                                        <script>
                                            $(()=>{
                                                //최소 한개 이상 클릭 안하면 온클릭 작동 못하게 하는 로직
                                                let rowChk = document.getElementsByClassName("rowChk_productNo");
                                                console.log(rowChk);
                                                $(".dropdown-item").click(e=>{
                                                    let i = 0;
                                                    let count = 0;
                                                    for(i=0; i<rowChk.length; i++) {
                                                        if(rowChk[i].checked){
                                                            count++;
                                                        }
                                                    }
                                                    if(count==0){
                                                        alert("최소 1개 이상의 상품을 선택해주세요.");
                                                        return;
                                                    }
                                                    console.log("여기까지 도달하면 체크 한개 이상 된 것.");
                                                    // 여기 밑에 로직 적기
                                                    
                                                });
                                                //===========================================================
                                                //allChk 로직
                                                $(".allChk").click(e=>{
                                                    if($(".allChk").is(":checked")){
                                                        $(".rowChk_productNo").prop("checked", true);
                                                    }else{
                                                        $(".rowChk_productNo").prop("checked", false);
                                                    }
                                                });

                                                $(".rowChk_productNo").click(e=>{
                                                    let total = $(".rowChk_productNo").length;
                                                    let checked = $(".rowChk_productNo:checked").length;

                                                    if(total != checked){
                                                        $(".allChk").prop("checked",false);
                                                    }else{
                                                        $(".allChk").prop("checked",true);
                                                    }
                                                    
                                                });
                                                //===========================================================
                                                //송장 번호 입력 모두 누락시 버튼 클릭 안되게 막기
                                                $(".insertInvoice").click(e=>{
                                                    let i = 0;
                                                    let count = 0;
                                                    console.log($("td>input[name=invoice]")[0].value);
                                                    for(i=0; i<$("td>input[name=invoice]").length; i++) {
                                                        if($("td>input[name=invoice]")[i].value!=""){
                                                            count++;
                                                        }
                                                    }
                                                    if(count==0){
                                                        alert("최소 1개 이상의 송장번호를 입력하세요.");
                                                        return;
                                                    }

                                                });
                                                
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
