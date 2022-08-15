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

		//		payMethod: $("input[type='radio']:checked").val(),
		//		orderNum: rndOrderNum(),
		//		name: $(".store_name1").text(),
		//		phone: $("#hiddenphone").val(),
		//		request: $("select[name='request']").val(),
		//		nickname: $("#nickname1").val(),
		//		email: $("#hiddenemail").val(),
		//		deleveryAddress2: $("#deleveryAddress2").val(),
		//		deleveryAddress3: $("#deleveryAddress3").val(),
		//		totalPrice: $("#totalPrice").text()

		payMethod: $("input[type='button']:checked").val(),
		orderNum: rndNumber(),
		marketName: '(주)달고나마켓',
		name: $("#addrReceiver").val(),
		phone: $("#addrPhone").val(),
		deleveryAddress1: $("#addrPostNum").val(),
		deleveryAddress2: $("#addrRoadName").val(),
		deleveryAddress3: $("#addrDetail").val(),
		totalPrice: $("#totalPrice").text()

	}

	//	if (!data.deleveryAddress2 || !deleveryAddress2) { // 배송지 미선택시 리턴
	//		swal('배달 받으실 주소를 입력해 주세요')
	//		return;
	//	}
	//
	//	if ($(".product-detail").length < 1) { // 상품정보 없을시 리턴
	//		swal('선택한 상품이 없습니다.')
	//		return;
	//	}
	//
	//	if (!data.phone) { // 받는사람 연락처 없을시 리턴
	//		swal('전화번호를 입력해주세요.');
	//		return;
	//	}

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

		pg: "html5_inicis",
		pay_method: data.payMethod, // 결제형태 - 생략가능
		merchant_uid: data.orderNum, // 주문번호
		marketName: data.marketName, // 상호명
		buyer_name: data.name, // 구매자 이름
		buyer_tel: data.phone, // 구매자 연락처
		buyer_postcode: data.deleveryAddress1, // 우편번호
		buyer_addr: data.deleveryAddress2 + " " + data.deleveryAddress3, // 구매자 주소 + 상세
		m_redirect_url: "/" // 결제 완료 후 url

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
		url: "/views/order/payment/paymentComplete",
		method: "POST",
		data: data,
	})

		.done(function(result) {
			messageSend();
			swal({
				text: result,
				closeOnClickOutside: false
			})
				.then(function() {
					location.replace("/payment");
				})

		}) // done
		.fail(function() {
			alert("Error!");
			location.replace("/");
		});

}

/* test */
function testPayment() {

	var IMP = window.IMP;
	IMP.init("imp87022146");

	// 결제창 호출
	IMP.request_pay({ // param

		pg: "html5_inicis",
		pay_method: 'card', // 결제형태 - 생략가능
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: '주문명:결제테스트', // 상호명
		amount: 1000,
		buyer_email: 'iamport@siot.do',
		buyer_name: '구매자이름',
		buyer_tel: '010-1234-5678',
		buyer_addr: '서울특별시 강남구 삼성동',
		buyer_postcode: '123-456',
		m_redirect_url: 'https://www.yourdomain.com/payments/complete'

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
			alert(msg);
		});
		
}