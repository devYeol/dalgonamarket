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

		payMethod: $("input[type='radio']:checked").val(),
		orderNum: rndNumber(),
		name: $(".store_name1").text(),
		phone: $("#hiddenphone").val(),
		request: $("select[name='request']").val(),
		nickname: $("#nickname1").val(),
		email: $("#hiddenemail").val(),
		address1: $("#deleveryAddress2").val(),
		address2: $("#deleveryAddress2").val(),
		address3: $("#deleveryAddress3").val(),
		totalPrice: $("#totalPrice").text()

	}

	if (!data.address1) {
		alert('배달 받으실 주소를 입력해 주세요')
		return;
	}

	if ($(".food_name_box").length < 1) {
		return;
	}

	if (!data.phone) {
		alert('전화번호를 입력해주세요');
		return;
	}

	paymentCard(data);

}

/* 온라인결제 */
function paymentCard(data) {

	var IMP = window.IMP;
	IMP.init("imp87022146");

	// 결제창 호출
	IMP.request_pay({ // param

		pg: "html5_inicis",
		pay_method: "card",
		merchant_uid: rndOrderNum(),
		name: data.name,
		// amount: data.totalPrice,
		amount: 100,
		buyer_email: data.email,
		buyer_name: data.nickname,
		buyer_tel: data.phone,
		buyer_addr: data.deleveryAddress2 + " " + data.deleveryAddress3,
		buyer_postcode: "",
		m_redirect_url: "/"

	},

		function(rsp) { // callback

			if (rsp.success) { // 성공로직

				paymentComplete(data);

				// 테스트용
				/*  var msg="주문성공";
					msg+='고유ID : '+rsp.imp+uid;
					msg+='상점거래ID : '+rsp.merchang_uid;
					msg+='결제금액 : '+rsp.paid_amount;
					msg+='카드승인번호 : '+rsp.apply_num; */

			} else { // 실패로직

				var msg = '결제실패 : ';
				msg += rsp.error_msg;

			}

			alert(msg);
			console.log(rsp);

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
			alert({
				text: result,
				closeOnClickOutside: false
			})
				.then(function() {
					location.replace("/payment.do");
				})

		}) // done

		.fail(function() {
			alert("주문성공");
			location.replace("/");
		});

}