<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>관리자 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path }/resources/css/adminStyles.css" rel="stylesheet" type="text/css">
        <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://kit.fontawesome.com/e3bf9144bc.js" crossorigin="anonymous"></script>
    </head>
    
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="${path }/admin/adminMainPage">관리자 페이지</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar-->
            <button type="button" class="btn btn-secondary ms-auto me-0 me-md-3 my-2 my-md-0"><i class="fas fa-sign-out-alt"></i>로그아웃</button>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <style>
                                /* 아이콘 중앙정렬 */
                                .sb-nav-link-icon{
                                    width: 20px;
                                    height: 20px;
                                    text-align: center;
                                }
                            </style>
                            <div class="sb-sidenav-menu-heading">Product</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseProduct" aria-expanded="false" aria-controls="collapseProduct">
                                <div class="sb-nav-link-icon"><i class="fas fa-tshirt"></i></div>
                                상품 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseProduct" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="${path }/admin/productList">상품 목록</a>
                                    <a class="nav-link" href="${path }/admin/productEnroll">상품 등록</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="${path }/admin/userOrderList">
                                <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                                주문 관리
                            </a>

							<a class="nav-link" href="/admin/stockManagement">
                                <div class="sb-nav-link-icon"><i class="fas fa-store"></i></div>
                                재고 관리
                            </a>

                            <div class="sb-sidenav-menu-heading">User</div>
                            <a class="nav-link" href="${path }/admin/memberList">
                                <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                                고객 관리
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">Board</div>
                            <a class="nav-link" href="${path }/admin/reviewList">
                                <div class="sb-nav-link-icon"><i class="fas fa-comments"></i></div>
                                리뷰 관리
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">로그인 되어 있는 계정:</div>
                        admin
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">