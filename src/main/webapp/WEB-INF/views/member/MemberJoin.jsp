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
            <script src="https://kit.fontawesome.com/65020fc203.js" crossorigin="anonymous"></script>
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
           			회원가입
           			</div>
           			<form action="/memberJoin" method="post" enctype="multipart/form-data" onsubmit="return checkInfo(this)">
 						 <div class="mb-3">
 						   <label class="form-label" id="idLabel">아이디</label>
 						   <input type="text" onblur="checkId(this.value)" placeholder="Id" name="mid"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
 						   <%--
 						   <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
 						    --%>
 						 </div>
						 <div class="mb-3">
						    <label class="form-label">비밀번호</label>
						    <input type="text" name="mpw" placeholder="PassWord" class="form-control">
						 </div>
						 <div class="mb-3">
						    <label class="form-label">이름</label>
						    <input type="text" name="mname" placeholder="Name" class="form-control">
						 </div>
 						 <%--
 						 <div class="mb-3 form-check">
 						   <input type="checkbox" class="form-check-input" id="exampleCheck1">
 						   <label class="form-check-label" for="exampleCheck1">Check me out</label>
 						 </div>
 						 아이디 비밀번호 이름 이메일 생일 프로필
 						 --%>
 						 	<label class="form-label">이메일</label>
 						 <div class="input-group mb-3">
 							 <input type="text" class="form-control" name="EmailId" placeholder="Username" aria-label="Username">
 							 <span class="input-group-text">@</span>
 							 <input type="text" class="form-control" name="EmailDomain" placeholder="Server" aria-label="Server">
						</div>
						
 						 	<label class="form-label">프로필 사진</label>
						<div class="mb-3">
 							 <input type="file" name = "mprofiledata"class="btn" value ="파일선택">
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
            <script type="text/javascript">
            
            let rs_check_id = false;
            	function checkId(mid){
            		$.ajax({
            			type:"get",
            			url:"/checkId",
            			data:{"mid":mid},
            			async:false,
            			success:function(rs){
            				if(rs==""){
            					rs_check_id = true;
            				}else{
            					rs_check_id = false;
            				}
            				console.log(rs_check_id);
            				let idLabel = document.querySelector("#idLabel");
            					idLabel.innerHTML = "";
            					idLabel.innerText = "아이디";
            				if(rs_check_id){
            					idLabel.innerHTML = idLabel.innerHTML+"<i class='fa-solid fa-check'></i>";
            				}else{
            					idLabel.innerHTML = idLabel.innerHTML+"<i class='fa-solid fa-xmark'></i>";
            				}
            			}
            			
            		})
            	}
            	function checkInfo(obj){
            		
            		if(!rs_check_id){
            			alert("아이디 중복체크를 해주세요");
            			return false;
            		}
            		
            		if(obj.mpw.value == ""){
            			alert("비밀번호를 입력해주세요")
            			return false;
            		}
            		if(obj.mname.value == ""){
            			alert("이름을 입력해주세요")
            			return false;
            		}
            		return true;
            	}
            	$(document).ready(function (){
        			if('${msg}'!=''){
        				alert('${msg}');
        			}
        		})
            </script>
        </body>

        </html>