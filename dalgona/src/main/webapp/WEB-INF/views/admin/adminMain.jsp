<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/admin.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<!-- nav bar -->
	<nav class="navbar navbar-expand-md navbar-light">
		<button class="navbar-toggler ml-auto mb-2 bg-light" type="button"
			data-toggle="collapse" data-target="#sidebar">
			<span class="navbar-toggle-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="sidebar">
			<div class="container-fluid">
				<div class="row">
					<!-- sidebar -->
					<div class="col-lg-2 sidebar fixed-top">
						<a href="#"
							class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4 bottom-border">DALGONA
							MARKET</a>
						<div class="bottom-border pb-3">
							<!-- <img width="50"> -->
							<a href="#" class="text-white">ADMIN</a>
						</div>
						<ul class="navbar-nav flex-column mt-4">
							<li class="nav-item"><a href="#"
								class="nav-link text-white p-3 mb-2 sidebar-link"> <i
									class="fas fa-home text-white fa-lg mr-3"></i>메인페이지
							</a> <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">
									<i class="fas fa-home text-white fa-lg mr-3"></i>상품등록
							</a> <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">
									<i class="fas fa-home text-white fa-lg mr-3"></i>상품관리
							</a> <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">
									<i class="fas fa-home text-white fa-lg mr-3"></i>리뷰관리
							</a> <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">
									<i class="fas fa-home text-white fa-lg mr-3"></i>매출통계
							</a> <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">
									<i class="fas fa-home text-white fa-lg mr-3"></i>회원리스트
							</a> <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">
									<i class="fas fa-home text-white fa-lg mr-3"></i>결제/환불
							</a> <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">
									<i class="fas fa-home text-white fa-lg mr-3"></i>문의내역
							</a></li>
						</ul>
					</div>
					<!-- end of sidebar -->
					<!-- top navbar -->
					<!-- 	<div class="col-lg-9 ml-auto bg-dark fixed-top py-2">
						<div class="row">
							<div class="col-md-4">
								<h4 class="text-light text-uppercase mb-0">Dashboard</h4>
							</div>
							<div class="col-md-5"></div>
							<div class="col-md-3"></div>
						</div>
					</div> -->
					<!-- end of top navbar -->
					<!-- table -->
					<section>
						<div class="container-fluid">
							<div class="row mb-5">
								<h3 class="text-center mb-3">상품등록</h3>
								<table class="table bg-light text-center">
									<tbody>
										<tr class="text-muted">
											<td>상품명</td>
											<td><input type="text"></td>
										</tr>
										<tr class="text-muted">
											<td>카테고리</td>
											<td><input type="text"></td>
										</tr>
										<tr class="text-muted">
											<td>가격</td>
											<td><input type="text"></td>
										</tr>
										<tr class="text-muted">
											<td>수량</td>
											<td><input type="text"></td>
										</tr>
										<tr class="text-muted">
											<td>옵션</td>
											<td><input type="text"></td>
										</tr>
										<tr class="text-muted">
											<td>이미지</td>
											<td><input type="text"></td>
										</tr>
										<tr class="text-muted">
											<td>상품설명</td>
											<td><input type="text"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</section>
					<!-- end of table -->
				</div>
			</div>
		</div>
	</nav>
	<!-- end of nav bar -->
</body>
</html>