<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="header-line"></div>
	<section>
        <h1 id="store-title">Store</h1>
        <div id="store1" class="store-div">
            <div><img src="${path }/resources/images/store1.png" alt="본점"class="store-img" ></div>
            <div class="store-content">
                <h4>터틀스토어 가산디지털단지 본점</h4>
                <div class="store-line"></div>
                <h6>서울특별시 금천구 가산디지털2로 115 대륭테크노타운3차</h6>
                <p>
                    <strong>운영시간</strong>  10:00 - 20:00<br>
                    <strong>Tel</strong>   02-1234-1234
                </p>
                <button onclick="">지도 보기</button>
            </div>
        </div>
        <div id="store1" class="store-div">
            <div><img src="${path }/resources/images/store2.png" alt="타임스퀘어점"class="store-img" ></div>
            <div class="store-content">
                <h4>터틀스토어 영등포타임스퀘어점</h4>
                <div class="store-line"></div>
                <h6>서울 영등포구 영중로 15 타임스퀘어 2F</h6>
                <p>
                    <strong>운영시간</strong>  10:00 - 20:00<br>
                    <strong>Tel</strong>   02-6223-4789
                </p>
                <button onclick="">지도 보기</button>
            </div>
        </div>
        <div id="store1" class="store-div">
            <div><img src="${path }/resources/images/store3.png" alt="청주점"class="store-img" ></div>
            <div class="store-content">
                <h4>터틀스토어 청주점</h4>
                <div class="store-line"></div>
                <h6>충북 청주시 흥덕구 직지대로 308 현대백화점 충주점 1F</h6>
                <p>
                    <strong>운영시간</strong>  10:00 - 20:00<br>
                    <strong>Tel</strong>   02-9985-3456
                </p>
                <button onclick="">지도 보기</button>
            </div>
        </div>
        <div id="store1" class="store-div">
            <div><img src="${path }/resources/images/store4.png" alt="김포"class="store-img" ></div>
            <div class="store-content">
                <h4>터틀스토어 김포점</h4>
                <div class="store-line"></div>
                <h6>경기도 김포시 고촌읍 아라육로152번길 100<br> 김포현대프리미엄아울렛 1F</h6>
                <p>
                    <strong>운영시간</strong>  10:00 - 20:00<br>
                    <strong>Tel</strong> 02-863-3562
                </p>
                <button onclick="">지도 보기</button>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>