<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />
</head>

<body>
	<%@ include file="/WEB-INF/views/include/menu.jsp"%>
	<!-- Page header with logo and tagline-->
	<header class="py-5 bg-light border-bottom mb-4">
		<div class="container">
			<div class="text-center my-5">
				<h1 class="fw-bolder">로그인페이지</h1>
				<p class="lead mb-0">로그인을 위한 아이디, 비밀번호 입력 페이지</p>
			</div>
		</div>
	</header>
	<!-- Page content-->
	<div class="container">
		<!-- 컨텐츠 시작 -->
		<div class="card mb-4 mx-auto" style="width: 500px;">
			<div class="card-body">
				<div class="card-title">로그인</div>
				<form action="/memberLogin" method="get">
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">아이디</label> <input
							type="text" name="userPw" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp">
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
					<button type="submit" class="btn btn-primary">로그인</button>
				</form>
				<div class="row m-1">
					<a id="kakao-login-btn" href="javascript:loginWithKakao()"> <img
						src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
						width="222" alt="카카오 로그인 버튼" />
					</a>
					<p id="token-result"></p>
				</div>
			</div>
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
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
		integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
			Kakao.init('f27f610181c7185c2861db20210a1bd5');
			console.log(Kakao.isInitialized());
			function memberLogin_kakao(){
				console.log("카카오 계정으로 로그인")
				Kakao.API.request({
 				 url: '/member/memberLogin', // 사용자 정보 가져오기
				})
 				 .then(function(response) {
 				   console.log(response)
 				 })
 				 .catch(function(error) {
  				  console.error(error)
  				})
			}
            </script>




</body>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
	integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh"
	crossorigin="anonymous"></script>
<script>
  Kakao.init('f27f610181c7185c2861db20210a1bd5'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/memberLoginForm',
    });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>

</html>