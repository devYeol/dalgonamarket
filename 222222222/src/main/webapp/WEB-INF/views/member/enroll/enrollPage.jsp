<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<style>
* {
	margin: 0; padding: 0; box-sizing: border-box;
}
  
.enroll-form {
	display:flex;
	justify-content: center;
	align-items: center;
	height: 170vh;
}

.enroll-container {
	position: relative;
	z-inex: 2;
}

.enroll-container h2 {
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
	color:#999;
}

.btn-email {
	width:95px; 
	height: 25px;
	background-color: #fff;
	color: #black;
	font-size: 16px;
	border: 1px solid #999;
	border-radius: 5px;
}

.btn-email:hover {
	background-color: black;
	color: #fff;
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
</style>

<section class="enroll-form">
	<div class="enroll-container">
		<h2><b>회원가입</b></h2>
		<br>
		<br>
		<br>
		<form action="${path }/member/enrollEnd" method="post">
			<div class="int-area">
				<div style="display: flex; justify-content: space-between;">
					<label for="id"><b>아이디*</b></label>
					<!-- <button class=btn-idck>중복확인</button> -->
				</div>
				<input type="text" name="memberId" placeholder="아이디" autocomplete="off" required>
			</div>
			<br>
			<div class="int-area">
				<label for="pw"><b>비밀번호*</b></label>
				<br>
				<input type="password" name="memberPwd" id="pw" placeholder="비밀번호" autocomplete="off" required>
			</div>
			<br>
			<div class="int-area">
				<label for="pw"><b>비밀번호 확인*</b></label>
				<br>
				<input type="password" id="pwck" placeholder="비밀번호 확인" autocomplete="off" required>
				<span id="pwresult"></span>
			</div>
			<br>
			<div class="int-area">
				<label for="name"><b>이름*</b></label>
				<br>
				<input type="text" name="memberName" placeholder="이름" autocomplete="off" required>
			</div>
			<br>
			<div class="int-area">
				<label for="date"><b>생년월일*</b></label>
				<br>
				<input type="date" name="memberBirth" required>
			</div>
			<br>
			<div class="gender-area">
				<label for="gender"><b>성별*</b></label>
				<br>
				<div class=genderbox style="margin-left: 5px;">
					<div>
						<input type="radio" name="memberGender" value="남" required><div style="width:70px; margin-left: 10px;">남</div>
					</div>
					<div>
						<input type="radio" name="memberGender" value="여" required><div style="width:70px; margin-left: 10px;">여</div>
					</div>
				</div>
			</div>
			<br>
			<div class="int-area">
				<div style="display: flex; justify-content: space-between;">
					<label for="email"><b>이메일*</b></label>
					<button class=btn-email id="mail-send-Btn">이메일 인증</button>
				</div>
				<input id="userEmail" type="email" name="memberEmail" placeholder="이메일" autocomplete="off" required>
			</div>
			<br>
			<div class="int-area">
				<div style="display: flex; justify-content: space-between;">
					<label for="email"><b>인증번호</b></label>
					<button class=btn-email id="mail-Check-Btn">인증 확인</button>
				</div>
				<input id="mail-check-input" type="text" placeholder="인증번호 6자리를 입력해주세요" autocomplete="off" required>
				<span id="mail-check-warn"></span>
			</div>
			<br>
			<div class="int-area">
				<label for="phone"><b>연락처*</b></label>
				<br>
				<input type="tel" name="memberPhone" placeholder="-없이 입력" autocomplete="off" required>
			</div>
			<br>
			<div class="btn-area">
				<button type="submit"><b>가입하기</b></button>
			</div>
			<br>
		</form>
	</div>
</section>
<script>
//인증메일 보내기
$('#mail-send-Btn').click(function() {
		const email = $('#userEmail').val()// 이메일 주소값 얻어오기
		console.log('이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('#mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : '<c:url value ="/authmail?email="/>'+email, 
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		});
	});
//인증번호 비교
	$("#mail-Check-Btn").click(e=>{
		$.get("${path}/checkauthkey?key="+$("#mail-check-input").val(),data=>{
			if(data) alert("인증완료");
			else {
				alert("인증실패");
			}
		})
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>