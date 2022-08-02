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
<body style="padding-left: 500px">
	<!-- nav bar -->
	<nav class="navbar navbar-expand-md navbar-light">
		<button class="navbar-toggler ml-auto mb-2 bg-light" type="button" data-toggle="collapse" data-target="#sidebar">
			<span class="navbar-toggle-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="sidebar">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-3 sidebar fixed-top"></div>
					<div class="col-lg-9 ml-auto bg-dark fixed-top py-2" style="position-left: 200px"></div>
				</div>
			</div>
		</div>
	</nav>
	<!-- end of nav bar -->
</body>
</html>