<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/admin.css" />
<%-- <script type="text/javascript" src="${path}/resources/js/admin.js"></script> --%>
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script> -->
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<!-- 메인 영역 -->
	<div class="container">
		<!-- 사이드바 영역 -->
		<jsp:include page="/WEB-INF/views/admin/adminSidebarForm.jsp">
			<jsp:param name="title" value="" />
		</jsp:include>
		<!-- end of sidebar -->
		<!-- 
            컨텐츠 영역 : 
            - 더미 텍스트(Lorem ipsum)을 활용하여 내용 강제로 늘려 테스트
        -->
		<div class="contents">
			<div class="contentstitle">메인페이지</div>
			<div class="maindiv">
				<div class="card">
					<table style="width: 85%;">
						<tr>
							<td style="height: 40%;">문의</td>
						</tr>
						<tr>
							<td style="height: 60%; border-top: 1px solid #808080; font-size: 40px;">0</td>
						</tr>
					</table>
				</div>
				<div class="card">
					<table style="width: 85%;">
						<tr>
							<td style="height: 40%;">주문</td>
						</tr>
						<tr>
							<td style="height: 60%; border-top: 1px solid #808080; font-size: 40px;">0</td>
						</tr>
					</table>
				</div>
				<div class="card">
					<table style="width: 85%;">
						<tr>
							<td style="height: 40%;">환불</td>
						</tr>
						<tr>
							<td style="height: 60%; border-top: 1px solid #808080; font-size: 40px;">0</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="contentsdiv">
				<div class="content"></div>
			</div>
			
			<div class="statsdiv">
				<div class="stats" style="margin-right: 20px; background-size: 75%; background-image: url(/resources/images/chart.png)" ></div>
				<div class="stats" style="margin-left: 20px; background-size: 60%; background-image: url(/resources/images/graph.png)"></div>
			</div>
		</div>
		<!-- end of contents -->
	</div>
</body>
</html>