<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/header.css" />
<script type="text/javascript" src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body style="background-color: white; font-family: 'NeoDunggeunmo';">
	<div id="container" style="font-size: 30px;">
		<header>
			<div>
			    <div class="px-3 py-2">
			      <div class="headcontainer" style="display:flex; justify-content: space-between; ">
			        <div class="d-flex flex-wrap align-items-center justify-content-left justify-content-lg-start">
			          <ul class="nav col-6 col-lg-auto my-2 justify-content-left my-md-0 text-small">
			            <li>
			              <a href="#" class="nav-link text-black">
			                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#facebook"/></svg>
			              </a>
			            </li>
			            <li>
			              <a href="#" class="nav-link text-black" >
			              	<i class="bi bi-search"></i>
			                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#instagram"/></svg>
			              </a>
			            </li>
			            <li>
			              <a href="#" class="nav-link text-black">
			                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#twitter"/></svg>
			              </a>
			            </li>
			          </ul>
			        </div>
			        <div class="d-flex flex-wrap align-items-center justify-content-left justify-content-lg-start">
				        	<button type="button" class="btn btn-primary" data-bs-toggle="modal"  data-bs-target="#exampleModal" style="border: 1px solid white; background-color: white">
							  <img src="/resources/images/header/search.svg" style="width:24; height:24; background-color: white">
							</button>
							
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-fullscreen">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							      </div>
							    </div>
							  </div>
			        		<!-- <button class="modal-btn" style="border: 1px solid white; background-color: white">
			        		</button> -->
			        	
			          <ul class="nav col-6 col-lg-auto my-2 justify-content-left my-md-0 text-small">
			         <!--    <li>
			            	<a href="#" class="nav-link text-black">
								<img src="/resources/images/header/search.svg" style="width:24; height:24">
			            	</a>
			            </li> -->
			            <li>
			              <a id ="search-open" href="#" class="nav-link text-black" >
			                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#instagram"/></svg>
			              </a>
			            </li>
			            <li>
			              <a href="#" class="nav-link text-black">
			                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#twitter"/></svg>
			              </a>
			            </li>
			          </ul>
			          </div>
			        </div>
			      </div>
			    </div>
				<!-- <div>인스타,페북,트위터</div>
				<div>검색,마이페이지,로그인,장바구니</div> -->
			</div>
			<div>
				<div class="headcontainer border-top" style="padding-left:60px; padding-right:60px;  ">
					<header class="d-flex flex-wrap justify-content-center py-3 mb-1">
						<a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
							 <span style="font-size:40px;">DALGONA MARKET</span>
						</a>
						<ul class="nav nav-pills">
							<li class="nav-item"><a href="${path}/admin/adminMain.do" class="nav-link" style="color: gray">ADMIN</a></li>
							<li class="nav-item"><a href="${path }/mypage/zzim" class="nav-link" style="color: red">CUSTOMER</a></li>
							<li class="nav-item"><a href="#" class="nav-link">SHOP</a></li>
							<li class="nav-item"><a href="#" class="nav-link">EVENT</a></li>
						</ul>
					</header>
				</div>
			</div>
			
		




 