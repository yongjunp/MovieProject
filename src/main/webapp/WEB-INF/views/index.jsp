<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Blog Home - Start Bootstrap Template</title>
            <!-- Favicon-->
            <link rel="icon" type="image/x-icon" href="/resources/user/assets/favicon.ico" />
            <!-- Core theme CSS (includes Bootstrap)-->
            <link href="/resources/css/styles.css" rel="stylesheet" />
        </head>

        <body>
            <!-- 메뉴시작 -->
            <!-- Responsive navbar-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="/">MOVIES PROJECT</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation"><span
                            class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="#">영화</a></li>
                            <li class="nav-item"><a class="nav-link" href="#!">예매</a></li>
                            <li class="nav-item"><a class="nav-link" href="#!">메뉴1</a></li>
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Blog</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- 메뉴 종료 -->


            <!-- Page header with logo and tagline-->
            <header class="py-5 bg-light border-bottom mb-4">
                <div class="container">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder">메인페이지</h1>
                        <p class="lead mb-0">영화 랭킹 1위 ~ 6위 목록 출력</p>
                    </div>
                </div>
            </header>


            <!-- Page content-->
            <div class="container">
                <div class="row">
                    <!-- Blog entries-->
                    <div class="col-lg-8">
                        <!-- Featured blog post-->

                        <!-- Nested row for non-featured blog posts-->
                        <div class="row">
                            <c:forEach begin="1" end="6" step="1">
                                <div class="col-lg-4">
                                    <!-- Blog post-->
                                    <div class="card mb-4">
                                        <a href="#!"><img class="card-img-top" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87175/87175_320.jpg" alt="..." /></a>
                                        <div class="card-body">
                                            <div class="small text-muted">예매율</div>
                                            <h2 class="card-title h4">영화제목 + 개봉일</h2>
                                            <a class="btn btn-danger" href="#!">예매하기</a>
                                        </div>
                                    </div>
                                    <!-- Blog post-->
                                </div>
                            </c:forEach>

                        </div>
                        <!-- Pagination-->
                        
                    </div>
                    <!-- Side widgets-->
                    <div class="col-lg-4">
                        <!-- Search widget-->
                        <div class="card mb-4">
                            <div class="card-header">Search</div>
                            <div class="card-body">
                                <div class="input-group">
                                    <input class="form-control" type="text" placeholder="Enter search term..."
                                        aria-label="Enter search term..." aria-describedby="button-search" />
                                    <button class="btn btn-primary" id="button-search" type="button">Go!</button>
                                </div>
                            </div>
                        </div>
                        <!-- Categories widget-->
                        <div class="card mb-4">
                            <div class="card-header">회원메뉴</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="#!">예매내역</a></li>
                                            <li><a href="#!">HTML</a></li>
                                            <li><a href="#!">Freebies</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-6">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="#!">회원정보</a></li>
                                            <li><a href="#!">로그아웃</a></li>
                                            <li><a href="#!">Tutorials</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Side widget-->
                        <div class="card mb-4">
                            <div class="card-header">Side Widget</div>
                            <div class="card-body">You can put anything you want inside of these side widgets. They are
                                easy to use, and feature the Bootstrap 5 card component!</div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer-->
            <footer class="py-5 bg-dark">
                <div class="container">
                    <p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p>
                </div>
            </footer>
            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <script src="/resources/js/scripts.js"></script>
        </body>

        </html>