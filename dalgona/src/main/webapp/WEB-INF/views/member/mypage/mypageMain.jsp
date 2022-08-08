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

.btn-delete {
	width: 100px;
	height: 35px;
	font-size: 16px;
	background-color: white;
	border: 1px solid #999;
	border-radius: 10px;
}

.btn-delete:hover {
	background-color: black;
	color: #fff;
}

.check-input {
	border-radius: 0.25em;
	width: 16;
	height: 16;
}

/* 드롭다운 css */
#browsers {
	background-color: white;
	border: 1px solid gray;
	border-radius: 6px;
	padding: 0.2em 0.2em 0.2em 0.2em;
}

.close {
	display: inline-block;
	font-weight: bold;
}

.close:after {
	content: "\00d7";
	font-size: 15pt;
}
/* 선택금액표시 div */
.allprice-container {
	border: 4px solid black;
	text-align: center;
	margin-top: 50;
}

.allprice-content {
	display: inline-block;
	margin: 0 auto;
	vertical-align: top;
}

.allprice-form {
	padding: 20px 15px 18px;
	line-height: 17px;
	color: #555;
	text-align: center;
}

.all-plus {
	margin: 0 11px 0 10px;
	/* vertical-align: -4px; */
}

.allprice-form i {
	padding: 0 4px 0 5px;
	font: 700 17px/17px tahoma;
	color: #111;
}

.allprice-form
.final-price {
	color: red;
	font-size: 20px;
}

.cartandprice button {
	width: 400;
	height: 50;
	margin: 30;
	margin-top: 70;
	border-radius: 6px;
	font-size: 19;
}

.btn-cart {
	background-color: #999;
	color: white;
	border: 1px solid #999;
}

.btn-cart:hover {
	background: black;
}

.btn-buy {
	color: #fff;
	background-color: #dc3545;
	border: 1px solid #dc3545;
}

.btn-buy:hover {
	background-color: #bb2d3b;
}

.orderlist-form {
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 50px;
	display: flex;
}

.orderlist-container {
	width: 100%;
	position: relative;
	margin-left: 50px;
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

.sidebar ul li a :hover {
	color: black;
}

.pay {
	display: flex;
	justify-content: center;
	margin-top: 4%;
	font-size: 22px;
	border:1px solid black;
	border-radius:10px;
	padding-bottom:6%;
	text-align: center;
}

.pay div {
	margin-left: 35px;
	margin-right: 35px;
}

.pay div a {
	color: black;
	text-decoration: none;
}

.payinfo {
	margin-top:4%;
}

.somedate-search {
	display: flex;
	text-align: center;
	align-items: center;
	justify-content: center;
	margin-top: 40px;
	height: 40px;
}

.someDate {
	margin-left: 30px;
	margin-right: 30px;
}

.btn-somedate {
	width: 60px;
	height: 30px;
	font-size: 16px;
	background-color: white;
	border: 1px solid #999;
	border-radius: 10px;
}

.btn-somedate:hover {
	background-color: black;
	color: #fff;
}

/* #checkboxNoLabel{
	margin-left: 100px;
} */
.btn-delete {
	width: 100px;
	height: 35px;
	font-size: 16px;
	background-color: white;
	border: 1px solid #999;
	border-radius: 10px;
}

.btn-delete:hover {
	background-color: black;
	color: #fff;
}

.btn-outline-primary1 {
	font-weight: bolder;
	text-align: center;
	width: 150px;
	height: 30px;
}

#btnDelete {
	width: 90px;
}

.link-primary {
	justify-content: right;
	float: right;
}

.all-check {
	display: inline-block;
	font-weight: bold;
	margin-left: 7px;
}

.orderlist-box {
	width: 100%;
	margin-top: 100;
}

#order-data {
	justify-content: space-between;
}

#order-data span {
	margin-top: 10px;
}

img {
	margin-top: 10px;
	height: 150px;
}

.item {
	color: black;
	text-decoration: none;
}

.sideMenu {
	display: flex;
	margin-top: 5px;
}

.check-itembox {
	display: flex;
	height: 160px;
}

.check-item:after {
	display: inline-block;
	height: 100%;
	content: "";
	vertical-align: middle;
	margin-left: 20px;
}

.check-item input {
	vertical-align: middle;
}

.check-btn {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.check-btn button {
	width: 140px;
	height: 35px;
	font-size: 16px;
	background-color: white;
	border: 1px solid #999;
	border-radius: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
}

.check-btn button:hover {
	background-color: black;
	color: #fff;
}
</style>
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
				<li><a href="${path }/member/mypage/productOrder">구매내역</a></li>
				<li><a href="${path }/member/mypage/cart">장바구니</a></li>
				<li><a href="${path }/member/mypage/zzim">찜 목록</a></li>
				<br>
				<li><h5>
						<b>내정보</b>
					</h5></li>
				<li><a href="#">프로필 정보</a></li>
				<li><a href="#">주소록</a></li>
			</ul>
		</div>
	</div>
	<div class="orderlist-container">
		<h4>
			<b>쇼핑정보</b>
		</h4>
		<div class="pay" style="justify-content: space-between;">
			<div ></div>

			<div class="payinfo">
				<a href="${path }/member/mypage/productOrder">1<br>구매 내역
				</a>
			</div>
			<div class="payinfo">
				<a href="${path }/member/mypage/cart">1<br>장바구니
				</a>
			</div>
			<div class="payinfo">
				<a href="${path }/member/mypage/zzim">1<br>찜 목록
				</a>
			</div >
			<div></div>
		</div>
		<div style="margin-top:15%;"></div>
		<h4>
			<b>배송 정보</b>
		</h4>

		<div class="pay" style="justify-content: space-between;">
			<div></div>

			<div class="payinfo">
				<a href="#">0<br>배송 대기
				</a>
			</div>
			<div class="payinfo">
				<a href="#">1<br>배송 중
				</a>
			</div>
			<div class="payinfo">
				<a href="#">2<br>배송 완료
				</a>
			</div>
			<div></div>
		</div>

	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />