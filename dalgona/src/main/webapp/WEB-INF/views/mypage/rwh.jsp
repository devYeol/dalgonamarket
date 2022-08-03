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
    position : sticky; 
    top: 50px;
}

.sidebar ul{
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

.sidebar ul li a :hover{
	color: black;
}

.pay {
	display: flex;
	text-align: center;
	justify-content:center;
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
.all-check{
	display: inline-block;
	font-weight: bold;
	margin-left: 7px;
}
.orderlist-box{
	width: 100%;
	margin-top: 100;
}

#order-data{
	justify-content: space-between;
}
#order-data span{
	margin-top: 10px;
}
img{
	margin-top: 10px;
	height:150px;
}
.item{
	color: black;
    text-decoration: none;
}
.sideMenu{
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
	margin-top:5px; 
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
               <h4><strong>마이페이지</strong></h4>
               <ul>
                  <li><h5><b>쇼핑정보</b></h5></li>
                  <li><a href="#">구매내역</a></li> 
                  <li><a href="#">장바구니</a></li> 
                  <li><a href="#">찜 목록</a></li>
                  <br>
                  <li><h5><b>내정보</b></h5></li>
                  <li><a href="#">프로필 정보</a></li>
                  <li><a href="#">주소록</a></li>
               </ul>
            </div>
         </div>
         <div class="orderlist-container">
				<h4><b>구매내역</b></h4>
				<div>
		         	<div class="pay">
						<div><a href="#">1<br>전체 구매 내역</a></div>
						<div><a href="#">1<br>배송 중</a></div>
						<div><a href="#">1<br>배송 완료</a></div>
						<div><a href="#">1<br>환불 요청</a></div>
						<div><a href="#">1<br>환불 완료</a></div>
					</div>
					<div class="somedate-search">
						<input class="somedate" type="date"><b>~</b>
						<input class="somedate" type="date">
						<button class="btn-somedate">조회</button>
					</div>
					<div class="somedate-search">
						<p>한번에 조회 가능한 기간은 최대 6개월 이고 환불은 배송 완료 후 7일 내만 가능합니다.</p>
					</div>
				</div>
				<div>
					<div class="orderlist-box">
						<div style="display: flex; justify-content: space-between;">
							<div style="margin-top: 8px;">
								<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
								<div class="all-check">전체선택</div>
							</div>
							<button type="button" class="btn-delete">선택삭제</button>
						</div>
						<hr style="margin-top: 8px; margin-bottom: 8px;">
						<div>
							<div style="display: flex">
								<h3 style="margin-bottom: 0px; margin-left: 40px;">2022.02.02</h3>
								<h4 style="margin-bottom: 0px; margin-left: 10px">주문</h4>
							</div>
							<div>
								<div id="order-data" style="display: flex;">
									<div style="padding-right: 215px; margin-right:15px; height: 160;">
										<div class="check-itembox">
											<div class="check-item"><input class="form-check-input" type="checkbox" value=""></div>
											<div>
												<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" class="d-block w-100">
											</div>
											<div style="margin-top: 20px; margin-left: 30px">
												<span style="font-size: 20px"><b>초코송이</b></span><br>
												<span style="font-size: 15"><b>오우오우 오예스~</b></span><br>
												<span style="font-size: 15">1500원 1개</span>
												<div style="margin-top: 40px">
													<!-- <span>1500원 1개</span><br> -->
													<span>7.31(일) 도착 배송완료</span><br>
												</div>
											</div>
										</div>
									</div>
									<div class="check-btnbox" style="display: flex;">
										<div class="check-btn">
											<button type="button" class="btn">교환,반품신청</button>
											<button type="button" class="btn">장바구니 담기</button>
											<button type="button" class="btn">리뷰작성</button>
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