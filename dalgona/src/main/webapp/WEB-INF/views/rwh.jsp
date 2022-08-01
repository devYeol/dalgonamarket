<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<style>
.container1 {
	display: flex;
	flex-flow: row nowrap; 
	max-width: 1920px;
}

.content {
	width: 100%;
	height: 1000px;
	background-color: white;
}

.sidebar {
	width: 100%;
	height: 600px; 
	width: 200px; position : sticky;
	top: 0;
	position: sticky; top : 0;
	color: black;
	background-color: white;
	border: 1px solid #adb5bd;
}

#l2 {
	margin-left: 100px;
	margin-right: 100px;
}

#main2 {
	font-weight: bold;
	margin-top: 30px;
	margin-left: 20px;
}

#pay1 {
	display: inline;
	margin-left: 115px
}

.pay {
	display: inline;
	float: left;
	text-align: center;
	margin-top: 30px;
	margin-right: 60px;
	font-weight: bold;
	font-size: 25px;
}
.pay a{
	color: black;
	text-decoration: none;
}
#someDate {
	margin-left: 200px;
}
.someDate2 {
	margin-top: 30px;
	margin-right: 80px;
	display: inline-block;
}
#p1{
	font-weight: bold;
	margin-top: 30;
	margin-left: 100;
}
/* #checkboxNoLabel{
	margin-left: 100px;
} */
#check2{
	margin-top: 30px;
}
.btn-outline-primary{
	font-weight: bolder;
	text-align: center;
	width: 150px;
	/* height: 30px; */
	display: inline-block;
}

.btn-outline-primary1{
	font-weight: bolder;
	text-align: center;
	width: 150px;
	height: 30px;
}
#btnDelete{
	width:90px;
}

.link-primary{
	justify-content: right;
	float: right;
}
#check3{
	display: inline-block;
	font-weight: bold;
}
#check1{
	width: 850px;
	margin-top: 30px;
	margin-left: 130px;
}
#btnfont2 {
	float: right;
	justify-content: flex-end;
	/* margin-top: 10px; */
	margin-bottom: 15px;
}
#btnfont2 div{
	margin-bottom: 10px;
}
#shipping{
	font-weight: bold;
	font-size: 20px;
	margin-top: 20px;
}
#shipping1{
	height: 285px; 
	border: 1px solid #adb5bd;
	margin-top: 15px;
	border-radius: 10px;
}
#shipping2{
	margin: 15px;
	border: 1px solid #adb5bd;
	height: 215px;
	border-radius: 10px;
}
#shipping3{
	margin: 15px 15px;
	height: 180px;
}
#shipping3 span{
	margin-top: 10px;
}
img{
	margin-top: 10px;
	height:150px;
}
#shipping4{
	margin: 15px;
	width: 200px;
}
.item{
	color: black;
    text-decoration: none;
}
.sideMenu{
	display: flex;
	margin-top: 5px;
	
}



</style>

<div class="headcontainer border-top" style="padding-top: 20px">

	<!-- test -->
	<section id="l2">
		<div class="container1">
			<div>
				<div class="sidebar">
					<label for="expand-menu"><div style="margin-top: 10px"><h2 style="font-weight: bold">마이페이지</h2></div></label>&nbsp;
					<ul id="side">
						<li id="firstMenu" class="sideMenu"><a href="#" class="item">쇼핑정보</a></li> <br>
						<li class="sideMenu"><a href="#" class="item">찜 목록</a></li> <br>
						<li class="sideMenu"><a href="#" class="item">장바구니</a></li> <br>
						<li class="sideMenu"><a href="#" class="item">구매내역</h3></li> <br>
						<li class="sideMenu"><a href="#" class="item">상품문의</a></li>
						<br>
						<li class="sideMenu"><a href="#" class="item">내정보</a></li> <br>
						<li class="sideMenu"><a href="#" class="item">내정보 수정</a></li> <br> 
						<li class="sideMenu"><a href="#" class="item">포인트 내역</a></li> <br>
						<li class="sideMenu"><a href="#" class="item">주소록</h3></a></li> <br>
					</ul>
				</div>
			</div>
			<div class="content">
				<h1 id="main2">구매내역</h1>
				<nav>
					<ul>
						<li id="pay1" class="pay"><a href="#">1<br>전체 구매 내역</a></li>
						<li class="pay"><a href="#">1<br>배송 중</a></li>
						<li class="pay"><a href="#">1<br>배송 완료</a></li>
						<li class="pay"><a href="#">1<br>환불 요청</a></li>
						<li class="pay"><a href="#">1<br>환불 완료</a></li>
					</ul>
				</nav>
				<div style="border: 1px solid #adb5bd; width: 850px; margin-left: 130px;">
					<input id="someDate" class="someDate2" type="date">
					<h2 class="someDate2">~</h2>
					<input class="someDate2" type="date">
				</div>
				<div style="border: 1px solid #adb5bd; width: 850px; margin-left: 130px;">
					<p id="p1">한번에 조회 가능한 기간은 최대 6개월 이고 환불은 배송 완료 후 7일 내만 가능합니다.</p>
				</div>
				<div>
					<div id="check1">
						<div style="border: 1px solid #adb5bd;">
							<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="..." style="margin-top: 10px">
							<p id="check3">전체선택</p>
							<button type="button" class="btn btn-outline-primary" id="btnDelete">선택삭제</button>
						 	<a href="#" class="link-primary">주문상세 보기</a>
						</div>
						<hr class="my-4">
						<div id="shipping1">
							<div>
								<h3 style="font-weight: bold; margin-left: 30px; margin-top: 5px;">2022.xx.xx</h3>
							</div>
							<div id="shipping2">
								<div id="shipping3" style="display: flex;">
									<div style="border-right: 1px solid #adb5bd; padding-right: 215px; margin-right:15px; height: 185;">
									<span id="shipping">배송완료 7.31(일) 도착</span><br>
										<div style="display: flex;">
											<div>
												<img alt="" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" class="d-block w-100">
											</div>
											<div id="shipping4">
												<span style="font-size: 20px"><b>초코송이</b></span><br><br>
												<span>1500원 1개</span>
											</div>
										</div>
									</div>
									<div id="btnfont2">
										<div>
											<button type="button" class="btn btn-outline-primary">교환,반품신청</button>
										</div>
										<div>
											<button type="button" class="btn btn-outline-primary">장바구니 담기</button><br>
										</div>
										<div>
											<button type="button" class="btn btn-outline-primary">리뷰작성</button>
										</div>
										<div>
											<button type="button" class="btn btn-outline-primary">상품문의</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />