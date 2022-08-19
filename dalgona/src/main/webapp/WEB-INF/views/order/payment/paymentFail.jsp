<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    <c:set var="path" value="${pageContext.request.contextPath }" />
    
    <link rel="stylesheet" href="${path}/resources/css/payment.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>

<section id="payment-success">
	
	<div class="payment-success-container">
	
		<div class="payment-success-img">
<!-- 			<img src="./images/payment/payment-success-icon.png" width="85" height="90" border="0" /> -->
			<img src="resources/images/payment/payment-fail-icon.png" width="350" height="300" border="0" />
		</div>
		
		<br>
		<br>
		
<!-- 		<div class="payment-success-content">
			<h2><strong>$ totalPrice</strong></h2>
		</div> -->
		
		<div class="payment-success-content">
			<h4>주문이 실패했습니다.</h4>
		</div>
		
		<br>
		<br>
		
		<div class="row gap-2" id="payment-btn" style="width: 400px;">
			<button onclick="home1()" type="button" class="btn col btn-secondary btn-lg">장바구니 이동</button>
			<button onclick="home()"type="button" class="btn col btn-primary btn-lg">HOME</button>
		</div>
		
		
	</div>
	
</section>

<script>

function home() {
	location.replace("/");
}

function home1() {
	location.replace("/member/mypage/cart");
}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />