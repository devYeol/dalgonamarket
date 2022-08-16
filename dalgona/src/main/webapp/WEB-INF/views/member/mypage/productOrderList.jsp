<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<style>

.proName{
font-size:20px;
text-decoration:none;
 color:black;
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

.check-input {
	border-radius: 0.25em;
	width: 16;
	height: 16;
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
				<strong>마이페이지</strong>
			</h4>
			<ul>
				<li><h5></h5></li>
				<li><a href="${path }/member/mypage/mypageMain">쇼핑정보</a></li>
				<li><a href="${path }/member/mypage/productOrderList"></a>
				<h5>
						<b>구매내역</b>
					</h5></li>
				<li><a href="${path }/member/mypage/cart">장바구니</a></li>
				<li><a href="${path }/member/mypage/zzim">찜 목록</a></li>
				<br>
				<li><h5>
						<b>내정보</b>
					</h5></li>
				<li><a href="#">프로필 정보</a></li>
				<li><a href="${path }/address">주소</a>
			</ul>
		</div>
	</div>
	<div class="orderlist-container">
		<h4>
			<b>구매내역</b>
		</h4>
		<c:choose>
			<c:when test="${empty orderDetailList }">
			<span>구매하신 상품이 없습니다</span>
			<br><br>
			<button type="button" class="btn btn-danger"  id="productListMove">상품 페이지로 이동</button>
			</c:when>
			<c:otherwise>
		<div>
			<div class="pay">
				<div>
					<a href="#">1<br>전체 구매 내역
					</a>
				</div>
				<div>
					<a href="#">1<br>배송 중
					</a>
				</div>
				<div>
					<a href="#">1<br>배송 완료
					</a>
				</div>
				<div>
					<a href="#">1<br>환불 요청
					</a>
				</div>
				<div>
					<a href="#">1<br>환불 완료
					</a>
				</div>
			</div>
			<div class="somedate-search">
				<input class="somedate" type="date"><b>~</b> <input
					class="somedate" type="date">
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
						<input class="form-check-input" type="checkbox" id="selectAll"
							value="" aria-label="...">
						<div class="all-check">전체선택</div>
					</div>
					<button type="button" id="selectDelete"class="btn-delete">선택삭제</button>
				</div>
				<c:forEach var="o" items="${orderDetailList }">
				<hr style="margin-top: 8px; margin-bottom: 8px;">
				<br>
					<table style="justify-content:between-space; width:100%;">
						<tbody>
						<tr  >
						<td style="display: flex">
							<h3 style="margin-bottom: 0px; margin-left: 40px;">
								주문날짜: ${o.productOrder.orderDate}
							</h3>
						</td>
							<td id="order-data" style="display: flex; ">
								<div
									style="padding-right: 215px; margin-right: 15px; height: 160;">
									<div class="check-itembox">
										<div class="check-item">
											<input class="check-input" type="checkbox" name="check" id="${o.productOrder.orderCode}">
										</div>
										<div>
											<img
												src="${o.product.productThumb }"
												class="d-block w-100">
												<!-- src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" -->
										</div>
										<div style="margin-top: 20px; margin-left: 30px">
											<a href="${path}/product/productList" class="proName"><b>
												<c:out	value="${o.product.categoryName }"/></b></a><br>
											<span style="font-size: 15"><b> <br>
												<c:out	value="${o.product.productName }" /></b></span><br>
											<span style="font-size: 15"><br>
												<c:out value="${o.product.productPrice }원" />&nbsp;&nbsp; <br><br>
												<c:out value="${o.product.productAmount}개" /></span> <br><br>
											<div style="float:left; margin-right:20px;">
												<c:out value="" /> 8/14(화)
													배송완료<br>
											</div>
										</div>
									</div>
								</div>
								<div class="check-btnbox" style="display: flex; float:right;">
									<div class="check-btn">
										<button type="submit" class="btn">교환,반품신청</button>
										<button type="submit" class="btn">장바구니 담기</button>
										<button type="button" class="btn">리뷰작성</button>
									</div>
								</div>
							</td>
						</tr>
						</tbody>
					</table>
					<br>
				</c:forEach>
			</div>
		</div>
		<hr>
		</c:otherwise>
		</c:choose>
	</div>

</section>

<script>


$("#productListMove").click(function(){
	  location.assign("${path}/product/productList");
})


//체크박스 전체 선택&해제
$('#selectAll').click(function(){
	if($("#selectAll").prop("checked")){
        $(".check-input").prop("checked",true); 
    }else{
        $(".check-input").prop("checked",false); 
    }
});

$(".check-input").click(function(){
	$("#selectAll").prop("chcked",false);
})

$(".check-input").click(function(){
	$("#selectAll").prop("checked",false)
})


// 선택 삭제
    	$("#selectDelete").click(function(){
    	if(confirm("삭제 하시겠습니까?")){
        const cnt = $("input[name='check']:checked").length;
        const arr = new Array();
        $("input[name='check']:checked").each(function() {
            arr.push($(this).attr('id'));
        });
        console.log(cnt);
        console.log(arr);
        $.ajax({
			url:"${path}/member/orderListDelete.do",
			data:{deleteArr:arr},
			success:data=>{
				if(data){
					$("input[name='check']:checked").parents("tr").remove();
				}
			}
		});
    	}else{
    		return false;
    	}
    })
    
    

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
