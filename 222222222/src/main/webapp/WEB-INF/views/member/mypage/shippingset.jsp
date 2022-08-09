<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<body>


	<style>
.addr-container {
	width: 50%;
	position: relative;
	margin-left: 25%;
}

.addr-container h2 {
	font-size: 32px;
}

.addr-area {
	display: flex;
	justify-content: space-between;
}

.insert-addr {
	display: flex;
	justify-content: space-between;
}

.btn-area {
	width: 120px;
	height: 30px;
	font-size: 16px;
	background-color: white;
	border: 1px solid #999;
	border-radius: 10px;
}

.btn-area:hover {
	background-color: black;
	color: #fff;
}

.btn-addr {
	width: 50px;
	height: 30px;
	font-size: 14px;
	background-color: white;
	border: 1px solid #999;
	border-radius: 10px;
}

.btn-addr:hover {
	background-color: black;
	color: #fff;
}

.btn-container:after {
	display: inline-block;
	height: 100%;
	content: "";
	vertical-align: middle;
}
</style>


	<section id="content">
		<div class="addr-container">
			<h4>
				<b>배송지 설정</b>
			</h4>
			<br>
			<div class="addr-area">
				<div style="font-size: 18px; margin-top: 4px;">주소록</div>
			</div>
			<hr style="margin-top: 8px; margin-bottom: 0px;">
			<div class="insert-addr" id="">
				<div style="margin-bottom: 40px; margin-top: 30px;">
					<div style="font-size: 17px;">콴오준</div>
					<div style="font-size: 15px;">010-1234-5678</div>
					<div style="font-size: 15px;">(08492) 인천 계양구 가산로 874 (계산동,
						구디아파트) 103동 803호</div>
				</div>
				<div class="btn-container">
					<button class="btn-addr">체크</button>
				</div>
			</div>
			<hr style="margin-top: 8px; margin-bottom: 0px;">
			<div class="insert-addr">
				<div style="margin-bottom: 40px; margin-top: 30px;">
					<div style="font-size: 17px;">영원희</div>
					<div style="font-size: 15px;">010-7777-5678</div>
					<div style="font-size: 15px;">(08772) 서울시 강남구 224 (구디동,
						구디아파트) 204동 504호</div>
				</div>
				<div class="btn-container">
					<button class="btn-addr">체크</button>
				</div>
			</div>
			<hr>
		</div>
	</section>
</body>
</html>