<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp"/>

  <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sidebars/">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <script src="https://kit.fontawesome.com/e3bf9144bc.js" crossorigin="anonymous"></script>
    <style>
      
    </style>
<main>
	<div class="container-fluid w-100" style="margin: 50px auto 50px auto;">
		<div class="container-fluid w-75">
                        <form class="form" style="margin: 50px auto 50px auto;">
                            <div class="container">
                            	<div class="csTitle mb-5">
                            		<h1>관리자페이지</h1>
                            	</div>
                                <div class="card align-middle text-center">
				                    <div class="card-body">
				                        <div class="container">
				                            <div class="row row-cols-5" id="deliveryCheck">
				                                <div class="col">
				                                    <h4>배송현황</h4>
				                                    <div>
				                                        <i class="fas fa-truck fa-4x"></i>
				                                    </div>
				                                </div>
				                                <div class="col" style="border-right:lightgray 1px solid;">
				                                    <h4>배송대기</h4>
				                                    <div>  
				                                        배송대기수
				                                    </div>
				                                </div>
				                                <div class="col" style="border-right:lightgray 1px solid;">
				                                    <h4>배송준비중</h4>
				                                    <div>  
				                                        배송준비중수
				                                    </div>
				                                </div>
				                                <div class="col" style="border-right:lightgray 1px solid;">
				                                    <h4>배송중</h4>
				                                    <div>  
				                                        배송중수
				                                    </div>
				                                </div>
				                                <div class="col">
				                                    <h4>배송완료</h4>
				                                    <div>  
				                                        배송완료수
				                                    </div>
				                                </div>
				                            </div>
				                          </div>
				                    </div>
              					</div>
                            </div>
                        </form>
                    </div>
	        
</main>


<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"/>
