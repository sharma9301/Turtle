<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path }/resources/css/service.css" rel="stylesheet" type="text/css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="header-line"></div>
	<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sidebars/">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    

    

    


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      td{
		 vertical-align: middle;
		}
    </style>

    
    <!-- Custom styles for this template -->
    <link href="mypage.css" rel="stylesheet">
  </head>
  <body>    

  <!-- 페이지내용 -->

  <div class="container" style="min-height:500px;">




      <!-- 페이지본문 -->
      <div class="csTitle"><h1>장바구니</h1></div>

      <%-- <c:out value="${cart }"/> --%>
       <input type="hidden" value="${loginMember.userId }" id="userId">  
         <!-- 사진 이름 상품코드 갯수 가격 -->
         <div class="col" style="margin: 20px 0 100px;">
             <div class="card">
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <table style="text-align: center;">
                                <tr>
                                    <th>
                                        <!-- <input type="checkbox" checked="checked" id="allChk">
                                        <span class="checkmark" >전체선택</span> -->
                                        상품 이미지
                                    </th>
                                    <th>상품명</th>
                                    <th>상품코드</th>
                                    <th>사이즈</th>
                                    <th>수량</th>
                                    <th>상품가격</th>
                                    <th></th>
                                </tr>
	                                <c:if test="${not empty cart}">
          								<c:forEach items="${cart }" var="c">
			                                <tr>
			                                    <td>
			                                        <!-- <input type="checkbox" checked="checked" class="rowChk_productNo"> -->
			                                        <img src="${path }/resources/images/product/${c.PD_IMAGE}" width="80px" height="80px" alt="상품사진">
			                                    </td>
			                                    <td>
			                                    	<c:out value="${c.PD_NAME}"/>
			                                    	<input type="hidden" value="${c.CART_NO }">
			                                    </td>
			                                    <td><c:out value="${c.PD_CODE }"/></td>
			                                    <td>
			                                    <c:if test="${0 ne c.OPT_SIZE}"><c:out value="${c.OPT_SIZE}"/></c:if>
			                                    <c:if test="${0 eq c.OPT_SIZE}"><c:out value="FREE"/></c:if>
			                                    </td>
			                                    <td>
			                                        <input type="number" class="form-control-sm amount" value="${c.AMOUNT}" min="1" max="5">
			                                        <button type="button" class="btn btn-primary btn-sm change" style="margin:0 0 5px 2px;">변경</button>
			                                    </td>
			                                    <td><c:out value="${c.PD_PRICE * c.AMOUNT }"/></td>
			                                    <td>
				                                    <button type="button" class="btn btn-outline-secondary" onclick="location.assign('${path}/product/cartOrderProduct.do?userId=${loginMember.userId }&pdCode=${c.PD_CODE }&amount=${c.AMOUNT}&size=${c.OPT_SIZE}')">주문하기</button>
				                                    <button type="button" class="btn btn-outline-secondary" onclick="location.assign('${path}/member/mypage/cartDelete?cartNo=${c.CART_NO}&userId=${c.USER_ID }')">삭제하기</button>
				                                    <button type="button" class="btn btn-outline-secondary" onclick="location.assign('${path}/product/productDetail.do?pdCode=${c.PD_CODE}')">상세보기</button>
			                                    </td>
			                                </tr>
	                               		</c:forEach>
									</c:if>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	            <%-- <div class="row" style="text-align:right; margin-top: 20px;">
	                <div class="row">
	                    <div class="col">
	                    </div>
	                    <div class="col">
	                    </div>
	                    <div class="col">
	                    </div>
	                    <div class="col">
	                        <strong>
	                        <c:out value="총 수량 : "/>
								<c:set var = "sum" value = "0" />
								<c:forEach var="c" items="${cart}">
									<c:set var= "sum" value="${sum + c.AMOUNT}"/>
								</c:forEach>
								<c:out value="${sum }"/>
	                        </strong>
	                    </div>
	                    <div class="col">
	                        <strong>
	                        	<c:out value="총 금액 : "/>
								<c:set var = "sum" value = "0" />
								<c:forEach var="c" items="${cart}">
									<c:set var= "sum" value="${sum + (c.PD_PRICE * c.AMOUNT)}"/>
								</c:forEach>
								<c:out value="${sum }"/>
	                        </strong>
	                    </div>
	                    <div class="col" style="padding: 0;">
	                        <button type="submit" class="btn btn-secondary" id="cartOrderBtn">결제하기</button>
	                    </div>
	                    <script>
	                    $(()=>{
                        	//최소 한개 이상 클릭 안하면 온클릭 작동 못하게 하는 로직
                            let rowChk = document.getElementsByClassName("rowChk_productNo");
                            console.log(rowChk);
                            let orderNo = "";
                            let deliveryComp = "";
                            let invoice = "";
                            let updateData = "";
                            
                            //카트에서 결제페이지 넘어가는 로직
                            $("#cartOrderBtn").click(e=>{
                                console.log(rowChk);
                                let i = 0;
                                let count = 0;
                                updateData = "";
                                for(i=0; i<rowChk.length; i++) {
                                    if(rowChk[i].checked){
                                        console.log("체크 됨");
                                        count++;
                                    	
                                        
                                    	updateData += orderNo+"/"+deliveryComp+"/"+invoice;
                                    	updateData += ",";
                                    	
                                    }
                                }
                                if(count==0){
                                    console.log("체크 아무것도 안됨");
                                    alert("최소 1개 이상의 주문 내역을 선택해주세요.");
                                    return;
                                }
                                console.log("여기까지 도달하면 체크 한개 이상 된 것.");
                                // 여기 밑에 로직 적기
                                updateData = updateData.replace(/,$/, "");
                                console.log(updateData);
                                
                                //location.assign("${path}/admin/updateInvoice.do?updateData="+updateData);
                                
                                
                            });
                            
                        });
	                    </script>
	                </div>
	            </div>  --%>
	      </div>


  <script>

      $(()=>{
         
            //allChk 로직
            $("#allChk").click(e=>{
                if($("#allChk").is(":checked")){
                    $(".rowChk_productNo").prop("checked", true);
                }else{
                    $(".rowChk_productNo").prop("checked", false);
                }
            });
            $(".rowChk_productNo").click(e=>{
                let total = $(".rowChk_productNo").length;
                let checked = $(".rowChk_productNo:checked").length;

                if(total != checked){
                    $("#allChk").prop("checked",false);
                }else{
                    $("#allChk").prop("checked",true);
                }
            });
            
            $(".change").click(e=>{
            	   
           			let userId =$("#userId").val();
           			console.log(userId);
            	   	console.log(e.target.parentNode.childNodes[1].value);
            	   	let amount = e.target.parentNode.childNodes[1].value;
            	   	console.log(e.target.parentNode.parentNode.childNodes[3].childNodes[1].value);
            	   	let cartNo = e.target.parentNode.parentNode.childNodes[3].childNodes[1].value;
            	   	updateData = cartNo+"/" +userId + "/" + amount;
            	   	location.assign("${path}/member/mypage/changeAmount?updateData="+updateData);
            	   
            });
      });
    
      
      
      

    
      
      
    
      



    

  </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
