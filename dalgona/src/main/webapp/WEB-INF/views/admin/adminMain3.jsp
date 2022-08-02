<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/admin2.css" />
<script type="text/javascript" src="${path}/resources/js/admin.js"></script>
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
		<div class="sidebar">
			<!-- 메뉴 상태 변경 버튼 추가 -->
			<label class="toggle"> 
				<span></span> <span></span> <span></span>
			</label>
			<div class="sidebarlogo">DALGONA MARKET</div>
			<div class="menucontainer">
				<div class="menu" onclick="">
					상품등록
				</div>
				<br>
				<div class="menu">
					상품관리
				</div>
				<br>
				<div class="menu">
					리뷰관리
				</div>
				<br>
				<div class="menu">
					주문관리
				</div>
				<br>
				<div class="menu">
					매출통계
				</div>
				<br>
				<div class="menu">
					회원통계
				</div>
				<br>
				<div class="menu">
					문의내역
				</div>
				<br>
			</div>
			
			
		</div>
		<!-- 
            컨텐츠 영역 : 
            - 더미 텍스트(Lorem ipsum)을 활용하여 내용 강제로 늘려 테스트
        -->
		<div class="contents">
			contents
		</div>
	</div>
</body>
</html>