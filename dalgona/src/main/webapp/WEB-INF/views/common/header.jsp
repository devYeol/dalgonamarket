<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/header.css" />
<script type="text/javascript"
	src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<style>
	.input-searchModa{
		display: flex;
		width: 60%;
	}
	.search-modal{
		display: flex;
		justify-content: center;
		padding: 1rem 1rem;
		margin-top: 20;
	}
	.search-btn{
		margin-left: 5px; 
		border-radius: 10px; 
		font-size: 18px; 
		border: 1px solid white; 
		background-color: white; 
		color: #41464bd1
	}
	.search-form{
		background-color: #E2E2E2;
		width: 100%;
		padding: 0.375rem 0.75rem;
		font-size: 1rem;
		border: 0px solid #6c757d;
		color: black;
		border-radius: 10px;
	}
	.btn-secondary{
	background-color: #fff;
	border: 1px solid #fff;
	color: black;
	border-radius: 10px;
	}
</style>
<body style="background-color: white; font-family: 'NeoDunggeunmo';">
	<div id="container" style="font-size: 30px;">
		<header>
			<div>
				<div class="px-3 py-2">
					<div class="headcontainer" style="display: flex; justify-content: space-between;">
						<div class="d-flex flex-wrap align-items-center justify-content-left justify-content-lg-start">
							<ul class="nav col-6 col-lg-auto my-2 justify-content-center my-md-0 text-small">
								<li>
									<a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
										<span style="font-size: 40px;">DALGONA MARKET</span>
									</a>
								</li>
							</ul>
						</div>
						<div class="headcontainer" style="padding-left: 60px; padding-right: 60px;">
							<ul class="nav nav-pills">
								<li class="nav-item"><a href="${path}/admin/adminMain.do" class="nav-link" style="color: gray">ADMIN</a></li>
							</ul>
						</div>
						<div class="d-flex flex-wrap align-items-center justify-content-left justify-content-lg-start">
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
								style="border: 1px solid white; background-color: white; padding: 8 16 8 16;">
								<img src="/resources/images/header/search.svg" style="width: 24; height: 22; background-color: white; margin: 0;" >
							</button>
							<!-- Modal -->
							<form action="${path }/product/search.do" method="post">
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="height: 100%;">
								<div id="close" class="modal-dialog modal-xl " style="max-width: 100%;height:30%; transform: translate(0,-30px);">
									<div class="modal-content" style="height:100%">
										<div class="search-modal">
											<div class="input-searchModa">
											  <input name="keyword" type="text" class="search-form" placeholder="상품명을 입력하세요" aria-label="Recipient's username" aria-describedby="basic-addon2">
											</div>		
											<div>
												<button  type="submit" class="search-btn">검색</button>
											</div>							
										</div>
									</div>
								</div>
							</div>
							</form>
							<ul class="nav col-6 col-lg-auto my-2 justify-content-left my-md-0 text-small">
								<li>
									<a id="search-open" href="${path }/product/productList" class="nav-link text-black"> 
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
										  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
										</svg>
									</a>
								</li>
								<li>
									<a id="search-open" href="${path }/member/mypage/cart" class="nav-link text-black"> 
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
											<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
										</svg>
									</a>
								</li>
								<c:if test="${loginMember == null}">
								<li>
									<a href="${path }/loginpage" class="nav-link text-black">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="28" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
 											<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
										</svg>
									</a>
								</li>
								</c:if>
								<c:if test="${loginMember != null }">
									<li>
										<a href="${path}/member/mypage/mypageMain" class="nav-link text-black">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="28" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
		  										<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
		  										
											</svg>
										</a>
									</li>
										<button class="btn" onclick="location.replace('${path }/member/logout')">로그아웃</button>
								</c:if>
							</ul>
							
						</div>
					</div>
				</div>
			</div>
			<%-- <div>
				<div class="headcontainer border-top" style="padding-left: 60px; padding-right: 60px;">
					<div class="d-flex flex-wrap justify-content-center py-3 mb-1">
						
						<ul class="nav nav-pills">
							<li class="nav-item"><a href="${path}/admin/adminMain.do"
								class="nav-link" style="color: gray">ADMIN</a></li>
						</ul>
					</div>
				</div>
			</div> --%>
		</header>
	</div>


	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="facebook" viewBox="0 0 16 16">
    <path
			d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
  </symbol>
  <symbol id="instagram" viewBox="0 0 16 16">
      <path
			d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
  </symbol>
  <symbol id="twitter" viewBox="0 0 16 16">
    <path
			d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
  </symbol>
  
  <script>
  	/* $('html').on("click",function(e){
  		if(!$(e.target).hasClass(".modal-content"))
  			$(".modal-content").css({visibility:"heide",opacity:0});
  	}); */
  </script>
</svg>