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
            	.displayinline{
            		display: inline-block;
            	}
            	.min_hei{
            		min-height: 397px;
            	}
            	.unselectList{
            		cursor: pointer;
            		border-radius:5px;
            		margin-bottom:3px;
            		margin-top:3px;
            		border:1px solid gray;
            		color:gray;
            	}
            	.selectList{
            		cursor: pointer;
            		border-radius: 5px;
            		margin-bottom: 3px;
            		margin-top:3px;
            		padding: 3px;
            		
            		border: 3px solid black;
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
            			<div class="card-body p-2 selectArea" id="scDateArea">
            			</div>
            		</div>
            	</div>
            	<div class="col-lg-3 col-md-6 p-2">
            		<div class="card mb-4">
            			<div class="card-body p-2 selectArea" id="scTimeArea">
            			</div>
            		</div>
            	</div>
            	
            </div>
            <div class="row">
            	<div class="col-lg-3">
            		<div class="card mb-4 min_hei">
            			<div class="card-body p-2" style="text-align:center;">
            				<h5>선택한 영화</h5>
            				<p class="card-text" id="selectMovTitle">영화 제목</p>
            				<img id="selectMovPoster" style="max-width:200px; height: auto; border-radius:10px;">
          	  			</div>
          		  	</div>
            	</div>
            	<div class="col-lg-3">
            		<div class="card mb-4 min_hei">
            			<div class="card-body p-2" style="text-align:center;">
            			<h5>
            				선택 극장
            			</h5>
            				<p id="selectThname"></p>
            			</div>
            		</div>
            	</div>
            	<div class="col-lg-3">
            		<div class="card mb-4 min_hei" style="text-align:center;">
            			<div class="card-body p-2"id="selectDate">
            			<h5>
            				선택한 날짜 및 시간
            			</h5>
            				<p id="scDate"></p>
            			<h5>
            				선택한 극장
            			</h5>
            				<p id="schall"></p>
            				
            			</div>
            		</div>
            	</div>
            	<div class="col-lg-3">
            		<div class="card mb-2">
            				<button class="btn btn-danger" onclick="movieReserve()">예매하기</button>
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
            <%--
            	c태그로 목록을 모두 출력해둔 상태에서 처음에 받아온 오브젝트와 영화나 극장 선택후 가져오는 오브젝트와
            	비교해서 다른 오브젝트는 클릭할 수 없는 상태의 스타일 입히기(숙제)
             --%>
            
    		<script type="text/javascript">
    			$(document).ready(function (){
    				if("${sessionScope.loginId}" == ""){
    					location.href="/?msg=로그아웃되었습니다.";
    				}
					let mvList = getReserveMovieList('1');	
					printMovieList(mvList);
					let thList = getReserveTheaterList('1');
					printTheaterList(thList);
    			})
    			
    		</script>
    		<script type="text/javascript">
    		//영화 예매 목록 가져오기
			function getReserveMovieList(thcode){
    			let mvList = '';
				$.ajax({
					url:"/getMvList",
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
    		let reserve_first = null;
    		let reserve_mvcode = null;
    		let reserve_thcode = null;
			let reserve_scdate = null;
			let reserve_schall = null;
			function printMovieList(mvList){
				let movAreaEl = document.querySelector("#movArea");
				movAreaEl.innerHTML = "";
				console.log(mvList);
				for(let mv of mvList){
					let selectListEl = document.createElement("div");
					selectListEl.setAttribute("class", "selectList");
					selectListEl.addEventListener("click", function(e){
						if(reserve_first == null){
							reserve_first = "mv";
						}
						removeSelectStyle(movAreaEl);
						e.target.classList.add("selectObj");
						selectMov = e.target.innerText;
						
						document.querySelector("#selectMovPoster").setAttribute("src",mv.mvposter);
						document.querySelector("#selectMovTitle").innerText = mv.mvtitle;
						if(reserve_first == "mv"){
							removeMvTh(reserve_first);
							printTheaterList(getReserveTheaterList(mv.mvcode));
							reserve_thcode = null;
							reserve_scdate = null;
							reserve_schall = null;						
						}
						
						reserve_mvcode = mv.mvcode;
						removeSchedule();
						if(reserve_first == "th"){
							reserve_scdate = null;
							reserve_schall = null;
							printScDateList( getScDateList(reserve_mvcode, reserve_thcode) )
						}
					})
					selectListEl.innerText=mv.mvtitle;

					movAreaEl.appendChild(selectListEl);
				}
			}
			//극장 예매 목록 가져오기
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
			
			function printTheaterList(thList){
				let thAreaEl = document.querySelector("#thArea");
				thAreaEl.innerHTML = "";
				
				for(let th of thList){
					let selectListEl = document.createElement("div");
					selectListEl.setAttribute("class", "selectList");
					selectListEl.addEventListener("click", function(e){
						if(reserve_first == null){
							reserve_first = "th";
						}
						removeSelectStyle(thAreaEl);
						e.target.classList.add("selectObj");
						if(reserve_first == "th"){
							removeMvTh(reserve_first);
							printMovieList(getReserveMovieList(th.thcode));
							reserve_mvcode = null;
							reserve_scdate = null;
							reserve_schall = null;
						}
						
						document.querySelector("#selectThname").innerText = th.thname;
						reserve_thcode = th.thcode;
						removeSchedule();
						if(reserve_first == "mv"){
							reserve_scdate = null;
							reserve_schall = null;
							printScDateList( getScDateList(reserve_mvcode, reserve_thcode) );
						}
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
			//스케쥴 날짜 가져오기
			function getScDateList(mvcode, thcode){
				let scList = null;
				$.ajax({
					url:"/getScList",
					type:"get",
					data:{"mvcode":mvcode, "thcode":thcode, "scdate":"1"},
					dataType:"json",
					async:false,
					success:function(rs){
						scList = rs;
					}
				})
				return scList;
			}
			//스케쥴 날짜 출력하기
			
			function printScDateList(scList){
				console.log("날짜 생성 기능")
				let dateArea = document.querySelector("#scDateArea");
				dateArea.innerHTML = '';
				let nowMM = null;
				for(let sc of scList){
					let selectListEl = document.createElement('div');
					selectListEl.setAttribute("class","selectList")
					selectListEl.classList.add("displayinline");
					let dateArr = sc.scdate.split("/");
					if(nowMM!=dateArr[1]){
						nowMM = dateArr[1];
						let mmDiv = document.createElement("div");
						mmDiv.innerText = dateArr[1]+"월";
						dateArea.appendChild(mmDiv);
					}
					selectListEl.innerText = dateArr[2]+"일";
					
					
					
					selectListEl.addEventListener("click", function(e){
						removeSelectStyle(dateArea);
						e.target.classList.add("selectObj");
						reserve_scdate = sc.scdate;
						document.querySelector("#scDate").innerText = reserve_scdate;
						document.querySelector("#schall").innerText = "";
						getSchedulesList(reserve_mvcode, reserve_thcode, reserve_scdate);
					})
					dateArea.appendChild(selectListEl);
				}
			}

			
			//스케쥴 목록 가져오기
			function getSchedulesList(mvcode, thcode, scdate){
				$.ajax({
					type:"get",
					url:"/getScList",
					data:{"mvcode":mvcode, "thcode":thcode, "scdate":scdate},
					dataType:"json",
					async:false,
					success:function(rs){
						printSchedulesList(rs);
					}
				})
			}
			//스케쥴 시간 홀 출력하기
			
				function printSchedulesList(scList){
					let timeArea = document.querySelector("#scTimeArea");
					timeArea.innerHTML ="";
					let nowHall = null;
						for(let sc of scList){
							if(nowHall != sc.schall){
								nowHall = sc.schall;
								let divEl = document.createElement("div");
								divEl.innerText = sc.schall;
								timeArea.appendChild(divEl);
							}
							
							let selectEl = document.createElement("div");
							selectEl.setAttribute("class","selectList");
							selectEl.classList.add("displayinline");
							selectEl.innerText = sc.scdate.split(" ")[1];
							selectEl.addEventListener("click", function(e){
								reserve_scdate = reserve_scdate.split(" ")[0] + " " + sc.scdate.split(" ")[1];
								reserve_schall = sc.schall;
								removeSelectStyle(timeArea);
								e.target.classList.add("selectObj");

								let scDateEl = document.querySelector("#scDate");
								scDateEl.innerText = "";
								let scHallEl = document.querySelector("#schall");
								scHallEl.innerText = "";
								scDateEl.innerText = reserve_scdate;
								scHallEl.innerText = reserve_schall;
							})
							timeArea.appendChild(selectEl);
						}
				}
			//스케쥴 목록 삭제
    		function removeSchedule(){
    			let dateArea = document.querySelector("#scDateArea");
    			let hallArea = document.querySelector("#scTimeArea");
    			let scDateEl = document.querySelector("#scDate");
    			let scHallEl = document.querySelector("#schall");
    			scHallEl.innerText = "";
				scDateEl.innerText = "";
    			dateArea.innerHTML = '';
    			hallArea.innerHTML = '';
    		}
			//선택된 영화나 극장 삭제 기능
			function removeMvTh(reserve_first){
				if(reserve_first == "mv"){
					document.querySelector("#selectThname").innerText = '';
				}else{
					document.querySelector("#selectMovPoster").removeAttribute("src");
					document.querySelector("#selectMovTitle").innerText = '';
				}
				
			}
    		</script>
    		<script type="text/javascript">
			// 예매 결제 기능
            function movieReserve(){
            	console.log("loginId : ${sessionScope.loginId}");
				console.log("reserve_mvcode : "+ reserve_mvcode);
				console.log("reserve_thcode : "+ reserve_thcode);
				console.log("reserve_scdate : "+ reserve_scdate);
				console.log("reserve_schall : "+ reserve_schall);
				if("${sessionScope.loginId}" == ""){
					alert('로그인후 이용가능합니다.');
					location.href = '/memberLoginForm';
				}else if(reserve_mvcode == null){
            		alert('영화를 선택해주세요!');
            	}else if(reserve_thcode == null){
            		alert('극장을 선택해주세요!');
            	}else if(reserve_scdate == null){
            		alert('날짜를 선택해주세요!');
            	}else if(reserve_schall == null){
            		alert('극장을 선택해주세요!');
            	}else{
            		//1. 카카오페이 API 결제준비요청
            		
            		//2. Controller INSERT 요청
	            	$.ajax({
						type:"post",
						url:"/registReserveInfo",
						async:false,
						data:{"mid":${sessionScope.loginId},"mvcode":reserve_mvcode, "thcode":reserve_thcode, "scdate":reserve_scdate,"schall":reserve_schall},
						success:function(rs){
							console.log(rs);
							if(rs){
								console.log("성공");							
							}else{
								console.log("실패");
							}
						}
					})	
            		
            		
            	}
            }
    		</script>
        </body>

        </html>