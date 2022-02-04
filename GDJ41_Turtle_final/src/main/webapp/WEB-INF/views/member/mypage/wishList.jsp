<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path }/resources/css/service.css" rel="stylesheet" type="text/css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

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

  <div class="container">




      <!-- 페이지본문 -->
      <div class="csTitle"><h1>장바구니</h1></div>

      
         
         <!-- 사진 이름 상품코드 갯수 가격 -->
         <div class="col" style="margin-top: 20px;">
             <div class="card">
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <table style="text-align: center;">
                                <tr>
                                    <th>
                                        <input type="checkbox" checked="checked" id="allChk">
                                        <span class="checkmark" >전체선택</span>
                                    </th>
                                    <th>상품명</th>
                                    <th>상품코드</th>
                                    <th>수량</th>
                                    <th>상품가격</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" checked="checked" class="rowChk_productNo">
                                        <img src="https://dummyimage.com/80x80/dee2e6/6c757d.jpg" alt="상품사진">
                                    </td>
                                    <td>silverring</td>
                                    <td>N123456</td>
                                    <td>
                                        <input type="number" class="form-control-sm" value="1" min="1" max="20">
                                    </td>
                                    <td>75,000</td>
                                    <td style="text-align:right"><button type="button" class="btn btn-outline-secondary">상세보기</button></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" checked="checked" class="rowChk_productNo">
                                        <img src="https://dummyimage.com/80x80/dee2e6/6c757d.jpg" alt="상품사진">
                                    </td>
                                    <td>silverring</td>
                                    <td>N123456</td>
                                    <td>
                                        <input type="number" class="form-control-sm" value="1" min="1" max="20">
                                    </td>
                                    <td>75,000</td>
                                    <td style="text-align:right"><button type="button" class="btn btn-outline-secondary">상세보기</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="row" style="text-align:right; margin-top: 20px;">
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                        <strong>총 수량 : </strong>
                    </div>
                    <div class="col">
                        <strong>총 금액 : </strong>
                    </div>
                    <div class="col" style="padding: 0;">
                        <button type="submit" class="btn btn-secondary">결제하기</button>
                    </div>
                </div>
            </div> 
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
      });
    // 
    

  </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>