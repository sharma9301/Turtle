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
                                <h1 class="mt-4 mb-4">리뷰 관리</h1>
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
                                                    <option value="reviewTitle">제목</option>
                                                    <option value="reviewContent">내용</option>
                                                    <option value="userId">작성자</option>
                                                    <option value="productName">상품명</option>
                                                    <option value="productCode">상품코드</option>

                                                </select>
                                                <div id="search-reviewTitle">
                                                    <input type="hidden" name="searchType" value="reviewTitle">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'reviewTitle'?keyword:''}"
                                                    placeholder="리뷰 제목를 입력하세요">
                                                </div>
                                                <div id="search-reviewContent">
                                                    <input type="hidden" name="searchType" value="reviewContent">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'reviewContent'?keyword:''}"
                                                    placeholder="리뷰 내용를 입력하세요">
                                                </div>
                                                <div id="search-userId">
                                                    <input type="hidden" name="searchType" value="userId">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'userId'?keyword:''}"
                                                    placeholder="리뷰 작성자 아이디을 입력하세요">
                                                </div>
                                                <div id="search-productName">
                                                    <input type="hidden" name="searchType" value="productName">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'productName'?keyword:''}"
                                                    placeholder="상품명을 입력하세요">
                                                </div>
                                                <div id="search-productCode">
                                                    <input type="hidden" name="searchType" value="productCode">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'productCode'?keyword:''}"
                                                    placeholder="상품 코드를 입력하세요">
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
                                        <th class="table-active">기간</th>
                                        <td>
                                            <div class="btn-group btn-group-sm" role="group">
                                                <input type="radio" class="btn-check btn-sm" name="reviewDate" id="reviewDateToday" checked>
                                                <label class="btn btn-outline-secondary" for="reviewDateToday">오늘</label>
                                                
                                                

                                                <input type="radio" class="btn-check btn-sm" name="reviewDate" id="reviewDate3day">
                                                <label class="btn btn-outline-secondary" for="reviewDate3day">3일</label>
                                            
                                                <input type="radio" class="btn-check btn-sm" name="reviewDate" id="reviewDate7day">
                                                <label class="btn btn-outline-secondary" for="reviewDate7day">7일</label>

                                                <input type="radio" class="btn-check btn-sm" name="reviewDate" id="reviewDate1month">
                                                <label class="btn btn-outline-secondary" for="reviewDate1month">1개월</label>

                                                <input type="radio" class="btn-check btn-sm" name="reviewDate" id="reviewDateAll">
                                                <label class="btn btn-outline-secondary" for="reviewDateAll">전체</label>

                                                <input type="date" name="fromDate" id="fromDate" class="form-control ms-2" style="width: 160px;"/>
                                                <span>&nbsp;~&nbsp;</span> 
                                                <input type="date" name="toDate" id="toDate" class="form-control" style="width: 160px;"/>

                                            </div>
                                            
                                            <script>
                                                var d= new Date();
                                                
                                                var kor_date = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString();
                                                document.getElementById('fromDate').value = kor_date.substring(0, 10);
                                                document.getElementById('toDate').value = kor_date.substring(0, 10);
                                                
                                                $("input:radio[name=reviewDate]").click(e=>{
                                                    let selectDate = $(e.target).next()[0].innerText;
                                                    let newDate = new Date(d.getTime() - (d.getTimezoneOffset() * 60000));
                                                    // console.log(selectDate);
                                                    // console.log("변경전 newDate : " + newDate);

                                                    switch(selectDate){
                                                        case "오늘": break;
                                                        case "3일": newDate.setDate(newDate.getDate()-3); break;
                                                        case "7일": newDate.setDate(newDate.getDate()-7); break;
                                                        case "1개월": newDate.setMonth(newDate.getMonth()-1); break;
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
                                    <th scope="col" class="reviewNo" style="width: 40px;">번호</th>
                                    <th scope="col" class="reviewImage">리뷰 이미지</th>
                                    <th scope="col" class="productName">상품명</th>
                                    <th scope="col" class="productCode">상품코드</th>
                                    <th scope="col" class="userId">작성자</th>
                                    <th scope="col" class="reviewTitle">리뷰 제목</th>
                                    <th scope="col" class="reviewGrade">리뷰 점수</th>
                                    <th scope="col" class="reviewIsImage" style="width: 100px;">포토리뷰</th>
                                    <th scope="col" class="reviewDate">리뷰 날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_reviewNo" name="rowChk_reviewNo"></td>
                                    <td scope="col" class="reviewNo">1</td>
                                    <td scope="col" class="reviewImage"><img src="https://dummyimage.com/100x100/dee2e6/6c757d.jpg" alt="상품 이미지"></td>
                                    <td scope="col" class="productName">커플용 반지</td>
                                    <td scope="col" class="productCode">ring001</td>
                                    <td scope="col" class="userId">
                                        user00<br>
                                        (유저공공)
                                    </td>
                                    <td scope="col" class="reviewTitle">이 제품 추천합니다!</td>
                                    <td scope="col" class="reviewGrade">
                                        5점
                                    </td>
                                    <td scope="col" class="reviewIsImage">예</td>
                                    <td scope="col" class="reviewDate">22/01/25</td>
                                </tr>
                                
                                
                            </tbody>
                        </table>
                        <table class="table table-borderless">
                            <tr>
                                <td colspan="11">
                                    <div style="text-align: left;">
                                        <button class="btn btn-secondary deleteReview" onclick="">삭제</button>
                                        <div class="btn-group">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                            포토리뷰 여부
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <li><a class="dropdown-item" href="#">예</a></li>
                                            <li><a class="dropdown-item" href="#">아니오</a></li>
                                            </ul>
                                        </div>
                                        <button class="btn btn-secondary showProductPage" onclick="" style="float: right;">상품 페이지로 이동</button>
                                        <script>
                                            $(()=>{
                                                //최소 한개 이상 클릭 안하면 온클릭 작동 못하게 하는 로직
                                                let rowChk = document.getElementsByClassName("rowChk_reviewNo");
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
                                                        $(".rowChk_reviewNo").prop("checked", true);
                                                    }else{
                                                        $(".rowChk_reviewNo").prop("checked", false);
                                                    }
                                                });

                                                $(".rowChk_reviewNo").click(e=>{
                                                    let total = $(".rowChk_reviewNo").length;
                                                    let checked = $(".rowChk_reviewNo:checked").length;

                                                    if(total != checked){
                                                        $(".allChk").prop("checked",false);
                                                    }else{
                                                        $(".allChk").prop("checked",true);
                                                    }
                                                    
                                                });
                                                //===========================================================
                                                //페이지 이동 선택시 한개만 선택해야지 작동되는 로직
                                                $(".showProductPage").click(e=>{
                                                    console.log(rowChk);
                                                    let i = 0;
                                                    let count = 0;
                                                    for(i=0; i<rowChk.length; i++) {
                                                        if(rowChk[i].checked){
                                                            count++;
                                                        }
                                                    }
                                                    if(count==0){
                                                        alert("적어도 1개는 선택해주세요");
                                                        return;
                                                    }else if(count!=1){
                                                        alert("1개만 선택해주세요");
                                                        return;
                                                    }
                                                    console.log("여기까지 도달하면 체크 한개 이상 된 것.");
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
