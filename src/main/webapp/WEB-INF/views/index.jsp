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
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
            <style type="text/css">
            	.ageInfo{
            		position: absolute;
            		top: 5px;
            		left: 5px;
            		background-color: white;
            		text-align: center;
			 	   border-radius: 12px;
			 	   padding: 5px;
				    font-weight: bold;
				    color: white;
            	}
            	.gradeAll{
        		background-color: green;
        		}
        		.grade12{
        		background-color: yellow;
       		 	}
       	 		.grade15{
       		 	background-color: coral;
        		}
        		.grade19{
        		background-color: red;
        		}
        		.rankMov{
        			background-color:red;
        			margin-bottom: 5px;
        			border-radius: 5px;
        			text-align: center;
        			color: white;
        			font-size:18px;
        			font-weight:bold;
        		}
            </style>
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
                <div class="row">
                    <!-- Blog entries-->
                    <div class="col-lg-8">
                        <!-- Featured blog post-->

                        <!-- Nested row for non-featured blog posts-->
                        <div class="row">
                            <c:forEach items="${mvList }" var="mv" varStatus="status">
                                <div class="cal-md-6 col-lg-4">
                                <div class="rankMov">No.${status.index+1 }</div>
                                    <!-- Blog post-->
                                    <div class="card mb-4">
                                        <a href="/detailMovie?mvcode=${mv.mvcode }"><img class="card-img-top" src="${mv.mvposter }" alt="..." /></a>
                                        <span class="ageInfo grade${mv.mvstate }">${mv.mvstate }</span>
                                        <div class="card-body">
                                            <div class="small text-muted">예매율</div>
                                            <h2 class="card-title h4" title="${mv.mvtitle }" style="overflow:hidden; white-space:nowrap;">${mv.mvtitle } + ${mv.mvopen}</h2>
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
                            <c:choose>
                            	<c:when test="${sessionScope.loginId == null}">
                            <div class="card-header" style="text-align:center;">
                            		로그인 후 이용 해주세요!
                            </div>
                            <div class="card-body">
                                <div class="input-group">
                                    <button class="btn btn-primary" id="button-search" type="button" style="width:100%;" onclick="location.href='/memberLoginForm'" type="button">로그인</button>
                                </div>
                            </div>
                            	</c:when>
                            	<c:otherwise>
                            <div class="card-header" style="text-align:center;">
                            		MOVIE PROJECT
                            </div>
                            <div class="card-body">
                                <div class="input-group" style="display:flex;">
                               		<c:if test="${sessionScope.loginState == 'YC' }">
                               		
                               			<c:if test="${sessionScope.loginProfile == null }">
                               			<img style="width: 70px; border-radius: 50%; height: 70px; object-fit: contain" src="/resources/memberProfile/defaultProfile.jpg">
                               			</c:if>
                               		
                               			<c:if test="${sessionScope.loginProfile != null }">
		                        		<img style="width: 70px; border-radius: 50%; height: 70px; object-fit: contain" src="/resources/memberProfile/${sessionScope.loginProfile }">
                               			</c:if>
		                        	</c:if>
		                        	
		                        	<c:if test="${sessionScope.loginState == 'YK' }">
		                        	<img style="width: 70px; border-radius: 50%; height: 70px; object-fit: contain" src="${sessionScope.loginProfile }">
		                        	</c:if>
		                        	<h2>${sessionScope.loginName}</h2>
                                </div>
                            </div>
                            	
                            	</c:otherwise>
                            </c:choose>
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
                                            <li><a href="/reserveList">예약확인</a></li>
                                            <li><a href="/memberJoinForm">회원가입</a></li>
                                            <li><a href="/home">영화 정보</a></li>
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
            <script type="text/javascript">
            console.log('${sessionScope.loginProfile}');
            $(document).ready(function (){
    			if('${msg}'!=''){
    				alert('${msg}');
    			}
    		})
            </script>
        </body>

        </html>