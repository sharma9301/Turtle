<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="py-5">
    <div class="container px-4 px-lg-5 my-5" style="margin-bottom: 100px;">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6 img-div"><img class="card-img-top mb-5 mb-md-0" src="${path }/resources/images/sale1.png" alt="..." /></div>
            <div class="col-md-6">
                <div class="small mb-2">상품 코드: ring-0001</div>
                <h1 class="display-5 fw-bolder">상품 이름(반지)</h1>
                <div class='RatingStar mb-3'>
                    <div class='RatingScore'>
                        <div class='outer-star'>
                            <div class='inner-star'></div>
                        </div>
                        <span>
                            2.5 (10 reviews)
                        </span>
                    </div>
                </div>
                <style>
                    .inner-star::before{color: #FF9600;}
                    .outer-star {position: relative;display: inline-block;color: #CCCCCC;}
                    .inner-star {position: absolute;left: 0;top: 0;width: 0%;overflow: hidden;white-space: nowrap;}
                    .outer-star::before, .inner-star::before {content: '\f005 \f005 \f005 \f005 \f005';font-family: 'Font Awesome 5 free';font-weight: 900;}
                </style>
                    
                <script>ratings = {RatingScore: 2.5} 
                totalRating = 5;table = document.querySelector('.RatingStar');function rateIt() {for (rating in ratings) {ratingPercentage = ratings[rating] / totalRating * 100;ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%';star = table.querySelector(`.${rating} .inner-star`);numberRating = table.querySelector(`.${rating} .numberRating`);star.style.width = ratingRounded;numberRating.innerText = ratings[rating];}}rateIt()
                </script>

                <div class="fs-5 mb-3">
                    <span class="text-decoration-line-through">₩100,000</span>
                    <span>₩90,000</span>
                </div>
               
                <div class="fs-5 mb-5">
                    <span class="fs-5 mb-1 d-block">Size</span>
                    <input type="radio" id="size7" name="size" value="7" checked><label for="size7" class="selectSize">7</label>
                    <input type="radio" id="size9" name="size" value="9"><label for="size9" class="selectSize">9</label>
                    <input type="radio" id="size11" name="size" value="11"><label for="size11" class="selectSize">11</label>
                    <input type="radio" id="size13" name="size" value="13"><label for="size13" class="selectSize">13</label>
                    <input type="radio" id="size15" name="size" value="15"><label for="size15" class="selectSize">15</label>
                    <input type="radio" id="size17" name="size" value="17"><label for="size17" class="selectSize">17</label>
                    <input type="radio" id="size19" name="size" value="19"><label for="size19" class="selectSize">19</label>
                    <input type="radio" id="size21" name="size" value="21"><label for="size21" class="selectSize">21</label>
                </div>
                <style>
                    input[type='radio'] {display: none;}
                    input[type="radio"] + label {
                        display: inline-block;
                        width: 15%;
                        height: 50px;
                        border: 1px solid #dfdfdf;
                        background-color: #ffffff;
                        text-align: center;
                        padding: 7px;
                        cursor: pointer;
                        margin-bottom: 10px;
                    }
                    input[type="radio"]:checked + label {
                        background-color: #000;
                        color: #ffffff;
                    }  
                </style>
                <div class="fs-5 mb-3">
                    <table class="table table-borderless">
                        <tr>
                            <td colspan="2"><h4>PRODUCT DETAIL</h4></td>
                        </tr>
                        <tr>
                            <td>MATERIAL</td>
                            <td>14K GOLD</td>
                        </tr>
                        <tr>
                            <td>COLOR</td>
                            <td>GOLD</td>
                        </tr>
                        <tr>
                            <td>WEIGHT</td>
                            <td>3.0g</td>
                        </tr>
                        <tr>
                            <td>수량</td>
                            <td>
                                <input type="number" id="amount" name="amount" style="width: 30%;" placeholder="0"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="fs-5 mb-3">
                    
                    <button class="btn btn-lg btn-outline-dark flex-shrink-0" type="button">
                        <i class="bi-cart-fill me-1"></i>
                        바로 구매
                    </button>

                    <button class="btn btn-lg btn-outline-dark flex-shrink-0" type="button">
                        <i class="bi bi-bag-plus"></i>
                        장바구니
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="container px-4 px-lg-5 my-5">
        <h2 class="fw-bolder mb-4">Photo Review</h2>
        <div class="scrollbar">
            <div class="handle">
                <div class="mousearea"></div>
            </div>
        </div>

        <div class="frame">
            <ul class="slidee">
                <li>1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>
                <li>6</li>
                <!-- <li>7</li>
                <li>8</li>
                <li>9</li>
                <li>10</li>
                <li>11</li>
                <li>12</li>
                <li>13</li> -->          
            </ul>
        </div>
        <script>
            var sly = new Sly($('.frame'), {
                horizontal: 1, // required
                itemNav: 'basic', // required
                smart: 1,
                mouseDragging: 1,
                touchDragging: 1,
                releaseSwing: 1,
                scrollBy: 1,
                speed: 300,
                elasticBounds: 1,
                dragHandle: 1,
                dynamicHandle: 1,
                scrollBar : $(".scrollbar"),
                clickBar: 1
            }, null).init();
            
        </script>
    </div>
    <div class="container px-5 px-lg-5 my-5">
        <div class="reviews-title">
            <h1>Reviews</h1>
        </div>
        <div class="reviews-header">
            <div class='RatingStar mb-3'>
                <div class='RatingScore'>
                    <div class='outer-star'>
                        <div class='inner-star'></div>
                    </div>
                    <span>
                        2.5 (10 reviews)
                    </span>
                </div>
            </div>
            <button class="insert-review">리뷰 작성하기</button>
        </div>
        <div class="reviews-line"></div>
        <div class="reviews-content">
            <div class="review-info">
                <p>임*린</p>
                <p>2022/1/24</p>
                <div class='RatingStar mb-3'>
                    <div class='RatingScore'>
                        <div class='outer-star'>
                            <div class='inner-star'></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="review-detail">
                <h5>(댓글제목) 이거 진짜 사진보다 실물이 더 예쁨</h5>
                <p>사진으로 봣을때보다 실물이 훨씬 이쁘네요 진짜 마음에 들어여.... 지인들한테 다 추천해주는중 여러분들 고민말고 사세여 사진으로 봣을때보다 실물이 훨씬 이쁘네요 진짜 마음에 들어여.... 지인들한테 다 추천해주는중 여러분들 고민말고 사세여</p>
            </div>
            <div class="review-img">
                <img src="${path }/resources/images/sale1.png" alt="" width="120px" height="120px">
            </div>
        </div>
        <div class="reviews-line"></div>
        <div class="reviews-content">
            <div class="review-info">
                <p>임*린</p>
                <p>2022/1/24</p>
                <div class='RatingStar mb-3'>
                    <div class='RatingScore'>
                        <div class='outer-star'>
                            <div class='inner-star'></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="review-detail">
                <h5>(댓글제목) 이거 진짜 사진보다 실물이 더 예쁨</h5>
                <p>사진으로 봣을때보다 실물이 훨씬 이쁘네요 진짜 마음에 들어여.... 지인들한테 다 추천해주는중 여러분들 고민말고 사세여 사진으로 봣을때보다 실물이 훨씬 이쁘네요 진짜 마음에 들어여.... 지인들한테 다 추천해주는중 여러분들 고민말고 사세여</p>
            </div>
            <div class="review-img">
                <img src="${path }/resources/images/sale1.png" alt="" width="120px" height="120px">
            </div>
        </div>
        <div class="reviews-line"></div>
        <div class="reviews-content">
            <div class="review-info">
                <p>임*린</p>
                <p>2022/1/24</p>
                <div class='RatingStar mb-3'>
                    <div class='RatingScore'>
                        <div class='outer-star'>
                            <div class='inner-star'></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="review-detail">
                <h5>(댓글제목) 이거 진짜 사진보다 실물이 더 예쁨</h5>
                <p>사진으로 봣을때보다 실물이 훨씬 이쁘네요 진짜 마음에 들어여.... 지인들한테 다 추천해주는중 여러분들 고민말고 사세여 사진으로 봣을때보다 실물이 훨씬 이쁘네요 진짜 마음에 들어여.... 지인들한테 다 추천해주는중 여러분들 고민말고 사세여</p>
            </div>
            <div class="review-img">
                
            </div>
        </div>
        <div class="reviews-line"></div>
    </div>
    <!-- 페이지바 -->
    <div style="margin:0 auto;">
        <nav aria-label="Page navigation example" style="margin: 0 auto;">
            <ul class="pagination">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
        </nav>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>