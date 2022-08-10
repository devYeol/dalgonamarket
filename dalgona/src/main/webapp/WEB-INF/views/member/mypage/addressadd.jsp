<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>

	<style>
.cart-form {
	justify-content: center;
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 50px;
	display: flex;
}

.cart-container {
	width: 100%;
	position: relative;
	margin-left: 50px;
}

div img {
	width: 100px;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.login-form {
	display: flex;
	width: 70%;
	justify-content: center;
	align-items: center;
	min-height: 150vh;
}

.login-container {
	position: relative;
	z-inex: 2;
}

.login-container h2 {
	font-size: 32px;
	text-align: center;
}

.int-area {
	width: 350px;
	margin-top: 20px;
}

.int-area input {
	width: 100%;
	padding: 10px 0px 5px;
	border: none;
	border-bottom: 1px solid #999;
	outline: none;
}

.int-area input:hover {
	border-bottom: 1px solid black;
}

.gender-area {
	width: 350px;
	margin-top: 20px;
}

.gender-area div {
	display: flex;
	justify-content: flex-start;
}

.gender-area .genderbox {
	padding: 10px 0px 5px;
}

input::placeholder {
	color: #999;
}

.btn-area {
	margin-top: 30px;
}

.btn-area button {
	width: 100%;
	height: 50px;
	background-color: #999;
	color: #fff;
	font-size: 18px;
	border: none;
	border-radius: 10px;
}

.btn-area button:hover {
	background-color: black;
	color: #fff;
}

.btn-area2 button {
	background-color: #999;
	font-size: 10px;
	color: #fff;
	border: none;
	border-radius: 10px;
	width: 100px;
	height: 20px;
	float: right;
}

.btn-area2 button:hover {
	background-color: black;
	color: #fff;
}
</style>

	<section class="cart-form">
		<div class="login-container">
			<h2>
				<b>주소록 추가</b>
			</h2>
			<br>
			<form action="${path}/member/mypage/shippingset" method="post" >
				<div class="int-area">
					<label for="name"><b>이름</b></label> <br> <input type="text"
						name="name" placeholder="수령인 이름" autocomplete="off">
				</div>
				<br>
				<div class="int-area">
					<label for="phone"><b>휴대폰 번호</b></label> <br> <input
						type="tel" name="phone" placeholder="-없이 입력" required>
				</div>
				<br>
				<div class="int-area" style="">
					<div class="btn-area2" style="justify-content: space-between;">
						<b>우편번호</b>
						<button type="button" onclick="baesongSearch();" >우편번호 검색</button>
					</div>

					<div>
						<input type="text" id="searchBaesong" name="zipcode" placeholder="우편번호를 검색하세요"
							autocomplete="off" required>
					</div>
				</div>
				<br>
				<div class="int-area">
					<b>도로명 주소</b><br> <input type="text" name="roadAddress"
						id="roadAddress" placeholder="우편번호 검색후,자동 입력됩니다" autocomplete="off"
						required>
				</div>
				<br>
				<div class="int-area">
					<b>지번 주소</b><br> <input type="text" id="jibunAddress"
						name="jibunAddress" placeholder="우편번호 검색후,자동 입력됩니다" autocomplete="off"
						required>
				</div>
				<br>
				<div class="int-area">
					<b>상세 주소</b><br> <input type="text" id="sangeseAddress"
						name="sangeseAddress"  placeholder="건물,아파트 동/호수 입력" autocomplete="off"
						required>
				</div>
				<br>
				<div>
					<input class="form-check-input" type="checkbox"
						id="checkboxNoLabel" value="" aria-label="..."> <label>기본배송지로
						설정</label>
				</div>
				<div class="btn-area"
					style="display: flex; justify-content: space-between; margin-bottom: 10px;">
					<button type="button" onclick="addCancel();" >
						<b>취소</b>
					</button>
					&nbsp;&nbsp;
					<button type="submit" class="">설정하기</button>
				</div>
			</form>
		</div>

<script>
	const baesongSearch =()=>{ //배송지 추가
		
    new daum.Postcode({
        oncomplete: function(data) {
        	 var roadAddr = data.roadAddress; // 도로명 주소 변수
             var extraRoadAddr = ''; // 참고 항목 변수

             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraRoadAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraRoadAddr !== ''){
                 extraRoadAddr = ' (' + extraRoadAddr + ')';
             }
	         document.getElementById('searchBaesong').value = data.zonecode;
             document.getElementById("roadAddress").value = roadAddr;
             document.getElementById("jibunAddress").value = data.jibunAddress;
        } 
        
    }).open();
	}  //배송지 추가 끝
	
	
	const addCancel=()=>{
		location.replace("${path}/member/mypage/mypageMain");
	}
	
</script>

	</section>
</body>
</html>
