<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
        	.ageInfo{
			    position: absolute; /*  */
    			top: 5px;
    			left: 5px;
    			
			    /*width: 30px;*/
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
                    <h1 class="fw-bolder">영화목록 페이지</h1>
                    <p class="lead mb-0">예매 가능한 영화 목록 출력</p>
                </div>
            </div>
        </header>
        
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <c:forEach items="${mvList}" var="mv" >
                     <div class="col-lg-3 col-md-4 col-sm-6">
                          <!-- Blog post-->
                          <div class="card mb-4">
                             <a href="/detailMovie?mvcode=${mv.mvcode }"><img class="card-img-top" src="${mv.mvposter }" alt="..." /></a>
                             <span class="ageInfo grade${mv.mvstate }">${mv.mvstate}</span>
                             <%--
                             <c:choose>
                             	<c:when test="${mv.mvstate == '전체관람가' }"><span class="ageInfo gradeALL" >ALL</span></c:when>
                             	<c:when test="${mv.mvstate == '12세이상관람가' }"><span class="ageInfo grade12" >12</span></c:when>
                             	<c:when test="${mv.mvstate == '15세이상관람가' }"><span class="ageInfo grade15" >15</span></c:when>
                             	<c:otherwise><span class="ageInfo grade19">19</span></c:otherwise>
                             </c:choose>
                               --%>
                               
                               
                               <div class="card-body">
                                   <div class="small text-muted">예매율</div>
                                   <h2 class="card-title h4" title="${mv.mvtitle }" style="overflow: hidden; white-space: nowrap;" >${mv.mvtitle } + ${mv.mvopen } </h2>
                                   <a class="btn btn-danger" href="#!">예매하기</a>
                               </div>
                          </div>
                     </div>
                 </c:forEach>
                        
            </div>
			
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
        console.log("${movieList.get(0).mvstate == '전체관람가' }")
        </script>
    </body>
</html>

