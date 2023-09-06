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
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
            <!-- Core theme CSS (includes Bootstrap)-->
            <link href="/resources/css/styles.css" rel="stylesheet" />
        </head>

        <body>
        	<%@ include file="/WEB-INF/views/include/menu.jsp" %>
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
            <!-- 컨텐츠 시작 -->
            
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
            <script type="text/javascript">
            $(document).ready(function (){
    			if('${msg}'!=''){
    				alert('${msg}');
    			}
    		})
    		</script>
        </body>

        </html>