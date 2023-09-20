<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Home - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/resources/user/assets/favicon.ico" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
.thcolor {
	background-color: gray;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/include/menu.jsp"%>
	<!-- Page header with logo and tagline-->
	<header class="py-5 bg-light border-bottom mb-4">
		<div class="container">
			<div class="text-center my-5">
				<h1 class="fw-bolder">예매정보</h1>
				<p class="lead mb-0">내 예매 정보 확인</p>
			</div>
		</div>
	</header>
	<!-- Page content-->
	<div class="container">
		<!-- 컨텐츠 시작 -->
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">영화제목</th>
						<th scope="col">극장이름</th>
						<th scope="col">상영관</th>
						<th scope="col">날짜</th>
						<th scope="col">비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rsvList }" var="rsv">
					<tr>
						<td>${rsv.MVTITLE }</td>
						<td>${rsv.THNAME }</td>
						<td>${rsv.SCHALL }</td>
						<%@ page import="java.util.Date" %>
						<c:set var="today" value="<%=new Date()%>"></c:set>
						<fmt:parseDate value="${rsv.SCDATE }" var="scdate_fmt" pattern="yyyy/MM/dd HH:mm"></fmt:parseDate>
						<td>${rsv.SCDATE}</td>
						<td>
						<c:choose>
							<c:when test="${today > scdate_fmt }">
								<button class="btn btn-danger" onclick="location.href='/deleteReserve?recode=${rsv.RECODE}'">예약취소</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-primary">관람평</button>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 컨텐츠 종료 -->
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/resources/js/scripts.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			if ('${msg}' != '') {
				alert('${msg}');
			}
		})
	</script>
</body>

</html>