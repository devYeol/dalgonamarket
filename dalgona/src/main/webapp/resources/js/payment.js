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
/* function payment() {

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
		name: $(".store_name1d").text(),
		phone: $("#hiddenphone").val(),
		request: $("select[name='request']").val(),
		email: $("#hiddenemail").val(),
		deleveryAddress1: $("#deleveryAddress2").val(),
		deleveryAddress2: $("#deleveryAddress2").val(),
		deleveryAddress3: $("#deleveryAddress3").val(),
		totalPrice: $("#totalPrice").text()

	}

	if (!data.deleveryAddress2) {
		swal('배달 받으실 주소를 입력해 주세요')
		return;
	}

	if ($(".food_name_box").length < 1) {
		return;
	}

	if (!data.phone) {
		swal('전화번호를 입력해주세요');
		return;
	}

	paymentCard(data);

} */

/* 클라이언트 정보 */
/* const data = {

	payMethod: $("input[type='button']:checked").val(),
	orderNum: rndNumber(),
	name: $(".store_name1d").text(),
	phone: $("#hiddenphone").val(),
	request: $("select[name='request']").val(),
	email: $("#hiddenemail").val(),
	deleveryAddress1: $("#deleveryAddress2").val(),
	deleveryAddress2: $("#deleveryAddress2").val(),
	deleveryAddress3: $("#deleveryAddress3").val(),
	totalPrice: $("#totalPrice").text()

} */

/* 테스트 정보 */
const testData = {

	payMethod: $("input[type='radio']:checked").val(),
	orderNum: rndOrderNum(),
	name: $(".store_name1").text(),
	phone: $("#hiddenphone").val(),
	request: $("select[name='request']").val(),
	nickname: $("#nickname1").val(),
	email: $("#hiddenemail").val(),
	deleveryAddress2: $("#deleveryAddress2").val(),
	deleveryAddress3: $("#deleveryAddress3").val(),
	totalPrice: $("#totalPrice").text()

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
		// pay_method: "card",
		pay_method: data.payMethod, // 결제형태
		merchant_uid: data.orderNum, // 주문번호
		name: data.name, // 상품명
		amount: data.amount, // 수량
		buyer_email: data.email, // 구매자 이메일
		buyer_name: data.nickname, // 구매자 이름
		buyer_tel: data.phone, // 구매자 연락처
		buyer_postcode: "", // 우편번호
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
		url: "/views/order/payment/paymentComplete.jsp",
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
					location.replace("/orderList");
				})

		}) // done
		.fail(function() {
			alert("결제실패");
			location.replace("/");
		});

}