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
<title>Turtle Store</title>
        <!-- css -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <!-- js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        
        <!-- Bootstrap core JS-->
        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
        <!-- Core theme JS-->
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
        
        <link href="${path }/resources/css/styles_gr.css" rel="stylesheet" />
        <link href="${path }/resources/css/styles.css" rel="stylesheet" />
        <link href="${path }/resources/css/service.css" rel="stylesheet" type="text/css">
        <link href="${path }/resources/css/horizontal.css" rel="stylesheet" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@500&family=Gowun+Batang&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
        <!-- 폰트 어썸 -->
 		<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'/>
        <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            *{
                font-family: "Gowun Batang";
            }
        </style>
    </head>
    <body>
        <!-- Header-->
        <header id="turtle-header">
            <div id="header-menu" class="header-menu">
                <nav id="left-menu" style="display: flex;">
                    <nav class="menu-category">
                        <li><a href="#" class="">Category</a></li>
                        <table class="category-sub-menu sub-tbl" style="z-index:2000">
                            <tr>
                                <td><a href="${path }/product/productList.do?title=All">All</a></td>
                                <td><a href="${path }/product/productCategoryList.do?title=Earrings">Earrings</a></td>
                            </tr>
                            <tr>
                                <td><a href="${path }/product/productBestList.do?title=Best">Best</a></td>
                                <td><a href="${path }/product/productCategoryList.do?title=Necklaces">Necklaces</a></td>
                            </tr>
                            <tr>
                                <td><a href="${path }/product/productNewList.do?title=New">New</a></td>
                                <td><a href="${path }/product/productCategoryList.do?title=Bracelets">Bracelets</a></td>
                            </tr>
                            <tr>
                                <td><a href="${path }/product/productSaleList.do?title=Sales">Sale</a></td>
                                <td><a href="${path }/product/productCategoryList.do?title=Rings">Rings</a></td>
                            </tr>
                        </table>
                    </nav>    
                    <li><a href="${path }/main/store">Store</a></li>
                    <li><a href="${path }/main/about">About</a></li>
                </nav>
                <h1 id="header-title" style="font-family: Dancing Script;" onclick="location.assign('${path}/')">Turtle Store</h1>
                <nav id="right-menu" style="display: flex;">
                    <li>
                        <a href="javascript:openSearch();">
                            <i class="bi bi-search"></i> Search
                        </a>
                    </li>
                    <!-- 로그아웃시 -->
                    <c:if test="${loginMember == null }">
                    	<li><a href="${path }/member/login/login">Log in</a></li>
                    </c:if>
                     <!-- 로그인시 -->
                     <c:if test="${loginMember != null }">
                    	<li><a href="${path }/logout.do">Log out</a></li>
                    	<li><a href="${path }/member/mypage/myMain">My page</a></li>
                    </c:if>
                    <!-- 장바구니버튼 -->
                    <li><a href="${path }/member/mypage/wishList"><img src="${path }/resources/images/pocket.png" width="20px" height="30px"></a></li>
                    <!-- 검색창 -->
                    <div id="myOverlay" class="overlay">
                        <span class="closebtn" onclick="closeSearch();" title="Close Overlay">x</span>
                        <div class="overlay-content">
                          <form action="#">
                            <input type="text" placeholder="Search.." name="search">
                            <button type="submit"><i class="bi bi-search"></i></button>
                          </form>
                        </div>
                    </div>
                </nav>
            </div>
        </header>     


<script>
    
    window.addEventListener("scroll",e=>{
        $("#myOverlay").hide();
    });

    $(()=>{
        $(".category-sub-menu").hide();
        $(".menu-category").mouseenter(e=>{
            $(".category-sub-menu").show();
        })
        $(".menu-category").mouseleave(e=>{
            $(".category-sub-menu").hide();
        })
    })

    // Open the full screen search box
    function openSearch() {
    document.getElementById("myOverlay").style.display = "block";
    }

    // Close the full screen search box
    function closeSearch() {
    document.getElementById("myOverlay").style.display = "none";
    }
    

</script>  





