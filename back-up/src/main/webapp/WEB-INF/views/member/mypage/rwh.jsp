<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<style>
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
	text-align: center;
	justify-content: center;
	margin-top: 40px;
	font-size: 22px;
}

.pay div {
	margin-left: 35px;
	margin-right: 35px;
}

.pay a {
	color: black;
	text-decoration: none;
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

<div class="headcontainer border-top" style="padding-top: 20px"></div>
<section class="orderlist-form">
	<div>
		<div class="sidebar">
			<h4>
				<strong>???????????????</strong>
			</h4>
			<ul>
				<li><h5>
					</h5></li>
				<li><a href="${path }/member/mypage/mypageMain">????????????</a></li>
				<li><a href="${path }/member/mypage/rwh"></a><h5><b>????????????</b></h5></li>
				<li><a href="${path }/member/mypage/cart">????????????</a></li>
				<li><a href="${path }/member/mypage/zzim">??? ??????</a></li>
				<br>
				<li><h5>
						<b>?????????</b>
					</h5></li>
				<li><a href="#">????????? ??????</a></li>
				<li><a href="#">?????????</a></li>
			</ul>
		</div>
	</div>
	<div class="orderlist-container">
		<h4>
			<b>????????????</b>
		</h4>
		<div>
			<div class="pay">
				<div>
					<a href="#">1<br>?????? ?????? ??????
					</a>
				</div>
				<div>
					<a href="#">1<br>?????? ???
					</a>
				</div>
				<div>
					<a href="#">1<br>?????? ??????
					</a>
				</div>
				<div>
					<a href="#">1<br>?????? ??????
					</a>
				</div>
				<div>
					<a href="#">1<br>?????? ??????
					</a>
				</div>
			</div>
			<div class="somedate-search">
				<input class="somedate" type="date"><b>~</b> <input
					class="somedate" type="date">
				<button class="btn-somedate">??????</button>
			</div>
			<div class="somedate-search">
				<p>????????? ?????? ????????? ????????? ?????? 6?????? ?????? ????????? ?????? ?????? ??? 7??? ?????? ???????????????.</p>
			</div>
		</div>
		<div>
			<div class="orderlist-box">
				<div style="display: flex; justify-content: space-between;">
					<div style="margin-top: 8px;">
						<input class="form-check-input" type="checkbox"
							id="checkboxNoLabel" value="" aria-label="...">
						<div class="all-check">????????????</div>
					</div>
					<button type="button" class="btn-delete">????????????</button>
				</div>
				<hr style="margin-top: 8px; margin-bottom: 8px;">
				<div>
					<div style="display: flex">
						<h3 style="margin-bottom: 0px; margin-left: 40px;">2022.02.02</h3>
						<h4 style="margin-bottom: 0px; margin-left: 10px">??????</h4>
					</div>
					<div>
						<div id="order-data" style="display: flex;">
							<div
								style="padding-right: 215px; margin-right: 15px; height: 160;">
								<div class="check-itembox">
									<div class="check-item">
										<input class="form-check-input" type="checkbox" value="">
									</div>
									<div>
										<img
											src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
											class="d-block w-100">
									</div>
									<div style="margin-top: 20px; margin-left: 30px">
										<span style="font-size: 20px"><b>????????????</b></span><br> <span
											style="font-size: 15"><b>???????????? ?????????~</b></span><br> <span
											style="font-size: 15">1500??? 1???</span>
										<div style="margin-top: 40px">
											<!-- <span>1500??? 1???</span><br> -->
											<span>7.31(???) ?????? ????????????</span><br>
										</div>
									</div>
								</div>
							</div>
							<div class="check-btnbox" style="display: flex;">
								<div class="check-btn">
									<button type="button" class="btn">??????,????????????</button>
									<button type="button" class="btn">???????????? ??????</button>
									<button type="button" class="btn">????????????</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
	</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />