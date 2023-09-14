<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>영화예매프로젝트 - MOVIESPROJECT</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
        
        <style type="text/css">
        	.movie_poster{
        		max-width: 70%;
        		height: auto;
        		border-radius: 10px;
        			
        	}
        	/* omg-fluid */
        	
        </style>
        
        
    </head>
    <body>
    	<!-- 메뉴 시작 -->
        <!-- Responsive navbar includes-->
        
        <%@include file="/WEB-INF/views/include/menu.jsp" %>
        
        <!-- 메뉴 끝 -->
        
        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">영화 정보 페이지</h1>
                    <p class="lead mb-0">영화 랭킹 1위~6위 목록 출력</p>
                </div>
            </div>
        </header>
        
        <!-- Page content-->
        <div class="container">
            
        <!-- 컨텐츠 시작 -->
        <!-- 영화정보 출력 - row 시작 -->
        <div class="row my-4">
        	<div class="col-lg-5" style="text-align: center;">
				<img class="movie_poster" src="${mv.mvposter }" alt="" >
        	</div>
        	<div class="col-lg-7 pt-2">
               <div class="card-body pt-5">
                   <div class="small text-muted mb-1">예매율</div>
                   <h2 class="card-title mb-2" title="" >${mv.mvtitle }</h2>
                   <p class="card-text mb-1"> 감독 : ${mv.mvdirector } / 배우 : ${mv.mvactors } </p>
                   <p class="card-text mb-1"> 장르 : ${mv.mvgenre } / 기본정보 : ${mv.mvinfo } </p>
                   <p class="card-text mb-4"> 개봉일 : ${mv.mvopen }</p>
                   <a class="btn btn-danger" href="#!">예매하기</a>
               </div>        		
        	</div>
        </div>    	
        <!-- 영화정보 출력 - row 끝 --> 
        
        <!-- 관람평 출력 - row 시작 -->
        <div class="row my-3" style="">
        	
        </div>
           	
        <!-- 관람평 출력 - row 끝 -->
        
        <!-- 컨텐츠 끝 -->
            
        </div>
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

