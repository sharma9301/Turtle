<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
                <button type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">지도 보기</button>

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
                <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">
				  지도 보기
				</button>
            </div>
        </div>


	<!-- Modal1 -->
	<div class="modal fade modal-dialog modal-dialog-centered modal-dialog-scrollable" id="exampleModal" tabindex="-1" 
			aria-labelledby="exampleModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">터틀스토어 김포점</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div id="map1" style="width:100%;height:300px;"></div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
    </section>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c953b8b45faf16f4dc41e5ce985d5b4e&libraries=services"></script>
<script>
    var mapContainer1 = document.getElementById('map1'), // 지도를 표시할 div 
    mapOption1 = {
        center: new kakao.maps.LatLng(37.5974095,126.7856206), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
		// 지도를 생성합니다    
		var map1 = new kakao.maps.Map(mapContainer1, mapOption1); 
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder1 = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder1.addressSearch('경기도 김포시 고촌읍 아라육로152번길 100', function(result, status) {
    		// 정상적으로 검색이 완료됐으면 
	    	if (status === kakao.maps.services.Status.OK) {
	        	var coords1 = new kakao.maps.LatLng(result[0].y, result[0].x);
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker1 = new kakao.maps.Marker({
		            map: map1,
		            position: coords1
		        });
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow1 = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">터틀스토어 김포점</div>'
	        });
	        infowindow1.open(map1, marker1);
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map1.setCenter(coords1);
    	} 
	});    
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>