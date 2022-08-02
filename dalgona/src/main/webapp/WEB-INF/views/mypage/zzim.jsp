<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<style>
.cart-form {
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 50px;
	display: flex;
}

.sidebar {
	width: 100%;
	height: 600px;
	width: 200px;
	position: sticky;
	top: 50px;
}

.sidebar ul {
	padding: 0;
	margin-top: 40px;
}

.sidebar ul li {
	list-style: none;
	margin-top: 20px;
}

.sidebar ul li a {
	text-decoration: none;
	color: #999;
}

.sidebar ul li a:hover {
	color: black;
}

.cart-container {
	width: 100%;
	position: relative;
	margin-left: 50px;
}

div img {
	width: 100px;
}

.zzimlistcon{
	display: flex;
	justify-content: space-between;
}

.zzimlistcheck{
	float:left;
	margin-top:1%;
}

#zzimproduct{
	max-width: 100%;
	max-height: 100%;
	margin-left:30px;
}

.zzimproductname{
	margin-left:30px;
}
</style>

<div class="headcontainer border-top" style="padding-top: 20px"></div>
<section class="cart-form">
	<div>
		<div class="sidebar">
			<h4>
				<strong>마이페이지</strong>
			</h4>
			<ul>
				<li><h5>
						<b>쇼핑정보</b>
					</h5></li>
				<li><a href="#">구매내역</a></li>
				<li><a href="#">장바구니</a></li>
				<li><a href="#">찜 목록</a></li>
				<br>
				<li><h5>
						<b>내정보</b>
					</h5></li>
				<li><a href="#">프로필 정보</a></li>
				<li><a href="#">주소록</a></li>
			</ul>
		</div>
	</div>
	<div class="cart-container">
		<h4>
			<b>찜목록</b>
		</h4>
		<div style="margin-top: 20px">
			<div>
				<div style="display: flex; justify-content: space-between;">
					<div style="margin-top: 8px; display: flex">
						<input class="form-check-input" type="checkbox"
							id="checkboxNoLabel" value="" aria-label="...">
						<div style="margin-left: 10">전체선택</div>
					</div>
					<button type="button" class="btn btn-outline-primary"
						style="float: right">선택삭제</button>
				</div>
			</div>
		</div>
		<hr>
		<br>

			<div class="zzimlistcon">
				<div class="zzimlistcheck"> 
					<input type="checkbox" value="">
					<img src="https://m.nemone.co.kr/file_data/nemonekr/2021/01/27/bc59f985c289db3d919e9c24a9466517.jpeg"
						id="zzimproduct">
						<label class="zzimproductname"><a href="#">상품타이틀</a><br>수량 N 개</label>
				</div>
				
					<div style="margin-top:20px;">
                  		<button type="button" class="btn btn-danger">장바구니 담기</button>
                  		 <button class="btn btn-secondary " type="button">x</button>
                  	</div>



			</div>



	</div>






	</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />