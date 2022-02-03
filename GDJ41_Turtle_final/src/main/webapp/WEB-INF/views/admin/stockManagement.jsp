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
                                                    <option value="productName">상품명</option>
                                                    <option value="productCode">상품코드</option>
                                                    <option value="optCode">옵션코드</option>
                                                </select>
                                                <div id="search-productName">
                                                    <input type="hidden" name="searchType" value="productName">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'productName'?keyword:''}"
                                                    placeholder="상품명을 입력하세요">
                                                </div>
                                                <div id="search-productCode">
                                                    <input type="hidden" name="searchType" value="productCode">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'productCode'?keyword:''}"
                                                    placeholder="상품코드를 입력하세요">
                                                </div>
                                                <div id="search-optCode">
                                                    <input type="hidden" name="searchType" value="optCode">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'optCode'?keyword:''}"
                                                    placeholder="옵션코드를 입력하세요">
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
                                                <select class="form-select me-2" id="category" name="category" style="width: 120px;">
                                                    <option selected value="">분류 선택</option>
                                                    <option value="ring">반지</option>
                                                    <option value="brac">팔찌</option>
                                                    <option value="neck">목걸이</option>
                                                    <option value="earr">귀걸이</option>
                                                </select>
                                            </div>
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
                                <tr>
                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_optCode" name="rowChk_optCode"></td>
                                    <td scope="col"><img src="https://dummyimage.com/100x100/dee2e6/6c757d.jpg" alt="상품 이미지"></td>
                                    <td scope="col" class="productNo">ring001</td>
                                    <td scope="col" class="optCode">ring001_7</td>
                                    <td scope="col" class="productName">커플용 반지</td>
                                    <td scope="col" class="productPrice">100000</td>
                                    <td scope="col" class="size">7</td>
                                    <td scope="col" class="stock">
                                        <input type="number" class="form-control-sm" value="20" style="width: 70px;">
                                    </td>
                                    <td scope="col" class="productDate">22/01/28</td>
                                </tr>
                                <tr>
                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_optCode" name="rowChk_optCode"></td>
                                    <td scope="col"><img src="https://dummyimage.com/100x100/dee2e6/6c757d.jpg" alt="상품 이미지"></td>
                                    <td scope="col" class="productNo">ring001</td>
                                    <td scope="col" class="optCode">ring001_9</td>
                                    <td scope="col" class="productName">커플용 반지</td>
                                    <td scope="col" class="productPrice">100000</td>
                                    <td scope="col" class="size">9</td>
                                    <td scope="col" class="stock">
                                        <input type="number" class="form-control-sm" value="20" style="width: 70px;">
                                    </td>
                                    <td scope="col" class="productDate">22/01/28</td>
                                </tr>
                                <tr>
                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_optCode" name="rowChk_optCode"></td>
                                    <td scope="col"><img src="https://dummyimage.com/100x100/dee2e6/6c757d.jpg" alt="상품 이미지"></td>
                                    <td scope="col" class="productNo">ring001</td>
                                    <td scope="col" class="optCode">ring001_11</td>
                                    <td scope="col" class="productName">커플용 반지</td>
                                    <td scope="col" class="productPrice">100000</td>
                                    <td scope="col" class="size">11</td>
                                    <td scope="col" class="stock">
                                        <input type="number" class="form-control-sm" value="20" style="width: 70px;">
                                    </td>
                                    <td scope="col" class="productDate">22/01/28</td>
                                </tr>
                                
                            </tbody>
                        </table>
                        <table class="table table-borderless">
                            <tr>
                                <td colspan="11">
                                    <div style="text-align: left;">
                                        <button class="btn btn-secondary updateStock" onclick="">재고 변경</button>
                                        <button class="btn btn-secondary deleteStock" onclick="" style="float: right;">삭제</button>
                                        
                                        <script>
                                            $(()=>{
                                                //최소 한개 이상 클릭 안하면 온클릭 작동 못하게 하는 로직
                                                let rowChk = document.getElementsByClassName("rowChk_optCode");
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
                                                //재고 관리 변경 클릭시 모두 누락시 버튼 클릭 안되게 막기
                                                $(".updateStock,.deleteStock").click(e=>{
                                                    let i = 0;
                                                    let count = 0;
                                                    for(i=0; i<rowChk.length; i++) {
                                                        if(rowChk[i].checked){
                                                            count++;
                                                            // console.log(rowChk[i].parentNode.parentNode.childNodes[7].childNodes[1].value);
                                                        }
                                                    }
                                                    if(count==0){
                                                        alert("최소 1개 이상의 상품을 선택해주세요.");
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
