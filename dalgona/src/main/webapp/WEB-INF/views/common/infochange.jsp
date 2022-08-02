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

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.login-form {
	display:flex;
	width:70%;
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
	<div class="login-form">
		<div class="login-container">
			<h2>
				<b>프로필 정보</b>
			</h2>
			<br> <br> <br>
			<form action="">
				<div class="int-area">
					<label for="id"><b>아이디*</b></label> <br> <input type="text"
						name="id" placeholder="userID" autocomplete="off" readonly>
				</div>
				<br>
				<div class="int-area">
					<label for="pw"><b>비밀번호*</b></label> <br> <input
						type="password" name="pw" placeholder="비밀번호" autocomplete="off"
						required>
				</div>
				<br>
				<div class="int-area">
					<label for="pw"><b>비밀번호 확인*</b></label> <br> <input
						type="password" name="pw" placeholder="비밀번호 확인" autocomplete="off"
						required>
				</div>
				<br>
				<div class="int-area">
					<label for="name"><b>이름*</b></label> <br> <input type="text"
						name="name" placeholder="이름" autocomplete="off" required>
				</div>
				<br>
				<div class="int-area">
					<label for="date"><b>생년월일*</b></label> <br> <input type="date"
						name="date" required>
				</div>
				<br>
				<div class="gender-area">
					<label for="gender"><b>성별*</b></label> <br>
					<div class=genderbox style="margin-left: 5px;">
						<div>
							<input type="radio" name="gender" value="남" required>
							<div style="width: 70px; margin-left: 10px;">남</div>
						</div>
						<div>
							<input type="radio" name="gender" value="여" required>
							<div style="width: 70px; margin-left: 10px;">여</div>
						</div>
					</div>
				</div>
				<br>
				<div class="int-area">
					<label for="email"><b>이메일*</b></label> <br> <input
						type="email" name="email" placeholder="이메일" autocomplete="off"
						required>
				</div>
				<br>
				<div class="int-area">
					<label for="phone"><b>연락처*</b></label> <br> <input type="tel"
						name="phone" placeholder="-없이 입력" autocomplete="off" required>
				</div>
				<br>
				<div class="btn-area">
					<button type="submit">
						<b>가입하기</b>
					</button>
				</div>
				<br>
			</form>
		</div>



	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
