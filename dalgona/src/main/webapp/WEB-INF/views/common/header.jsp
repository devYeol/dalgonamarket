<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/header.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<div id="container">
		<header>
			<div>
				<div>인스타,페북,트위터</div>
				<div>검색,마이페이지,로그인,장바구니</div>
			</div>
			<div>
				<div class="container">
					<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-top">
						<a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
							<svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap" /></svg> <span class="fs-4">DALGONA MARKET</span>
						</a>
						<ul class="nav nav-pills">
							<li class="nav-item"><a href="#" class="nav-link" style="color: red">CUSTOMER</a></li>
							<li class="nav-item"><a href="#" class="nav-link">SHOP</a></li>
							<li class="nav-item"><a href="#" class="nav-link">EVENT</a></li>
						</ul>
					</header>
				</div>
			</div>
		</header>
	</div>