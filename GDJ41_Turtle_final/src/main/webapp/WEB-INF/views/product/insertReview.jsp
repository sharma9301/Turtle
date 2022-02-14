<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="header-line"></div>
 <section>
        <div class="container">
            <div class="insert-review-page">
                <h2 style="text-align: center; margin-bottom: 40px;">리뷰 작성하기</h2>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                  </div>
                <div class="input-group">
                    <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                    
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-default">리뷰 제목</span>
                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                  </div>
                <div class="input-group">
                    <span class="input-group-text">리뷰 내용</span>
                    <textarea class="form-control review-textarea" aria-label="With textarea" rows="8px"></textarea>
                </div>
                <div class="review-bottom">
                    <p>별점</p>
                    <button class="review-save-btn">리뷰 저장</button>
                </div>
            </div>
        </div>
    </section style="line-height">

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>