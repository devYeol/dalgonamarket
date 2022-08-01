<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    <c:set var="path" value="${pageContext.request.contextPath }" />
    
    <link rel="stylesheet" href="${path}/resources/css/payment.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>

<section id="payment-content">
		
		<div id="payment-title">
			<h2>주문/결제</h2>
			<hr class="my-4">
		</div>
		
		&nbsp;
		
		<div id="payment-container">
			<div>
				<h2> 구매자 정보 (*)회원정보</h2>
				<hr class="my-4">
				<table class="payment-table">
					<tbody>
						<tr class="payment-tr">
							<th scope="row" id="payment-th"><label for="">이름</label></th>
							<td>
								<input class="form-control" id="" placeholder="홍길동" readonly>
							</td>
						<tr class="payment-tr">
							<th scope="row" id="payment-th"><label for="">이메일</label></th>
							<td>
								<input class="form-control" id="" placeholder="a@a.com" readonly>
							</td>
						</tr>
						<tr class="payment-tr">
							<th scope="row" id="payment-th"><label for="">전화번호</label></th>
							<td>
								<input class="form-control" id="" placeholder="01012341234" readonly>
							</td>
						</tr>
					</tbody>
				</table>
				
				<br>
				
				<div class="deli-btn-content">
					<h2>받는사람 정보</h2>
				</div>
				<div class="deli-btn"> &nbsp;
					<button type="submit" class="btn btn-primary" id="deli-btn">배송지변경</button>
				</div>
				
				<table class="payment-table">
					<tbody>
						<tr class="payment-tr">
							<th scope="row" id="payment-th"><label for="">이름</label></th>
							<td>
								<input class="form-control" id="" placeholder="신사임당" readonly>
							</td>
						</tr>
						<tr class="payment-tr">
							<th scope="row" id="payment-th"><label for="">배송주소</label></th>
							<td>
								<input class="form-control" id="" placeholder="서울시 금천구" readonly>
							</td>
						</tr>
						<tr class="payment-tr">
							<th scope="row" id="payment-th"><label for="">전화번호</label></th>
							<td>
								<input class="form-control" id="" placeholder="01043214321" readonly>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			&nbsp;
			
			<!-- 배송정보 -->
			<div class="deli-2">
				<h2>배송정보</h2>
				<h5>(@요일 N/N 도착예정)</h5>
			</div>
			
			<hr class="my-4">
			
			<table class="payment-table" id="payment-deli-table">
				<thead>
<!-- 				<tr class="payment-tr">
						<th scope="col" colspan="2" id="deli-th">@요일 N/N 도착예정</th>
						<th scope="col" colspan="5">수량</th>
						<th scope="col" colspan="5">배송비</th>
					</tr> -->
				</thead>
				<tbody>
					<tr class="payment-tr">
						<td class=""><a href="#"><img src="https://img.mywisa.com/freeimg/smartwing/_data/product/201709/22/e4ee83bdcacc45b92130f10aeef309f1.jpg" width="73" height="90" border="0"></a></td>
						<td>
							<a href="#">상품타이틀</a>
						</td>
						<td>수량 N개</td>
						<td>배송비 N원</td>
					</tr>
				</tbody>
			</table>
			
			&nbsp;
			
			<!-- 결제 정보 -->
			<div class="">
				<h2>결제정보</h2>
			</div>
			
			<hr class="my-4">
			
			<!-- <table class="payment-table">
					<tbody>
						<tr class="payment-tr">
							<th scope="row"><label for="">총 상품가격</label></th>
							<td>
								N원
							</td>
						</tr>
						<tr class="payment-tr">
							<th scope="row"><label for="">배송비</label></th>
							<td>
								N원
							</td>
						</tr>
						<tr class="payment-tr">
							<th scope="row"><label for="">총 결제금액</label></th>
							<td>
								N원
								<br>
								<input type="text" name="" id="" value="" class="" placeholder="내용을 입력하세요">
							</td>
						</tr>
					</tbody>
				</table> -->
				
				<table class="payment-table">
					<tbody>
						<tr class="payment-tr">
							<th scope="row" id="payment-th"><label for="">총 상품가격</label></th>
							<td>
								N 원
							</td>
						<tr class="payment-tr">
							<th scope="row" id="payment-th"><label for="">배송비</label></th>
							<td>
								N 원
							</td>
						</tr>
						<tr class="payment-tr">
							<th scope="row" id="payment-th"><label for="">총 결제금액</label></th>
							<td>
								N 원
							</td>
						</tr>
						<tr class="payment-tr">
							<th scope="row" id="payment-th"><label for=""></label></th>
							<td>
								<input class="form-control" id="" placeholder="내용을 입력해주세요.">
							</td>
						</tr>
					</tbody>
				</table>
				
				&nbsp;
				
				<div class="d-grid gap-2 col-6 mx-auto">
					<button type="button" class="btn btn-secondary btn-lg">취소</button>
					<button type="button" class="btn btn-primary btn-lg">결제</button>
				</div>
			</div>
			
			&nbsp;
			&nbsp;
			&nbsp;
			&nbsp;
			
</section>

			&nbsp;
			&nbsp;
			&nbsp;
			&nbsp;
			&nbsp;

<jsp:include page="/WEB-INF/views/common/footer.jsp" />