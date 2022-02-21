<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp"/>
<main>
                    <div class="container-fluid w-100">
                        <form class="form" style="margin: 50px auto 50px auto;" action="${path }/admin/searchProductOpt.do" method="get">
                            <div class="container">
                            	<input type="hidden" class="updateData" id="updateData" name="updateData">
                            	<input type="hidden" class="deleteData" id="deleteData" name="deleteData">
                                <h1 class="mt-4 mb-4">재고 관리</h1>
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
                                                    <option value="pd_Name">상품명</option>
                                                    <option value="pd_Code">상품코드</option>
                                                    <option value="opt_No">옵션코드</option>
                                                </select>
                                                <div id="search-pd_Name">
                                                    <input type="hidden" name="searchType" value="productName">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'pd_Name'?keyword:''}"
                                                    placeholder="상품명을 입력하세요">
                                                </div>
                                                <div id="search-pd_Code">
                                                    <input type="hidden" name="searchType" value="productCode">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'pd_Code'?keyword:''}"
                                                    placeholder="상품코드를 입력하세요">
                                                </div>
                                                <div id="search-opt_No">
                                                    <input type="hidden" name="searchType" value="optCode">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'opt_No'?keyword:''}"
                                                    placeholder="옵션코드를 입력하세요">
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
                                        <th class="table-active">상품 분류</th>
                                        <td>
                                            <div id="searchTypeDiv" style="display: flex;">
                                                <select class="form-select me-2" id="category_code" name="category_code" style="width: 120px;">
                                                    <option selected value="">분류 선택</option>
                                                    <option value="ring">반지</option>
                                                    <option value="brac">팔찌</option>
                                                    <option value="neck">목걸이</option>
                                                    <option value="earr">귀걸이</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="table-active">상품 등록일</th>
                                        <td>
                                            <div class="btn-group btn-group-sm" role="group">
                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDateToday">
                                                <label class="btn btn-outline-secondary" for="enrollDateToday">오늘</label>
                                            
                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDate3day">
                                                <label class="btn btn-outline-secondary" for="enrollDate3day">3일</label>
                                            
                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDate7day">
                                                <label class="btn btn-outline-secondary" for="enrollDate7day">7일</label>

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

                                                <input type="date" name="fromDate" id="fromDate" class="form-control ms-2" value="2022-01-01"  style="width: 160px;"/>
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
                                                        case "3일": newDate.setDate(newDate.getDate()-3); break;
                                                        case "7일": newDate.setDate(newDate.getDate()-7); break;
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
                                    <th scope="col" class="productImage">상품 이미지</th>
                                    <th scope="col" class="productNo">삼품코드</th>
                                    <th scope="col" class="optCode">옵션코드</th>
                                    <th scope="col" class="productName">상품명</th>
                                    <th scope="col" class="productPrice">상품 가격</th>
                                    <th scope="col" class="size">사이즈</th>
                                    <th scope="col" class="stock">재고</th>
                                    <th scope="col" class="productDate">상품 등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${productOptList }" var="productOpt">
                                	
	                                <tr>
	                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_optCode" name="rowChk_optCode"></td>
	                                    <td scope="col"><img src="${path }/resources/images/product/${productOpt.pdCode.pdImage }"  alt="상품 이미지" width="100px" height="100px"></td>
	                                    <td scope="col" class="productNo">${productOpt.pdCode.pdCode }</td>
	                                    <td scope="col" class="optCode">${productOpt.optNo }</td>
	                                    <td scope="col" class="productName">${productOpt.pdCode.pdName }</td>
	                                    <td scope="col" class="productPrice">${productOpt.pdCode.pdPrice }</td>
	                                    <c:if test="${productOpt.size == 0}">
	                                    	<td scope="col" class="size">FREE</td>
	                                    </c:if>
	                                    <c:if test="${productOpt.size != 0}">
	                                    	<td scope="col" class="size">${productOpt.size }</td>
	                                    </c:if>
	                                    <td scope="col" class="stock">
	                                        <input type="number" class="form-control-sm" value="${productOpt.stock }" style="width: 70px;">
	                                    </td>
	                                    <td scope="col" class="productDate">${productOpt.pdCode.pdDate }</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <table class="table table-borderless">
                            <tr>
                                <td colspan="11">
                                    <div style="text-align: left;">
                                        <button class="btn btn-secondary updateStock" onclick="">재고 변경</button>
                                        <button class="btn btn-secondary deleteStock" onclick="" style="float: right;">사이즈 삭제</button>
                                        
                                        <script>
                                            $(()=>{
                                            	//최소 한개 이상 클릭 안하면 온클릭 작동 못하게 하는 로직 + 값 넣어주는 로직(재고 변경)
                                                let rowChk = document.getElementsByClassName("rowChk_optCode");
                                                console.log(rowChk);
                                                let stock = "";
                                                let optNo = "";
                                                let updateData = "";
                                                let deleteData = "";
                                                
                                                $(".updateStock").click(e=>{
                                                    let i = 0;
                                                    let count = 0;
                                                    updateData = "";
                                                    for(i=0; i<rowChk.length; i++) {
                                                        if(rowChk[i].checked){
                                                            count++;
                                                            console.log("stock : "+rowChk[i].parentNode.parentNode.childNodes[7].childNodes[1].value);
                                                        	stock = rowChk[i].parentNode.parentNode.childNodes[7].childNodes[1].value;
                                                        	console.log(rowChk[i].parentNode.parentNode.childNodes[3].childNodes[0].data);
                                                        	optNo = rowChk[i].parentNode.parentNode.childNodes[3].childNodes[0].data;
                                                        	updateData += optNo+"/"+stock;
                                                        	updateData += ",";
                                                        }
                                                        
                                                    }
                                                    if(count==0){
                                                        alert("최소 1개 이상의 상품을 선택해주세요.");
                                                        return;
                                                    }
                                                    console.log("여기까지 도달하면 체크 한개 이상 된 것.");
                                                    // 여기 밑에 로직 적기
                                                    updateData = updateData.replace(/,$/, '');
                                                    console.log(updateData);
                                                    $("#updateData").attr("value",updateData);
                                                    location.assign("${path}/admin/updateStock.do?updateData="+updateData);
                                                });
                                              //최소 한개 이상 클릭 안하면 온클릭 작동 못하게 하는 로직 + 값 넣어주는 로직(삭제)
                                              $(".deleteStock").click(e=>{
                                                    let i = 0;
                                                    let count = 0;
                                                    deleteData = "";
                                                    for(i=0; i<rowChk.length; i++) {
                                                        if(rowChk[i].checked){
                                                            count++;
                                                            console.log(rowChk[i].parentNode.parentNode.childNodes[3].childNodes[0].data);
                                                            optNo = rowChk[i].parentNode.parentNode.childNodes[3].childNodes[0].data;
                                                            deleteData += optNo+",";
                                                        }
                                                        
                                                    }
                                                    if(count==0){
                                                        alert("최소 1개 이상의 상품을 선택해주세요.");
                                                        return;
                                                    }
                                                    console.log("여기까지 도달하면 체크 한개 이상 된 것.");
                                                    // 여기 밑에 로직 적기
                                                    deleteData = deleteData.replace(/,$/, '');
                                                    console.log(deleteData);
                                                    $("#deleteData").attr("value",deleteData);
                                                    location.assign("${path}/admin/deleteProductOption.do?deleteData="+deleteData);
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
                { select:[0,1,5,7] , sortable:false},
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
