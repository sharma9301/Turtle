<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp"/>
<main>
                    <div class="container-fluid w-75">
                        <form class="form" style="margin: 50px auto 50px auto;" action="${path }/admin/searchProduct" method="get">
                            <div class="container">
                                <h1 class="mt-4 mb-4">상품 목록</h1>
                                <style>
                                    th{
                                        width: 150px;
                                    }
                                </style>
                                <table class="table align-middle">
                                    <tr>
                                        <th class="table-active">검색 분류</th>
                                        <td>
                                            <div id="searchTypeDiv" style="display: flex;">
                                                <select class="form-select me-2" id="searchType" name="searchType" style="width: 120px;">
                                                    <option value="pd_Name">상품명</option>
                                                    <option value="pd_Code">상품코드</option>
                                                </select>
                                                <div id="search-pd_Name">
                                                    <input type="hidden" name="searchType" value="pd_Name">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'pd_Name'?keyword:''}"
                                                    placeholder="상품명을 입력하세요">
                                                </div>
                                                <div id="search-pd_Code">
                                                    <input type="hidden" name="searchType" value="pd_Code">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'pd_Code'?keyword:''}"
                                                    placeholder="상품코드를 입력하세요">
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
                                                <input type="radio" class="btn-check btn-sm" name="enrollDate" id="enrollDateToday" checked>
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
                                                        case "3일": newDate.setDate(newDate.getDate()-3); break;
                                                        case "7일": newDate.setDate(newDate.getDate()-7); break;
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
                                    <th scope="col" style="width: 0px;"><input type="checkbox" class="allRowChk"></th>
                                    <th scope="col">상품 이미지</th>
                                    <th scope="col">상품 번호</th>
                                    <th scope="col">상품명</th>
                                    <th scope="col">상품 가격</th>
                                    <th scope="col">할인 유무</th>
                                    <th scope="col">할인율</th>
                                    <th scope="col">판매가</th>
                                    <th scope="col">진열 유무</th>
                                    <th scope="col">상품 분류</th>
                                    <th scope="col">상품 등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_productNo" name="rowChk_productNo"></td>
                                    <td scope="col">
                                    	<img src="https://dummyimage.com/100x100/dee2e6/6c757d.jpg" id="pd_image" name="pd_image" width="100px" height="100px" alt="상품 이미지">
                                    	<input type="file" id="pd_imageFile" name="pd_imageFile" accept="images/*" style="display:none">
                                    </td>
                                    <td scope="col">ring-001</td>
                                    <td scope="col">커플용 반지</td>
                                    <td scope="col">
                                    	<input type="text" class="form-control" name="price" id="price" maxlength="11" value="10,000" min="0" style="text-align: center" onkeyup="inputNumberFormat(this); discountPrice();">
                                    </td>
                                    <td scope="col">
                                    	<select class="form-select" name="pdIsDiscount" id="pdIsDiscount" style="width:100px; margin:0 auto;">
                                    		<option value="Y">예</option>
                                    		<option value="N">아니오</option>
                                    	</select>
                                    </td>
                                    <td scope="col">
                                    	<input type="number" name="pdDiscountRate" id="pdDiscountRate" class="form-control-sm" style="width: 70px" min="0" max="100" value="10" onchange="discountPrice();">%
                                   	</td>
                                    <td scope="col">
                                        <input type="text" class="form-control" name="discountPrice" id="discountPrice" maxlength="11" style="text-align: center" readonly>
                                    </td>
                                    <td scope="col">
                                    	<select class="form-select" name="pdIsDisplay" id="pdIsDisplay" style="width:100px; margin:0 auto;">
                                    		<option value="Y">예</option>
                                    		<option value="N">아니오</option>
                                    	</select>
                                    </td>
                                    <td scope="col">반지</td>
                                    <td scope="col">22/01/03</td>
                                </tr>
                                
                            </tbody>
                        </table>
                        <table class="table table-borderless">
                            <tr>
                                <td colspan="11">
                                    <div style="text-align: left;">
                                        
                                        <button class="btn btn-secondary updateProduct" onclick="">정보 수정</button>
                                        <div style="float: right;">
	                                        <button class="btn btn-secondary" onclick="location.assign('productEnroll.html');">상품 등록</button>
	                                        <button class="btn btn-secondary deleteProduct" onclick="">상품 삭제</button>
                                        </div>
                                        <script>
                                            $(()=>{
                                            	//초기 할인율 적용되서 값 넣어주는 로직
                                            	let price = $("#price").val(); //정상가
                                                let realPrice = price.replace(/,/g,"");
                                                console.log("정상가 : " + price);
                                                console.log("정상가(문자 제거) : " + realPrice);
                                                let discountRate = $("#pdDiscountRate").val(); //할인율
                                                console.log("할인율 : " + discountRate);
                                                let result="";
                                                result = realPrice-(realPrice*discountRate/100);                                                
                                                console.log("할인가 : " + result);
                                                
                                                $("#discountPrice").attr("value",result);
                                             	//===========================================================
                                                //최소 한개 이상 클릭 안하면 온클릭 작동 못하게 하는 로직
                                                let rowChk = document.getElementsByClassName("rowChk_productNo");
                                                console.log(rowChk);
                                                $(".dropdown-item,.updateProduct").click(e=>{
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
                                                //allRowChk 로직
                                                $(".allRowChk").click(e=>{
                                                    if($(".allRowChk").is(":checked")){
                                                        $(".rowChk_productNo").prop("checked", true);
                                                    }else{
                                                        $(".rowChk_productNo").prop("checked", false);
                                                    }
                                                });
                                                $(".rowChk_productNo").click(e=>{
                                                    let total = $(".rowChk_productNo").length;
                                                    let checked = $(".rowChk_productNo:checked").length;

                                                    if(total != checked){
                                                        $(".allRowChk").prop("checked",false);
                                                    }else{
                                                        $(".allRowChk").prop("checked",true);
                                                    }
                                                });
                                              //===========================================================
                                              	//이미지 미리보기 로직
        									    $("#pd_image").click(e=>{
        											$("input[name=pd_imageFile]").click();
        										})
        									
        										$("input[name=pd_imageFile]").change(e=>{
        											
        											console.dir(e.target);
        											if(e.target.files[0].type.includes("image")){
        												let reader=new FileReader();
        												reader.onload=(e)=>{
        													const img=$("<img>").attr({
        														src:e.target.result,
        														width:"100px",
        														height:"100px"
        													});
        													$("#pd_image").attr("src",e.target.result);
        												}
        												reader.readAsDataURL(e.target.files[0]);
        											}
        											
        										});
                                                
                                            });
                                        //===========================================================
                                        //숫자에 콤마 붙이는 스크립트
                                        //콤마 붙이는 스크립트
                                        function comma(str) {
							      			str = String(str);
								      		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
										}
										//콤마 떼는 스크립트
									    function uncomma(str) {
									        str = String(str);
									        return str.replace(/[^\d]+/g, '');
									    } 
									    //숫자만 사용할 수 있는 스크립트 (+콤마)
									    function inputNumberFormat(obj) {
									        obj.value = comma(uncomma(obj.value));
									    }
									    //숫자만 사용할 수 있는 스크립트 (콤마 X)
									    function inputOnlyNumberFormat(obj) {
									        obj.value = onlynumber(uncomma(obj.value));
									    }
									    
									    function onlynumber(str) {
										    str = String(str);
										    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
										}
									  	//===========================================================
                                      	//자동으로 할인액 변경되는 스크립트
									    function discountPrice() {
                                                let price = $("#price").val(); //정상가
                                                let realPrice = price.replace(/,/g,"");
                                                console.log("정상가 : " + price);
                                                console.log("정상가(문자 제거) : " + realPrice);
                                                let discountRate = $("#pdDiscountRate").val(); //할인율
                                                console.log("할인율 : " + discountRate);
                                                let result="";
                                                result = realPrice-(realPrice*discountRate/100);
                                                console.log("할인가 : " + result);
                                                
                                                $("#discountPrice").attr("value",result);
                                                
								        }
									  	
									  
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
                { select:[0,1,2,8] , sortable:false},
                { select: 4, type: "number"},
                { select: 10, type: "date", format: "YY/MM/DD"}
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
