<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<body>

	<style>
.cart-form {
	justify-content: center;
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 50px;
	display: flex;
}

.cart-container {
	width: 100%;
	position: relative;
	margin-left: 50px;
}

div img {
	width: 100px;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.login-form {
	display: flex;
	width: 70%;
	justify-content: center;
	align-items: center;
	min-height: 150vh;
}

.login-container {
	position: relative;
	z-inex: 2;
}

.login-container h2 {
	font-size: 32px;
	text-align: center;
}

.int-area {
	width: 350px;
	margin-top: 20px;
}

.int-area input {
	width: 100%;
	padding: 10px 0px 5px;
	border: none;
	border-bottom: 1px solid #999;
	outline: none;
}

.int-area input:hover {
	border-bottom: 1px solid black;
}

.gender-area {
	width: 350px;
	margin-top: 20px;
}

.gender-area div {
	display: flex;
	justify-content: flex-start;
}

.gender-area .genderbox {
	padding: 10px 0px 5px;
}

input::placeholder {
	color: #999;
}

.btn-area {
	margin-top: 30px;
}

.btn-area button {
	width: 100%;
	height: 50px;
	background-color: #999;
	color: #fff;
	font-size: 18px;
	border: none;
	border-radius: 10px;
}

.btn-area button:hover {
	background-color: black;
	color: #fff;
}

.btn-area2 button {
	background-color: #999;
	font-size: 10px;
	color: #fff;
	border: none;
	border-radius: 10px;
	width: 100px;
	height: 20px;
	float: right;
}

.btn-area2 button:hover {
	background-color: black;
	color: #fff;
}
</style>

	<section class="cart-form">
		<div class="login-container">
			<h2>
				<b>주소록 추가</b>
			</h2>
			<br>
			<form action="${path}/mypage/shippingset">
				<div class="int-area">
					<label for="name"><b>이름</b></label> <br> <input type="text"
						name="name" placeholder="수령인 이름" autocomplete="off">
				</div>
				<br>
				<div class="int-area">
					<label for="phone"><b>휴대폰 번호</b></label> <br> <input
						type="tel" name="phone" placeholder="-없이 입력" required>
				</div>
				<br>
				<div class="int-area" style="">
					<div class="btn-area2" style="justify-content: space-between;">
						<label for="zipcode" style=""><b>우편번호</b></label>
						<button type="button" style="">우편번호 검색</button>
					</div>

					<div>
						<input type="text" name="zipcode" placeholder="우편번호를 검색하세요"
							autocomplete="off" required>
					</div>
				</div>
				<br>
				<div class="int-area">
					<label for="address"><b>주소</b></label> <br> <input type="text"
						name="address" placeholder="우편번호 검색후,자동 입력됩니다" autocomplete="off"
						required>
				</div>
				<br>
				<div class="int-area">
					<label for="address"><b>상세주소</b></label> <br> <input
						type="text" name="detailaddress" placeholder="건물,아파트 동/호수 입력"
						autocomplete="off" required>
				</div>
				<br>
				<div>
					<input class="form-check-input" type="checkbox"
						id="checkboxNoLabel" value="" aria-label="..."> <label>기본배송지로
						설정</label>
				</div>
				<div class="btn-area"
					style="display: flex; justify-content: space-between; margin-bottom: 10px;">
					<button type="reset">
						<b>취소</b>
					</button>
					&nbsp;&nbsp;
					<button type="submit" class="">설정하기</button>
				</div>
			</form>
		</div>



	</section>
</body>
</html>
