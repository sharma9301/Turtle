<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp"/>
<main>
                    <form class="form w-50" style="margin: 50px auto 50px 10%;">
                        <div class="container-fluid px-4">
                            <h1 class="mt-4 mb-4">상품 등록</h1>
                            <style>
                                tr>td:first-child{
                                    width: 20%;
                                }
                            </style>
                            <table id="product" class="table">
                                <tr>
                                    <td>상품명(필수)</td>
                                    <td>
                                        <input class="form-control" id="productName" name="productName" type="text" placeholder="예) 커플용 반지" style="width: 400px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td>판매가(필수)</td>
                                    <td style="display: flex;">
                                        <input class="form-control" id="productPrice" name="productPrice" type="text" style="width: 200px;"><span class="ms-1 mb-1 align-self-end">원</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>상품코드(필수)</td>
                                    <td style="display: flex;">
                                        <input class="form-control" id="productCode" name="productCode" type="text" style="width: 200px;"><button class="btn btn-secondary ms-3" type="button" onclick="">중복 확인</button>
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
                                                    <input class="form-control" id="" name="" type="text" placeholder="" style="width: 250px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>색상</td>
                                                <td>
                                                    <input class="form-control" id="" name="" type="text" placeholder="" style="width: 250px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>무게</td>
                                                <td>
                                                    <input class="form-control" id="" name="" type="text" placeholder="" style="width: 250px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>사이즈</td>
                                                <td>
                                                    <input class="form-control" id="" name="" type="text" placeholder=", 으로 구분해서 적어주세요" style="width: 250px;">
                                                    <span style="font-size: x-small;">사이즈 구분이 없을 경우 FREE라고 기입해주세요.</span>
                                                </td>
                                            </tr>
                                        </table>   
                                    </td>
                                </tr>
                                <tr>
                                    <td>이미지</td>
                                    <td>
                                        <img src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" class="imgThumbnail mb-2" alt="상품사진">
                                        <input class="form-control form-control-sm" type="file" id="productImage" name="productImage" style="width: 50%;">
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
                                    </script>
                                </tr>
                            </table>
                        </div>
                        <button type="submit" class="btn btn-secondary" style="display: block; margin: 0 auto;">상품 등록</button>
                    </form>
                </main>


<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"/>
