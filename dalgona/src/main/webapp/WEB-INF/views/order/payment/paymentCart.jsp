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
					<%@ include file="/WEB-INF/views/order/payment/modifyAddress.jsp"%>
					<!-- <button type="submit" class="btn btn-primary" id="delivery-change-btn" onclick="popAddress()">배송지변경</button> -->
					<button type="submit" class="btn btn-primary"
						id="delivery-change-btn" onclick="modifyAddress()">배송지변경</button>
				</div>
			</div>

			<hr class="my-3">

			<table class="payment-table">
				<tbody>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">이름</label></th>
						<%-- <td><input type="text" id="addrReceiver" name="addrReceiver"
							value="${deliveryLocation.addrReceiver }" placeholder="수령인"
							style="height: 30px;" /></td> --%>
						<td><input type="text" id="addrReceiver" name="addrReceiver"
						value="" placeholder="수령인"
						style="height: 30px;" /></td>
					</tr>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">배송주소</label></th>
						<%-- <td><input type="text" id="addrPostNum" name="addrPostNum"
							value="${deliveryLocation.adrPostNum }" placeholder="우편번호"
							readonly="readonly" style="height: 30px;" /></td> --%>
						<td><input type="text" id="addrPostNum" name="addrPostNum"
						value="" placeholder="우편번호"
						style="height: 30px;" /></td>
					</tr>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for=""></label></th>
						<%-- <td><input type="text" id="addrRoadName" name="addrRoadName"
							value="${deliveryLocation.addrRoadName }" placeholder="도로명"
							readonly="readonly" style="height: 30px; width: 300px;" /></td> --%>
						<td><input type="text" id="addrRoadName" name="addrRoadName"
						value="" placeholder="도로명"
						style="height: 30px; width: 300px;" /></td>
					</tr>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for=""></label></th>
						<%-- <td><input type="text" id="addrDetail" name="addrDetail"
							value="${deliveryLocation.addrDetail }" placeholder="상세주소 입력" style="height: 30px;" /></td> --%>
						<td><input type="text" id="addrDetail" name="addrDetail"
						value="" placeholder="상세주소" style="height: 30px;" /></td>
					</tr>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">전화번호</label></th>
						<%-- <td><input type="text" id="addrPhone" name="addrPhone"
							value="${deliveryLocation.addrPhone }" placeholder="전화번호"
							style="height: 30px;" /></td> --%>
						<td><input type="text" id="addrPhone" name="addrPhone"
						value="" placeholder="연락처"
						style="height: 30px;" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<input type="hidden" value="${deliveryLocation.adrPostNum }" id="adrPostNum">
		<input type="hidden" value="${deliveryLocation.addrRoadName }" id="adrPostNum">
		<input type="hidden" value="${deliveryLocation.addrDetail }" id="adrPostNum">

		<br> <br>

		<!-- 배송정보 -->
		<div class="deli-2">
			<h2>배송정보</h2>
			<!--  				<h5>(@요일 N/N 도착예정)</h5> -->
		</div>

		<hr class="my-4">

		<%-- <c:forEach var="p" items="${product }" varStatus="i">  --%>
		<table class="payment-table" id="payment-deli-table">

			<thead>
				<h5>상품정보</h5>
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
					<td class=""><img src="${product.productThumb }" width="85"
						height="90" border="0" /></td>
					<td><c:out value=" ${product.productName }" /><br></td>
					<td>${selAmount }개</td>
					<td>상품금액(옵션포함)<br> <c:out
							value="${(product.productPrice+productOption)*selAmount }" /> 원
					</td>
				</tr>

			</tbody>
		</table>
		<%-- </c:forEach> --%>

		<br> <br>

		<!-- 결제 정보 -->
		<div class="">
			<h2>결제정보</h2>
		</div>

		<hr class="my-4">

			<table class="payment-table">
				<tbody>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">상품금액(옵션포함)</label></th>
						<td class="pro-price">
							<c:out value="${(product.productPrice+productOption)*selAmount }" /> 원
						</td>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">배송비</label></th>
						<td class="pro-price">
							2500 원
						</td>
					</tr>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for="">총 결제금액</label></th>
						<td class="pro-price" id="totalPrice">
							<strong style="font-size: 25px; color: #C87854;">
								<c:out value="${(product.productPrice+productOption)*selAmount+2500 }" /> 원
							</strong>
						</td>
					</tr>
					<tr class="payment-tr">
						<th scope="row" id="payment-th"><label for=""></label></th>
						<!-- <td>
									<input class="form-control" id="" placeholder="내용을 입력해주세요.">
								</td> -->
					</tr>
				</tbody>
			</table>

		<br>

		<div class="row gap-2" id="payment-btn">
			<button onclick="location.href='/'" type="button"
				class="btn col btn-secondary btn-lg">취소하기</button>
			<button onclick="payment()" type="button" class="btn col btn-primary btn-lg">결제하기</button>
			<!-- <button onclick="testPayment()" type="button" class="btn col btn-primary btn-lg">테스트 결제하기</button> -->
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

      var IMP = window.IMP;
      IMP.init("imp87022146");

      // 결제창 호출
      IMP.request_pay({ // param

    	  pg : "html5_inicis",
          pay_method : 'card', // 결제형태 - 생략가능
          merchant_uid : '주문번호_' + rndNumber(),
          name : '${product.productName }', // 상품명
          amount : ${(product.productPrice+productOption)*selAmount+2500 }, // 총 상품가격
          buyer_name : $("input[name='addrReceiver']").val(), // 배송받는 사람 이름
          buyer_tel : $("input[name='addrPhone']").val(),// 배송받는 사람 연락처
          buyer_addr : $("input[name='addrRoadName']").val() + " " + $("input[name='addrDetail']").val(), // 배송받는 사람 도로명 + 상세주소
          buyer_postcode : $("input[name='addrPostNum']").val(), // 배송받는 사람 우편번호
          buyer_email : "taera2@icould.com",
          m_redirect_url : '/'

      },

      function(rsp) { // callback

         console.log(rsp);

         if (rsp.success) { // 결제완료
        	 
			location.replace("/order/orderComplete");
        	 
            var msg = '결제가 완료되었습니다.';
            
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
            
         } else { // 결제실패
        	 
        	location.replace("/order/orderFail");
        	 
            var msg = '주문실패 : ';
            
            msg += rsp.error_msg;
            
         }
         
         alert(msg);
         
      });

   }
   
   /* 배송지 변경 팝업 */
   function popAddress() {
        window.open("/changeAddress.do", "배송지 변경", "width=1000, height=600, top=100, left=270");
    }

</script>


&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

<jsp:include page="/WEB-INF/views/common/footer.jsp" />