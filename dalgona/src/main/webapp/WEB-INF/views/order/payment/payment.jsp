<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<link rel="stylesheet" href="${path}/resources/css/payment.css" />
<%-- <link rel="stylesheet" href="${path}/resources/js/payment.js" /> --%>

<!-- jQuery -->
<script type="text/javascript"
	src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<!-- Sweet alert -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>

&nbsp; &nbsp;

<section id="payment-content">

	<!-- 		<div id="payment-title">
			<h2>주문/결제</h2>
			<hr class="my-4">
		</div> -->

	&nbsp;

	<div id="payment-container">

		<div id="payment-title">
			<h2>
				<strong>주문/결제</strong>
			</h2>
			<br> <br>
			<!-- 			<hr class="my-4"> -->
		</div>

		<div>
		<input type="hidden" value="${loginMember }" id="memberId">
			<h2>구매자 정보 (*)회원정보</h2>
			<hr class="my-4">
			<table class="payment-table">
				<tbody>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">이름</label></th>
						<td><c:out value="${loginMember.memberName }" /></td>
					<tr class="payment-tr">
						<th scope="row" id="payment-th" name="buyer-email"><label
							for="">이메일</label></th>
						<td><c:out value="${loginMember.memberEmail }" /></td>
					</tr>
					<tr class="payment-tr">
						<th scope="row" id="payment-th" name="buyer-phone"><label
							for="">전화번호</label></th>
						<td><c:out value="${loginMember.memberPhone }" /></td>
					</tr>
				</tbody>
			</table>

			<br> <br>

			<div class="deli-change-btn-div">
				<div class="deli-btn-content">
					<h2>받는사람 정보</h2>
				</div>

				<div class="deli-btn" style="float: right;">
					<button type="submit" class="btn btn-primary" id="delivery-change-btn" onclick="popAddress()">배송지변경</button>
				</div>
			</div>

			<hr class="my-3">

			<table class="payment-table">
				<tbody>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">이름</label></th>
						<td name="addrReceiver"><c:out value="${deliveryLocation.addrReceiver }" /></td>
					</tr>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">배송주소</label></th>
						<td name="addrPostNum"><c:out value="${deliveryLocation.adrPostNum }" /></td>
						<td name="addrRoadName"><c:out value="${deliveryLocation.addrRoadName }" /></td>
						<td name="addrDetail"><c:out value="${deliveryLocation.addrDetail }" /></td>
					</tr>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">전화번호</label></th>
						<td name="addrPhone"><c:out value="${deliveryLocation.addrPhone }" /></td>
					</tr>
				</tbody>
			</table>
		</div>

		<br> <br>

		<!-- 배송정보 -->
		<div class="deli-2">
			<h2>배송정보</h2>
			<!--  				<h5>(@요일 N/N 도착예정)</h5> -->
		</div>

		<hr class="my-4">

		<%-- <c:forEach var="c" items="${map.cartList}" varStatus="i"> --%>
		<c:forEach var="c" items="${cart}" varStatus="i">
			<table class="payment-table" id="payment-deli-table">

				<thead>
					<h5>(@요일 N/N 도착예정)</h5>
					<!-- 에러나는데 작동은 함 -->
				</thead>

				<tbody class="product-detail">
					<tr class="payment-tr">
						<!-- <td class=""><a href="#"><img src="https://img.mywisa.com/freeimg/smartwing/_data/product/201709/22/e4ee83bdcacc45b92130f10aeef309f1.jpg" width="73" height="90" border="0"></a></td>
							<td>
								<a href="#">상품타이틀</a>
							</td>
							<td>수량 N개</td>
							<td>배송비 N원</td> -->
						<td class=""><a href="#" style="text-decoration: none;">
								<img src="${c.product.productThumb }" width="85" height="90"
								border="0" />
						</a></td>
						<td><a href="#"><c:out value=" ${c.product.productName }" /></a>
							<br> ${c.cartAmount }</td>
						<td>배송비 2500 원</td>
					</tr>

				</tbody>
			</table>
		</c:forEach>

		<br> <br>

		<!-- 결제 정보 -->
		<div class="">
			<h2>결제정보</h2>
		</div>

		<hr class="my-4">

		<c:forEach var="c" items="${map.cartList}" varStatus="i">
			<table class="payment-table">
				<tbody>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">상품가격</label></th>
						<td class="pro-price">N 원</td>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">배송비</label></th>
						<td class="pro-price">N 원</td>
					</tr>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">총 결제금액</label></th>
						<td class="pro-price"><strong
							style="font-size: 25px; color: #C87854;">N 원</strong></td>
					</tr>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for=""></label></th>
						<!-- <td>
									<input class="form-control" id="" placeholder="내용을 입력해주세요.">
								</td> -->
					</tr>
				</tbody>
			</table>
		</c:forEach>

		<br>

		<div class="row gap-2" id="payment-btn">
			<button onclick="location.href='/'" type="button"
				class="btn col btn-secondary btn-lg">취소하기</button>
			<!-- <button onclick="payment()" type="button" class="btn col btn-primary btn-lg">결제하기</button> -->
			<button onclick="testPayment()" type="button"
				class="btn col btn-primary btn-lg">결제하기</button>
		</div>

		<!-- 				<div class="d-grid gap-2 col-4 mx-auto">
					<button type="button" class="btn btn-secondary btn-lg">취소</button>
					<button type="button" class="btn btn-primary btn-lg">결제</button>
				</div> -->


	</div>

	&nbsp; &nbsp; &nbsp; &nbsp;

</section>

<script>
	/* 랜덤 번호 생성 */
	function rndNumber() {

		const date = new Date();
		const year = date.getFullYear();
		const month = String(date.getMonth() + 1).padStart(2, "0");
		const day = String(date.getDate()).padStart(2, "0");

		let orderNum = year + month + day;

		for (let i = 0; i < 10; i++) {
			orderNum += Math.floor(Math.random() * 8);
		}

		return orderNum;

	}

	/* 결제 */
	function payment() {

		const data = {

			payMethod : $("input[type='button']:checked").val(),
			orderNum : rndNumber(),
			marketName : '(주)달고나마켓',
			name : $("#addrReceiver").val(),
			phone : $("#addrPhone").val(),
			deleveryAddress1 : $("#addrPostNum").val(),
			deleveryAddress2 : $("#addrRoadName").val(),
			deleveryAddress3 : $("#addrDetail").val(),
			totalPrice : $("#totalPrice").text()

		}

		if (!data.deleveryAddress2 || !deleveryAddress2) { // 배송지 미선택시 리턴
			swal('배달 받으실 주소를 입력해 주세요')
			return;
		}

		if ($(".product-detail").length < 1) { // 상품정보 없을시 리턴
			swal('선택한 상품이 없습니다.')
			return;
		}

		if (!data.phone) { // 받는사람 연락처 없을시 리턴
			swal('전화번호를 입력해주세요.');
			return;
		}

		paymentCard(data);

	}

	/* 온라인결제 */
	function paymentCard(data) {

		// 모바일로 결제시 이동페이지
		// const pathName = location.pathname;
		// const href = location.href;
		// const m_redirect = href.replaceAll(pathName, "");

		var IMP = window.IMP;
		IMP.init("imp87022146");

		// 결제창 호출
		IMP.request_pay({ // param

			pg : "html5_inicis",
			pay_method : data.payMethod, // 결제형태 - 생략가능
			merchant_uid : data.orderNum, // 주문번호
			marketName : data.marketName, // 상호명
			buyer_name : data.name, // 구매자 이름
			buyer_tel : data.phone, // 구매자 연락처
			buyer_postcode : data.deleveryAddress1, // 우편번호
			buyer_addr : data.deleveryAddress2 + " " + data.deleveryAddress3, // 구매자 주소 + 상세
			m_redirect_url : "/" // 결제 완료 후 url

		},

		function(rsp) { // callback
			if (rsp.success) {
				// 결제 성공 시 로직,
				data.impUid = rsp.imp_uid;
				data.merchant_uid = rsp.merchant_uid;
				paymentComplete(data);

			} else {
				// 결제 실패 시 로직,
			}
		});

	}

	/* 결제완료 */
	function paymentComplete(data) {

		$.ajax({
			url : "/views/order/payment/paymentComplete",
			method : "POST",
			data : data,
		})

		.done(function(result) {
			messageSend();
			swal({
				text : result,
				closeOnClickOutside : false
			}).then(function() {
				location.replace("/payment");
			})

		}) // done
		.fail(function() {
			swal("Error!");
			location.replace("/");
		});

	}
	
	/* test */
	function testPayment() {

		var IMP = window.IMP;
		IMP.init("imp87022146");

		// 결제창 호출
		IMP.request_pay({ // param

			pg : "html5_inicis",
			pay_method : 'card', // 결제형태 - 생략가능
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트', // 상호명
			amount : 100, // 총 상품가격
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'

		},

		function(rsp) { // callback

			console.log(rsp);

			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			
			swal(msg);
			
		});

	}
	
	/* 배송지 변경 팝업 */
	function popAddress() {
        window.open("/changeAddress.do", "배송지 변경", "width=1000, height=600, top=100, left=270");
    }

</script>

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

<jsp:include page="/WEB-INF/views/common/footer.jsp" />