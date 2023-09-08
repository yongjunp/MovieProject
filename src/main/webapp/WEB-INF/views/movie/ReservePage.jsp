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
            <style type="text/css">
            	.selectList{
            		cursor: pointer;
            		border-radius: 5px;
            		margin-bottom: 3px;
            		margin-top:3px;
            		padding: 3px;
            		
            		border: 1px solid black;
            	}
            	.selectList:hover{
            		background-color: darkgray;
            	}
            	.selectObj{
            		background-color: black !important;
					color:white;
					font-weight: bold;
            	}
            	.selectArea{
            		height:400px;
            		overflow:scroll;
            	}
            </style>
        </head>

        <body>
        	<%@ include file="/WEB-INF/views/include/menu.jsp" %>
            <!-- Page header with logo and tagline-->
            <header class="py-5 bg-light border-bottom mb-4">
                <div class="container">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder">영화 예매 페이지</h1>
                        <p class="lead mb-0">영화, 극장, 날짜 선택 및 결제 페이지</p>
                    </div>
                </div>
            </header>
            <!-- Page content-->
            <div class="container">
            <!-- 컨텐츠 시작 -->
            <div class="row">
            	<div class="col-lg-3 col-md-6 p-2">
            		<div class="card mb-4">
            			<div class="card-body p-2 selectArea" id="movArea">
            			</div>
            		</div>
            	</div>
            	<div class="col-lg-3 col-md-6 p-2">
            		<div class="card mb-4">
            			<div class="card-body p-2 selectArea" id="thArea">
            			</div>
            		</div>
            	</div>
            	<div class="col-lg-3 col-md-6 p-2">
            		<div class="card mb-4">
            			<div class="card-body p-2">
            				<div class="selectList">날짜1</div>
            			</div>
            		</div>
            	</div>
            	<div class="col-lg-3 col-md-6 p-2">
            		<div class="card mb-4">
            			<div class="card-body p-2">
            				<div class="selectList">상영관 및 시간1</div>
            			</div>
            		</div>
            	</div>
            	
            </div>
            <div class="row">
            	<div class="col-lg-3">
            	<div class="card mb-4">
            		<div class="card-body p-2" style="text-align:center;">
            			<p class="card-text" id="selectMovTitle">영화 제목</p>
            			<img id="selectMovPoster" style="max-width:200px; height: auto; border-radius:10px;">
            		</div>
            	</div>
            	</div>
            	<div class="col-lg-6">
            	<div class="card mb-4">
            		<div class="card-body p-2"id="selectThname">
            			선택 극장 정보
            		</div>
            	</div>
            	</div>
            	<div class="col-lg-3">
            	<div class="card mb-2">
            		<div class="card-body p-2">
            			<button class="btn btn-danger">예매하기</button>
            		</div>
            	</div>
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
            $(document).ready(function (){
    			if('${msg}'!=''){
    				alert('${msg}');
    			}
    		})
    		</script>
    		<script type="text/javascript">
    			$(document).ready(function (){
					let mvList = getReserveMovieList('1');	
					printMovieList(mvList);
					let thList = getReserveTheaterList('1');
					printTheaterList(thList);
    			})
    			
    		</script>
    		<script type="text/javascript">
    		//영화 예매 목록 가져오기
    		/*
			function getReserveMovieList(){
    			let mvList = '';
				$.ajax({
					url:"getMvList",
					type:"get",
					dataType:"json",
					async : false,
					success:function(result){
						mvList = result;
					}
				})
				
				return mvList;	
			}
    		*/
			function getReserveMovieList(thcode){
    			let mvList = '';
				$.ajax({
					url:"getMvList",
					type:"get",
					data:{"thcode":thcode},
					dataType:"json",
					async : false,
					success:function(result){
						mvList = result;
					}
				})
				
				return mvList;	
			}
    		//영화 출력 기능
    		let reserve_mvcode = null; // 선택한 영화 코드를 저장할 변수
			function printMovieList(mvList){
				let movAreaEl = document.querySelector("#movArea");
				movAreaEl.innerHTML = "";
				
				for(let mv of mvList){
					let selectListEl = document.createElement("div");
					selectListEl.setAttribute("class", "selectList");
					selectListEl.addEventListener("click", function(e){
						removeSelectStyle(movAreaEl);
						e.target.classList.add("selectObj");
						selectMov = e.target.innerText;
						//1. 극장 목록 조회
						//2. 선택 정보 출력
						if(reserve_thcode == null){
							printTheaterList(getReserveTheaterList(mv.mvcode));							
						}
						
						document.querySelector("#selectMovPoster").setAttribute("src",mv.mvposter);
						document.querySelector("#selectMovTitle").innerText = mv.mvtitle;
						reserve_mvcode = '${mv.mvcode}';
						
					})
					selectListEl.innerText=mv.mvtitle;

					movAreaEl.appendChild(selectListEl);
				}
			}
			//극장 예매 목록 가져오기
			/*
			function getReserveTheaterList(){
				let thList ="";
				$.ajax({
					url:"getThList",
					type:"get",
					dataType:"json",
					async : false,
					success:function(result){
						thList = result;
					}
				})
				return thList
			}
			*/
			
			function getReserveTheaterList(mvcode){
				let thList ="";
				$.ajax({
					url:"getThList",
					type:"get",
					data:{"mvcode":mvcode},
					dataType:"json",
					async : false,
					success:function(result){
						thList = result;
					}
				})
				return thList
			}
			//극장 출력 기능
			let reserve_thcode = null;
			function printTheaterList(thList){
				let thAreaEl = document.querySelector("#thArea");
				thAreaEl.innerHTML = "";
				
				for(let th of thList){
					let selectListEl = document.createElement("div");
					selectListEl.setAttribute("class", "selectList");
					selectListEl.addEventListener("click", function(e){
						removeSelectStyle(thAreaEl);
						e.target.classList.add("selectObj");
						if(reserve_mvcode == null){
							printMovieList(getReserveMovieList(th.thcode));
						}
						
						document.querySelector("#selectThname").innerText = th.thname;
						reserve_thcode = "${th.thcode}";
					})
					selectListEl.innerText=th.thname;

					thAreaEl.appendChild(selectListEl);
				}
			}
			//선택 목록 지우기
			function removeSelectStyle(areaId){
				for(let El of areaId.querySelectorAll(".selectObj")){
					El.classList.remove("selectObj");	
				}
			}
    		</script>
        </body>

        </html>