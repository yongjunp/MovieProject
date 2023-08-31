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
        	<%@ include file="/WEB-INF/views/include/menu.jsp" %>
            <!-- Page header with logo and tagline-->
            <header class="py-5 bg-light border-bottom mb-4">
                <div class="container">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder">회원가입 페이지</h1>
                        <p class="lead mb-0">영화 랭킹 1위 ~ 6위 목록 출력</p>
                    </div>
                </div>
            </header>
            <!-- Page content-->
            <div class="container">
            <!-- 컨텐츠 시작 -->
            <div class="card mb-4 mx-auto" style="width:500px;">
           		<div class="card-body">
           			<div class="card-title">
           			로그인
           			</div>
           			<form action="/memberJoin" method="get">
 						 <div class="mb-3">
 						   <label for="exampleInputEmail1" class="form-label">아이디</label>
 						   <input type="text" name="userPw"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
 						   <%--
 						   <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
 						    --%>
 						 </div>
						 <div class="mb-3">
						    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
						    <input type="text" name="userPw" class="form-control">
						 </div>
 						 <%--
 						 <div class="mb-3 form-check">
 						   <input type="checkbox" class="form-check-input" id="exampleCheck1">
 						   <label class="form-check-label" for="exampleCheck1">Check me out</label>
 						 </div>
 						 --%>
 						 <div class="input-group mb-3">
 							 <input type="text" class="form-control" placeholder="Username" aria-label="Username">
 							 <span class="input-group-text">@</span>
 							 <input type="text" class="form-control" placeholder="Server" aria-label="Server">
						</div>
 						 <button type="submit" class="btn btn-primary">회원가입</button>
					</form>
           		</div>
           	</div>
          	<!-- 컨텐츠 종료 -->
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