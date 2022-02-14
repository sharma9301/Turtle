<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp"/>
<main>
                    <div class="container-fluid w-100">
                        <form class="form" style="margin: 50px auto 50px auto;" action="${path }/admin/searchProduct.do" method="get">
                            <div class="container">
                            	<input type="hidden" class="productCount" id="productCount" name="productCount" value="${productCount}">
                            	<input type="hidden" class="updateData" id="updateData" name="updateData">
                            	<input type="hidden" class="deleteData" id="deleteData" name="deleteData">
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
                                            $("#searchTypeDiv>div[id^=search]").css("display","none"); //처음 로딩할 때 css로 안보이게 먼저 설정	
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
                                                        case "오늘": new Date(d.getTime() - (d.getTimezoneOffset() * 60000)); break;
                                                        case "3일": newDate.setDate(newDate.getDate()-3); break;
                                                        case "7일": newDate.setDate(newDate.getDate()-7); break;
                                                        case "1개월": newDate.setMonth(newDate.getMonth()-1); break;
                                                        case "3개월": newDate.setMonth(newDate.getMonth()-3); break;
                                                        case "6개월": newDate.setMonth(newDate.getMonth()-6); break;
                                                        case "1년": newDate.setFullYear(newDate.getFullYear()-1); break;
                                                        case "전체": newDate.setFullYear(2022);
                                                       		newDate.setMonth(0);
                                                        	newDate.setDate(1);
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
                            	<c:forEach items="${productList }" var="product">
	                                <tr>
	                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_productNo" name="rowChk_productNo"></td>
	                                    <td scope="col">
	                                    	<img src="${path }/resources/images/product/${product.pdImage}" class="pd_image" id="pd_image" name="pd_image" width="100px" height="100px" alt="상품 이미지">
	                                    	<input type="file" class="pd_imageFile" id="pd_imageFile" name="pd_imageFile" accept="images/*" style="display:none">
	                                    	<input type="hidden" class="pd_imageFileName" id="pd_imageFileName" name="pd_imageFileName" value="${product.pdImage}">
	                                    </td>
	                                    <td scope="col">${product.pdCode }</td>
	                                    <td scope="col">${product.pdName }</td>
	                                    <td scope="col">
	                                    	<input type="text" class="form-control price" name="price" id="price" maxlength="11" value="<fmt:formatNumber value="${product.pdPrice }" type="number"/>" min="0" style="text-align: center">
	                                    </td>
	                                    <td scope="col">
	                                    	<select class="form-select" name="pdIsDiscount" id="pdIsDiscount" style="width:100px; margin:0 auto;">
	                                    		<option value="Y" ${fn:contains(product.pdIsDiscount,'Y')?'selected':'' }>예</option>
	                                    		<option value="N" ${fn:contains(product.pdIsDiscount,'N')?'selected':'' }>아니오</option>
	                                    	</select>
	                                    </td>
	                                    <td scope="col">
	                                    	<input type="number" name="pdDiscountRate" id="pdDiscountRate" class="form-control-sm pdDiscountRate" style="width: 70px" min="0" max="100" value="<fmt:formatNumber value="${product.pdDiscountrate }" type="number"/>">%
	                                   	</td>
	                                    <td scope="col">
	                                    	<input type="text" class="form-control discountPrice" name="discountPrice" id="discountPrice" value="<fmt:formatNumber value="${product.pdPrice-(product.pdPrice*product.pdDiscountrate/100) }" type="number"/>" maxlength="11" style="text-align: center">
	                                    </td>
	                                    <td scope="col">
	                                    	<select class="form-select pdIsDisplay" name="pdIsDisplay" id="pdIsDisplay" style="width:100px; margin:0 auto;">
	                                    		<option value="Y" ${fn:contains(product.pdIsDisplay,'Y')?'selected':'' }>예</option>
	                                    		<option value="N" ${fn:contains(product.pdIsDisplay,'N')?'selected':'' }>아니오</option>
	                                    	</select>
	                                    </td>
	                                    <c:choose>
	                                    	<c:when test="${product.categoryCode.categoryCode=='brac' }">
	                                    		<td scope="col">팔찌</td>
	                                    	</c:when>
	                                    	<c:when test="${product.categoryCode.categoryCode=='earr' }">
	                                    		<td scope="col">귀걸이</td>
	                                    	</c:when>
	                                    	<c:when test="${product.categoryCode.categoryCode=='neck' }">
	                                    		<td scope="col">목걸이</td>
	                                    	</c:when>
	                                    	<c:when test="${product.categoryCode.categoryCode=='ring' }">
	                                    		<td scope="col">반지</td>
	                                    	</c:when>
	                                    </c:choose>
	                                    <td scope="col">${product.pdDate}</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <table class="table table-borderless">
                            <tr>
                                <td colspan="11">
                                    <div style="text-align: left;">
                                        
                                        <button class="btn btn-secondary updateProduct">정보 수정</button>
                                        <div style="float: right;">
	                                        <button class="btn btn-secondary" onclick="location.assign('${path}/admin/productEnroll');">상품 등록</button>
	                                        <button class="btn btn-secondary deleteProduct" onclick="">상품 삭제</button>
                                        </div>
                                        <script>
                                            $(()=>{
                                            	
                                             	//===========================================================
                                                //최소 한개 이상 클릭 안하면 온클릭 작동 못하게 하는 로직 + 값 넣어주는 로직(정보 수정)
                                                let rowChk = document.getElementsByClassName("rowChk_productNo");
                                                console.log(rowChk);
                                                let pdCode = "";
                                                let pdImage = "";
                                                let pdPrice= "";
                                                let pdIsDiscount= "";
                                                let pdDiscountrate= "";
                                                let pdDisplay= "";
                                                let totalData = "";
                                                let pdImageFile="";
                                                $(".updateProduct").click(e=>{
                                                    let i = 0;
                                                    let count = 0;
                                                    totalData="";
                                                    for(i=0; i<rowChk.length; i++) {
                                                        if(rowChk[i].checked){
                                                            count++;
                                                            
                                                            console.log(rowChk[i].parentNode.parentNode.childNodes[2].childNodes[0].data);
                                                            console.log("pd_code : "+rowChk[i].parentNode.parentNode.childNodes[2].childNodes[0].data);
                                                            pdCode = rowChk[i].parentNode.parentNode.childNodes[2].childNodes[0].data;
                                                            
                                                            console.log(rowChk[i].parentNode.parentNode.childNodes[1].childNodes[3].files[0]);                                                            
                                                            pdImageFile = rowChk[i].parentNode.parentNode.childNodes[1].childNodes[3].files[0];
                                                            
                                                            
                                                            
                                                            console.log(pdImageFile);
                                                            console.log(rowChk[i].parentNode.parentNode.childNodes[1].childNodes[5].value);
															pdImage = rowChk[i].parentNode.parentNode.childNodes[1].childNodes[5].value.replace(/\n|\r/g, "");
															console.log("pdImage : "+pdImage);
                                                        	console.log("pdPrice : "+rowChk[i].parentNode.parentNode.childNodes[4].childNodes[1].value);
                                                        	pdPrice = rowChk[i].parentNode.parentNode.childNodes[4].childNodes[1].value;
                                                        	pdPrice = pdPrice.replace(/[^0-9]/g,"");
                                                        	console.log("pdPrice(콤마 제거) : "+pdPrice);
                                                        	if(rowChk[i].parentNode.parentNode.childNodes[5].childNodes[1][0].selected==true){
                                                        		pdIsDiscount = rowChk[i].parentNode.parentNode.childNodes[5].childNodes[1][0].value;
                                                        		console.log("pdIsDiscount : "+rowChk[i].parentNode.parentNode.childNodes[5].childNodes[1][0].value);
                                                        		pdDiscountrate = rowChk[i].parentNode.parentNode.childNodes[6].childNodes[1].value;
                                                        		console.log("pdDiscountrate : "+rowChk[i].parentNode.parentNode.childNodes[6].childNodes[1].value);
                                                        	}else{
                                                        		pdIsDiscount = rowChk[i].parentNode.parentNode.childNodes[5].childNodes[1][1].value;
                                                        		console.log("pdIsDiscount : "+rowChk[i].parentNode.parentNode.childNodes[5].childNodes[1][1].value);
                                                        		pdDiscountrate = 0;
                                                        		console.log("pdDiscountrate : "+pdDiscountrate);
                                                        	}
                                                        	
                                                        	if(rowChk[i].parentNode.parentNode.childNodes[8].childNodes[1][0].selected==true){
                                                        		pdDisplay = rowChk[i].parentNode.parentNode.childNodes[8].childNodes[1][0].value;
                                                        		console.log("pdDisplay : "+rowChk[i].parentNode.parentNode.childNodes[8].childNodes[1][0].value);
                                                        	}else{
                                                        		pdDisplay = rowChk[i].parentNode.parentNode.childNodes[8].childNodes[1][1].value;
                                                        		console.log("pdDisplay : "+rowChk[i].parentNode.parentNode.childNodes[8].childNodes[1][1].value);
                                                        	}
                                                        	totalData += pdCode + "/" + pdPrice + "/"  + pdIsDiscount + "/"  + pdDiscountrate + "/"  + pdDisplay;
                                                        	totalData += ",";
                                                        }
                                                        
                                                    }
                                                    if(count==0){
                                                        alert("최소 1개 이상의 상품을 선택해주세요.");
                                                        return;
                                                    }
                                                    console.log("여기까지 도달하면 체크 한개 이상 된 것.");
                                                    // 여기 밑에 로직 적기
                                                    totalData = totalData.replace(/,$/, '');
                                                    console.log(totalData);
                                                    $("#updateData").attr("value",totalData);
                                                    console.log(encodeURI(totalData));
                                                    
                                                    console.log(decodeURI(encodeURI(totalData)));
                                                    location.assign("/admin/updateProduct.do?updateData="+encodeURI(totalData));
                                                    
                                                });
                                              //최소 한개 이상 클릭 안하면 온클릭 작동 못하게 하는 로직 + 값 넣어주는 로직(상품 삭제)
                                              $(".deleteProduct").click(e=>{
                                                    let i = 0;
                                                    let count = 0;
                                                    totalData="";
                                                    for(i=0; i<rowChk.length; i++) {
                                                        if(rowChk[i].checked){
                                                            count++;
                                                            console.log(rowChk[i].parentNode.parentNode.childNodes[2].childNodes[0].data);
                                                            console.log("pd_code : "+rowChk[i].parentNode.parentNode.childNodes[2].childNodes[0].data);
                                                            pdCode = rowChk[i].parentNode.parentNode.childNodes[2].childNodes[0].data;
                                                            console.log(rowChk[i].parentNode.parentNode.childNodes[1].childNodes[5].value);
															pdImage = rowChk[i].parentNode.parentNode.childNodes[1].childNodes[5].value.replace(/\n|\r/g, "");
															console.log("pdImage : "+pdImage);                                                       
                                                        	console.log("pdPrice : "+rowChk[i].parentNode.parentNode.childNodes[4].childNodes[1].value);
                                                        	pdPrice = rowChk[i].parentNode.parentNode.childNodes[4].childNodes[1].value;
                                                        	pdPrice = pdPrice.replace(/[^0-9]/g,"");
                                                        	console.log("pdPrice(콤마 제거) : "+pdPrice);
                                                        	if(rowChk[i].parentNode.parentNode.childNodes[5].childNodes[1][0].selected==true){
                                                        		pdIsDiscount = rowChk[i].parentNode.parentNode.childNodes[5].childNodes[1][0].value;
                                                        		console.log("pdIsDiscount : "+rowChk[i].parentNode.parentNode.childNodes[5].childNodes[1][0].value);
                                                        		pdDiscountrate = rowChk[i].parentNode.parentNode.childNodes[6].childNodes[1].value;
                                                        		console.log("pdDiscountrate : "+rowChk[i].parentNode.parentNode.childNodes[6].childNodes[1].value);
                                                        	}else{
                                                        		pdIsDiscount = rowChk[i].parentNode.parentNode.childNodes[5].childNodes[1][1].value;
                                                        		console.log("pdIsDiscount : "+rowChk[i].parentNode.parentNode.childNodes[5].childNodes[1][1].value);
                                                        		pdDiscountrate = 0;
                                                        		console.log("pdDiscountrate : "+pdDiscountrate);
                                                        	}
                                                        	
                                                        	if(rowChk[i].parentNode.parentNode.childNodes[8].childNodes[1][0].selected==true){
                                                        		pdDisplay = rowChk[i].parentNode.parentNode.childNodes[8].childNodes[1][0].value;
                                                        		console.log("pdDisplay : "+rowChk[i].parentNode.parentNode.childNodes[8].childNodes[1][0].value);
                                                        	}else{
                                                        		pdDisplay = rowChk[i].parentNode.parentNode.childNodes[8].childNodes[1][1].value;
                                                        		console.log("pdDisplay : "+rowChk[i].parentNode.parentNode.childNodes[8].childNodes[1][1].value);
                                                        	}
                                                        	totalData += pdCode;
                                                        	totalData += ",";
                                                        }
                                                        
                                                        
                                                        
                                                    }
                                                    if(count==0){
                                                        alert("최소 1개 이상의 상품을 선택해주세요.");
                                                        return;
                                                    }
                                                    console.log("여기까지 도달하면 체크 한개 이상 된 것.");
                                                    // 여기 밑에 로직 적기
                                                    totalData = totalData.replace(/,$/, '');
                                                    console.log(totalData);
                                                    $("#deleteData").attr("value",totalData);
                                                    location.assign("/admin/deleteProduct.do?deleteData="+totalData);
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
        									    //$(".pd_image").click(e=>{
        									    //	console.log($(e.target)[0].nextElementSibling);
        									    //	$(e.target)[0].nextElementSibling.click();
        										//})
        									
        										$("input[name=pd_imageFile]").change(e=>{
        											console.log("=====확인 체크용=======");
													console.log($(e.target).prev()[0]);
													let path = $(e.target).prev()[0]
        											console.dir(e.target);
        											if(e.target.files[0].type.includes("image")){
        												let reader=new FileReader();
        												reader.onload=(e)=>{
        													const img=$("<img>").attr({
        														src:e.target.result,
        														width:"100px",
        														height:"100px"
        													});
        													
        													/* $(".pd_image").attr("src",e.target.result); */
        													path.src = e.target.result;
        												}
        												reader.readAsDataURL(e.target.files[0]);
        											}
        											
        										});
                                              
                                              	
                                                
                                            });
                                        //===========================================================
									  	
									  
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
