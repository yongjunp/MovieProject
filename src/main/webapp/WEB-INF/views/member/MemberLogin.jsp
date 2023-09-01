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
					<button class="btn btn-warning" type="button" onclick="memberLogin_kakao()">카카오 로그인 버튼
					</button>
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
	<!-- 카카오로그인 js -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
	integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh"
	crossorigin="anonymous"></script>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
  Kakao.init('f27f610181c7185c2861db20210a1bd5'); // 사용하려는 앱의 JavaScript 키 입력
  
  function memberLogin_kakao() {
	  console.log("카카오 로그인 호출()");
      Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/memberLoginForm',
    });
  }
   let authCode = '${param.code}';
   console.log("authCode : "+authCode);
  if(authCode.length > 0){
	  console.log("카카오_인가코드 있음");
	  console.log("인증토큰 요청");
	  $.ajax({
		  type:"post",
		  url:"https://kauth.kakao.com/oauth/token",
		  contentType:"application/x-www-form-urlencoded;charset=utf-8",
		  data:{"grant_type":"authorization_code",
			  "client_id":"3278e8d6e7d5b2347818f47d69d86a42",
			  "redirect_uri":"http://localhost:8080/memberLoginForm",
			  "code":authCode},
		success : function(response){
			console.log("인증토큰 : "+response.access_token);
			Kakao.Auth.setAccessToken(response.access_token);
			
			Kakao.API.request({
				  url: '/v2/user/me',
			})
				  .then(function(response) {
					  console.log('카카오 계정 정보');
					  console.log("id : "+response.id);
					  console.log("email : "+response.kakao_account.email)
					  console.log("nickname : "+response.properties.nickname);
					  console.log("profile_image : "+response.properties.profile_image);
					  //location.href=""
					  /* 카카오 계정 정보가 members 테이블에서 조회*/
					  $.ajax({
						  type:"get",
						  url:"/memberLogin_kakao",
						  data:{"id":response.id},
						  success:function(checkMember_kakao){
							  if(checkMember_kakao){
								  alert('로그인 되었습니다.');
								  location.href="/";
							  }else{
								  let check = confirm('가입된 정보가 없습니다 \n 카카오 계정으로 가입하시겠습니까?');
								  if(check){
									  console.log("asd");
									  memberJoin_kakao(response);
									  //회원가입 
								  }
							  }
						  }
					  })
					  

			})
				  .catch(function(error) {
				    console.log(error);
			});
		}
	  })
  }

</script>
<script type="text/javascript">
	function memberJoin_kakao(response){
		$.ajax({
			  type:"get",
			  url:"/memberJoin_kakao",
			  data:{"mid":response.id,
				  	"memail":response.kakao_account.email,
				  	"mname":response.properties.nickname,
				  	"mprofile":response.properties.profile_image},
		success:function(rs){
				  if(rs){
					  alert('카카오 계정으로  회원가입 되었습니다. \n다시 로그인 해주세요!');
					  location.href="/memberLoginForm";
				  }else{
					  console.log("회원가입 실패");
				  }
			  }
			  
			  })
	}
</script>
</body>

</html>