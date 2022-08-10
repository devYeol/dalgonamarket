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
		<form action="${path }/member/enrollEnd" method="post" onsubmit="return chkPw();">
			<div class="int-area">
				<div style="display: flex; justify-content: space-between;">
					<label for="id"><b>아이디*</b></label>
					<span id="id-duplication"></span>
				</div>
				<input type="text" id="userId" name="memberId" placeholder="아이디" autocomplete="off" required>
			</div>
				<span class="successIdChk" style="font-size: 14px; color: #999;">아이디는 4자 이상으로 입력해주세요.</span>
			<br>
			<div class="int-area">
				<label for="pw"><b>비밀번호*</b></label>
				<br>
				<input type="password" id="userPwd" name="memberPwd" placeholder="비밀번호" autocomplete="off" required>
			</div>
			<br>
			<div class="int-area">
				<div style="display: flex; justify-content: space-between;">
					<label for="pw"><b>비밀번호 확인*</b></label>
					<input type="hidden" id=""></input>
				</div>
				<input type="password" id="userPwdCk" placeholder="비밀번호 확인" autocomplete="off" required>
			</div>
				<span id="successPwChk"></span>
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
					<button class=btn-email id="mail-send-Btn" type="button">이메일 인증</button>
				</div>
				<input id="userEmail" type="email" name="memberEmail" placeholder="이메일" autocomplete="off" required>
			</div>
			<br>
			<div class="int-area">
				<div style="display: flex; justify-content: space-between;">
					<label for="email"><b>인증번호</b></label>
					<button class=btn-email id="mail-Check-Btn" type="button">인증 확인</button>
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
			<div class="btn-area" id="btn-enrollEnd">
				<button type="submit"><b>가입하기</b></button>
			</div>
			<br>
		</form>
	</div>
</section>
<script>
let checkAuthEmail=false;
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
		const input=document.getElementById("#mail-check-input");
		$.get("${path}/checkauthkey?key="+$("#mail-check-input").val(),data=>{
			if(data) {
				alert("인증완료");
				/* $("#btn-enrollEnd").find('button').attr("disabled",false); */
				checkAuthEmail=true;
			}else {
				alert("인증실패");
				$("#mail-check-input").val(null);
				$("#mail-check-input").focus();
			}
		})
	});
//아이디 중복확인
$("#userId").blur(function(){
	const userId = $("#userId").val();
	if(userId == "" || userId.length < 4){
		$(".successIdChk").text("아이디는 4자 이상으로 입력해주세요.");
			$(".successIdChk").css("color", "red");
	}else{
		$(".successIdChk").css("color", "#999");
		$.ajax({
			url : '${path}/idCheck?memberId='+ userId,
			type : 'post',
			success : function(data) {
				console.log(data);
				if (data == 0) {
					$("#id-duplication").text("사용가능한 아이디입니다.");
					$("#id-duplication").css("color", "green");
				}else {
					$("#id-duplication").text("사용중인 아이디입니다.");
					$("#id-duplication").css("color", "red");
				}
			}, error : function() {
				console.log("실패");
			}
		});
	}
});
//비밀번호 확인
$(()=>{
	$("#userPwdCk").keyup(e=>{
	    const pwVal=$("#userPwd").val();
	    const pwCkVal=$(e.target).val();
	    if(pwCkVal.trim().length>2){
	    	if(pwCkVal===pwVal){
	    		$("#successPwChk").text("비밀번호가 일치합니다.").css("color","green");
	    	}else{
	    		$("#successPwChk").text("비밀번호가 불일치합니다.").css("color","red");
	    	}
	    }else{
	    	$("#successPwChk").text("");
	    }
	   });
   })
//비밀번호 유효성 확인
const chkPw=()=>{
	 const pw = $("#userPwd").val();
	 const num = pw.search(/[0-9]/g);
	 const eng = pw.search(/[a-z]/ig);
	 const spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	 
	if(pw.length < 8){
		alert("비밀번호는 8자리 이상으로 입력해주세요.");
		$("#userPwd").focus();
		return false;
	}else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
		alert("비밀번호는 영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
		$("#userPwd").focus();
		return false;
	}else {
		console.log("통과");	 
	}
}
   
//이메일 미인증 유효성검사
$("#btn-enrollEnd").click(e=>{
	if(!checkAuthEmail) {
		alert("이메일 인증이 필요합니다.");
		return false;
	}
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>