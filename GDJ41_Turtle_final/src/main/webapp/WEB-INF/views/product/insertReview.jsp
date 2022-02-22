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
            <div class="insert-review-page"> <!-- ${path}/product/insertReviewEnd.do -->
            	<form action="${path}/product/insertReviewEnd.do?userId=${userId}&pdCode=${pdCode}&rvNo=${rvNo}" method="post" encType="multipart/form-data">
	                <h2 style="text-align: center; margin-bottom: 40px;">리뷰 작성하기</h2>
	                <div class="input-group mb-3">
	                    <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
	                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" 
	                    			value="${loginMember.userId }" disabled style="background-color: white;">
	                </div>
	                <div class="input-group">
	                    <input type="file" class="form-control" name="upFile" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
	                    
	                </div>
	                <div class="input-group mb-3">
	                    <span class="input-group-text" id="inputGroup-sizing-default">리뷰 제목</span>
	                    <input type="text" class="form-control" name="rvTitle" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
	                  </div>
	                <div class="input-group">
	                    <span class="input-group-text">리뷰 내용</span>
	                    <textarea class="form-control review-textarea" name="rvContent" aria-label="With textarea" rows="8px" required></textarea>
	                </div>
	                <div class="review-bottom">
	                    <div style="display: flex;">
		                    <h5>별점</h5>&nbsp;&nbsp;&nbsp;&nbsp;
		                    <fieldset class="rating">
							    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
							    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
							    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
							    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
							    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
							</fieldset>
							<input type="hidden" name="rvGrade" >
						</div>	
	                    <button class="review-save-btn" id="insertReviewBtn" button="button">리뷰 저장</button>
							<script>
							$(()=>{
								$("#insertReviewBtn").click(e=>{
									let starRate = $("input[name=rating]:checked").val();
									console.log(starRate);
									$("input[name=rvGrade]").attr("value",starRate);
									//console.log($("input[name=rvGrade]").val());
								});
							});
							</script>
	                </div>
	            </form>    
            </div>
        </div>
    </section >
    <script>
    	/* $("#insertReviewBtn").click(e=>{
    		let starRate = $("input[name=rating]:checked").val();
    		let rvTitle = $("input[class=rvTitle]").val();
    		let rvContent = $(".rvContent").val();
    		let rvImage = $(".rvImage").val();
    		console.log(starRate + rvTitle + rvContent + rvImage);
    		//location.assign('${path}/product/insertReviewEnd.do?userId=${userId}&rvNo=${rvNo}&pdCod=${pdCode}&rvGrade='+starRate+'&rvTitle='+rvTitle);
    	}); */
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>