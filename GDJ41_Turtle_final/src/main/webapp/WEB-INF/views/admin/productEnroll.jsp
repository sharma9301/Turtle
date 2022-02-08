<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp"/>
<main>
                    <form class="form w-50" style="margin: 50px auto 50px 10%;" action="${path }/admin/productEnrollEnd" method="post" enctype="multipart/form-data">
                        <div class="container-fluid px-4">
                            <h1 class="mt-4 mb-4">상품 등록</h1>
                            <style>
                                tr>td:first-child{
                                    width: 20%;
                                }
                            </style>
                            <table id="product" class="table">
                                <tr>
                                    <td>상품명 (필수)</td>
                                    <td>
                                        <input class="form-control" id="productName" name="productName" type="text" placeholder="예) 커플용 반지" style="width: 400px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td>판매가 (필수)</td>
                                    <td style="display: flex;">
                                        <input class="form-control" id="productPrice" name="productPrice" type="text" style="width: 200px;"><span class="ms-1 mb-1 align-self-end">원</span>
                                    </td>
                                </tr>
                                <tr>
                                	<td>상품 분류 (필수)</td>
                                	<td>
	                                    <div id="searchTypeDiv" style="display: flex;">
	                                        <select class="form-select me-2" id="category_code" name="category_code" style="width: 120px;">
	                                            <option value="ring">반지</option>
	                                            <option value="brac">팔찌</option>
	                                            <option value="neck">목걸이</option>
	                                            <option value="earr">귀걸이</option>
	                                        </select>
	                                    </div>
                              		</td>
                                </tr>
                                <tr>
                                    <td>상품 코드 (필수)</td>
                                    <td style="display: flex;">
                                        <input class="form-control" id="productCode" name="productCode" type="text" style="width: 200px;"><button class="btn btn-secondary ms-3" id="productCodeChk" type="button">중복 확인</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>상품 상세설명</td>
                                    <td>
                                        <style>
                                            #productOption td:first-child {
                                                width: 30%;
                                                
                                                padding-bottom: 20px;
                                            }
                                        </style>
                                        <table id="productOption" class="table-borderless">
                                            <tr>
                                                <td>재질</td>
                                                <td>
                                                    <input class="form-control" id="material" name="material" type="text" placeholder="" style="width: 250px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>색상</td>
                                                <td>
                                                    <input class="form-control" id="color" name="color" type="text" placeholder="" style="width: 250px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>무게</td>
                                                <td>
                                                    <input class="form-control" id="weight" name="weight" type="text" placeholder="" style="width: 250px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>사이즈</td>
                                                <td>
                                                    <input class="form-control" id="size" name="size" type="text" placeholder=", 으로 구분해서 적어주세요" style="width: 250px;">
                                                    <span style="font-size: x-small;">사이즈 구분이 없을 경우 FREE라고 기입해주세요.</span>
                                                </td>
                                            </tr>
                                            
                                        </table>   
                                    </td>
                                </tr>
                                <tr>
                                    <td>이미지</td>
                                    <td>
                                        <img src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" class="imgThumbnail mb-2" alt="상품사진" width="300px" height="300px">
                                        <input class="form-control" type="file" id="productImage" name="productImage" style="width: 50%;">
                                    </td>
                                    <style>
                                        .imgThumbnail:hover{
                                            cursor: pointer;
                                        }
                                    </style>
                                    <script>
                                        $(".imgThumbnail").click(e=>{
                                            $("#productImage").click();
                                        })
                                        
                                        $("input[name=productImage]").change(e=>{
        											
   											console.dir(e.target);
   											if(e.target.files[0].type.includes("image")){
   												let reader=new FileReader();
   												reader.onload=(e)=>{
   													const img=$("<img>").attr({
   														src:e.target.result,
   														width:"100px",
   														height:"100px"
   													});
   													$(".imgThumbnail").attr("src",e.target.result);
   												}
   												reader.readAsDataURL(e.target.files[0]);
   											}
   											
   										});
                                    </script>
                                </tr>
                                <tr>
                                    <td>재고</td>
                                    <td>
                                        <input class="form-control" id="stock" name="stock" type="number" placeholder="" min="1" style="width: 250px;">
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <button type="submit" class="btn btn-secondary" style="display: block; margin: 0 auto;">상품 등록</button>
                    </form>
                </main>
<script>
	
	
	
	$("#productCodeChk").click(e=>{
		let productCode = $("#productCode").val();
		let data = {productCode : productCode};
		console.log(productCode);
		console.log(data);
		
		$.ajax({
			type : "post",
			url : "/admin/productCodeChk",
			data : data,
			success : function(result) {
				
				if(result != 'fail'){
					alert("이미 존재하는 상품 코드 입니다.");
				}else{
					alert("사용할 수 있는 상품 코드 입니다.");}
				}
		});
	});
</script>
<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"/>
