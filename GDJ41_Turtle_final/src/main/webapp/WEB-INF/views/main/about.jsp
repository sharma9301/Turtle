<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="header-line"></div>
<section>
        <div class="about-us">
            <h1 style="font-size:70px; margin-bottom: 100px">About us</h1>
            <div class="about-content">             
                <img src="${path }/resources/images/main-new.png" alt="소개1">
                <div class="aboutustext" style="margin:0 auto;">
                    <h2 class="mt-5 mb-5">터틀 스토어에 오신 것을 환영합니다.</h2>
                    <h3>
                    	심플하지만 명쾌한 아이디어가<br>
                    	돋보이는 주얼리 쇼핑몰입니다<br>
                    	터틀스토어는 14k, 18k 등을 취급하며 <br>
                    	몸에 자극이 없는 소재만을 사용합니다.
					</h3>                
                </div>  
            </div>
            <div class="about-content">             
                <div class="aboutustext" style="margin:0 auto;">
                    <h2 class="mt-5 mb-5">독특하고 개성있는 브랜드</h2>
                    <h3>
	                    다른 브랜드에서 찾기 힘든<br> 
	                    독특하고 개성있는 물품을 취급하여<br>
	                    인생의 가장 아름다운<br> 
	                    순간들의 감정을 공유합니다.
                    </h3>
                     
                </div>  
                <img src="${path }/resources/images/product/sale4.png" alt="소개2">
            </div>
            <div class="about-content"> 
                <img src="${path }/resources/images/main-best.png" alt="소개3">            
                <div class="aboutustext" style="margin:0 auto;">
                    <h2 class="mt-5 mb-5">일상 속 자연스럽게 스며드는 악세사리</h2>
                    <h3>
	                    어디에서나 어울리고<br>
	                    마음에 스며드는 악세사리로<br>
	                    꾸준히 사랑 받는 쇼핑몰이 되겠습니다.
                    </h3>
                     
                </div>  
            </div>
        </div>

    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>