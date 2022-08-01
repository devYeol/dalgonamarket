<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<style>
* {
	margin: 0; padding: 0; box-sizing: border-box;
}
.addr-form {
	margin-left: 100px;
	margin-right: 100px;
	display: flex;
}
.sidebar {
	width: 100%;
	height: 600px; 
	width: 200px; 
	position : sticky; 
	top: 50px;
}
.sidebar ul {
	padding: 0;
	margin-top: 30px;
}
.sidebar ul li {
	list-style: none;
	margin-top: 20px;
}
.sidebar ul li a {
	text-decoration: none;
	color: black;
}
.addr-container {
	width: 100%;
	position: relative;
	margin-left: 50px;
}
.addr-container h2 {
	font-size: 32px;
}

.btn-area {
	width: 150px; 
	height: 30px;
	color: #fff;
	font-size: 18px;
	border: none;
	border-radius: 10px;
}

.btn-area:hover {
	background-color: black;
	color: #fff;
</style>
	<div class="headcontainer border-top" style="padding-top: 20px"></div>
	<section class="addr-form">
			<div>
				<div class="sidebar">
					<h4><strong>마이페이지</strong></h4>
					<ul>
						<li id="firstMenu" class="sideMenu" style=""><h5>쇼핑정보</h5></li>
						<li class="sideMenu"><a href="#">찜 목록</a></li> 
						<li class="sideMenu"><a href="#">장바구니</a></li> 
						<li class="sideMenu"><a href="#">구매내역</a></li> 
						<li class="sideMenu"><a href="#">상품문의</a></li>
						<li class="sideMenu"><h5>내정보</h5></li>
						<li class="sideMenu"><a href="#">내정보 수정</a></li>
						<li class="sideMenu"><a href="#">포인트 내역</a></li> 
						<li class="sideMenu"><a href="#">주소록</a></li>
					</ul>
				</div>
			</div>
			<div class="addr-container">
				<h4><b>주소록</b></h4>
				<br>
				<div style="display: flex; justify-content: space-between;">
					<div>기본 배송지</div>
					<button class="btn-area">+ 배송지 추가</button>
				</div>
				<hr style="margin-top: 8px;">
			
			</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>