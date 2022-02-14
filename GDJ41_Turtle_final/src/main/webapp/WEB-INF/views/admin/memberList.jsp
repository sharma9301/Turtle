<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp"/>
<main>
                    <div class="container-fluid w-75">
                        <form class="form" style="margin: 50px auto 50px auto;" action="${path }/admin/searchMember.do" method="get">
                            <div class="container">
                                <h1 class="mt-4 mb-4">고객 관리</h1>
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
                                                    <option value="user_Name">이름</option>
                                                    <option value="user_Id">아이디</option>
                                                    <option value="user_email">이메일</option>
                                                    <option value="user_phone">연락처</option>
                                                </select>
                                                <div id="search-user_Name">
                                                    <input type="hidden" name="searchType" value="user_Name">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'user_Name'?searchKeyword:''}"
                                                    placeholder="이름을 입력하세요">
                                                </div>
                                                <div id="search-user_Id">
                                                    <input type="hidden" name="searchType" value="user_Id">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'user_Id'?searchKeyword:''}"
                                                    placeholder="아이디를 입력하세요">
                                                </div>
                                                <div id="search-user_email">
                                                    <input type="hidden" name="searchType" value="user_email">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'user_email'?searchKeyword:''}"
                                                    placeholder="이메일을 입력하세요">
                                                </div>
                                                <div id="search-user_phone">
                                                    <input type="hidden" name="searchType" value="user_phone">
                                                    <input type="text" class="form-select" name="searchKeyword" size="50" value="${searchType != null && searchType == 'user_phone'?searchKeyword:''}"
                                                    placeholder="연락처를 입력하세요">
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
                                        <th class="table-active">가입 방식 분류</th>
                                        <td>
                                            <div id="searchTypeDiv" style="display: flex;">
                                                <select class="form-select me-2" id="enrollType" name="enrollType" style="width: 120px;">
                                                    <option selected value="">선택</option>
                                                    <option value="TURTLE">홈페이지</option>
                                                    <option value="NAVER">네이버</option>
                                                    <option value="KAKAO">카카오</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </div>
                            <div class="container-fluid" style="display:block; margin:10px 0; position: relative; text-align: center;">
                                <button type="submit" class="btn btn-secondary">검색</button>
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
                                    <th scope="col">이름</th>
                                    <th scope="col">아이디</th>
                                    <th scope="col">이메일</th>
                                    <th scope="col">가입방식</th>
                                    <th scope="col">지역</th>
                                    <th scope="col">연락처</th>
                                    <th scope="col">가입일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${memberList }" var="member">
                                	<tr>
	                                    <td scope="col" style="width: 0px;"><input type="checkbox" class="rowChk_userId" name="rowChk_userId"></td>
	                                    <td scope="col">${member.userName }</td>
	                                    <td scope="col">${member.userId }</td>
	                                    <td scope="col">${member.email }</td>
	                                    <td scope="col">${member.enrollType }</td>
	                                    <td scope="col">
	                                    	<c:set var="addressArr" value="${fn:split(member.address,'/')}"/>
	                                    	<c:set var="addressArr2" value="${fn:split(addressArr[1],' ')}"/>
	                                    	${addressArr2[0]} ${addressArr2[1]}
	                                    </td>
	                                    <td scope="col">${member.phone}</td>
	                                    <td scope="col">${member.enrollDate }</td>
                                	</tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <table class="table table-borderless">
                            <tr>
                                <td colspan="11">
                                    <div style="text-align: left;">
                                        <button class="btn btn-secondary updateMember" >정보 수정</button>
                                        
                                        <button class="btn btn-secondary deleteMember" style="float: right;">삭제</button>
                                        <script>
                                            $(()=>{
                                                //최소 한개 이상 클릭 안하면 온클릭 작동 못하게 하는 로직
                                                let rowChk = document.getElementsByClassName("rowChk_userId");
                                                console.log(rowChk);
                                                $(".deleteMember").click(e=>{
                                                    console.log(rowChk);
                                                    let i = 0;
                                                    let count = 0;
                                                    for(i=0; i<rowChk.length; i++) {
                                                        if(rowChk[i].checked){
                                                            console.log("체크 됨");
                                                            count++;
                                                        }
                                                    }
                                                    if(count==0){
                                                        console.log("체크 아무것도 안됨");
                                                        alert("최소 1명 이상의 회원을 선택해주세요.");
                                                        
                                                        return;
                                                    }
                                                    console.log("여기까지 도달하면 체크 한개 이상 된 것.");
                                                    // 여기 밑에 로직 적기
                                                    location.assign("index.html");
                                                    
                                                })
                                                //===========================================================
                                                //정보 수정 한개만 선택해야지 작동되는 로직
                                                $(".updateMember").click(e=>{
                                                    console.log(rowChk);
                                                    let i = 0;
                                                    let count = 0;
                                                    for(i=0; i<rowChk.length; i++) {
                                                        if(rowChk[i].checked){
                                                            count++;
                                                        }
                                                    }
                                                    if(count==0){
                                                        alert("적어도 1명의 회원을 선택해주세요");
                                                        return;
                                                    }else if(count!=1){
                                                        alert("정보 수정은 1명의 회원만 선택해주세요");
                                                        return;
                                                    }
                                                    console.log("여기까지 도달하면 체크 한개 이상 된 것.");
                                                });
                                                //===========================================================
                                                //allRowChk 로직
                                                $(".allRowChk").click(e=>{
                                                    if($(".allRowChk").is(":checked")){
                                                        $(".rowChk_userId").prop("checked", true);
                                                    }else{
                                                        $(".rowChk_userId").prop("checked", false);
                                                    }
                                                });
                                                $(".rowChk_userId").click(e=>{
                                                    let total = $(".rowChk_userId").length;
                                                    let checked = $(".rowChk_userId:checked").length;

                                                    if(total != checked){
                                                        $(".allRowChk").prop("checked",false);
                                                    }else{
                                                        $(".allRowChk").prop("checked",true);
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
                { select: [0,2,3] , sortable:false},
                { select: 7, type: "date", format: "YY/MM/DD"}
            ],
            fixedColumns : false,
            labels: {
                placeholder: "검색",
                perPage: "{select}개씩 보기",
                noRows: "검색 결과가 없습니다.",
                noResults: "검색 결과가 없습니다.",
                info: "[검색결과 <span style='color: red;'>{rows}</span>건]"
            },
            perPage : 10,
            perPageSelect : [10, 20, 30, 40, 50, 100, 200],
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
