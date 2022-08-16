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

.pwUpdate-form {
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 50px;
	display: flex;
}

.pwUpdate-form .pwUpdate-container{
	display: flex;
    align-content: center;
    align-items: center;
    flex-direction: column;
}

.sidebar {
	width: 100%;
	height: 600px; 
	width: 200px; 
	position : sticky; 
	top: 50px;
}

.sidebar ul {
	padding: 0;
	margin-top: 40px;
}

.sidebar ul li {
	list-style: none;
	margin-top: 20px;
}

.sidebar ul li a {
	text-decoration: none;
	color: #999;
}

.sidebar ul li a:hover {
	color: black;
}

.pwUpdate-container {
	width: 70%;
	position: relative;
}

.int-area { 
	width: 350px;
	margin-top: 20px;
}

.int-area input:hover {
	border-bottom: 1px solid black;
}

.int-area input {
	width: 100%;
	padding: 10px 0px 5px;
	border: none;
	background-color: #fff;
	border-bottom: 1px solid #999;
	outline: none;
} 

.btn-area {
	display: flex;
	justify-content: center;
}

.btn-area button {
	width: 60px; 
	height: 30px;
	font-size: 16px;
	background-color: white;
	border: 1px solid #999;
	border-radius: 10px;
	margin: 30px 5px 0px 5px;
}

.btn-area button:hover {
	background-color: black;
	color: #fff;
}

</style>
	<div class="headcontainer border-top" style="padding-top: 20px"></div>
	<section class="pwUpdate-form">
			<div>
				<div class="sidebar">
					<h4><strong>마이페이지</strong></h4>
					<ul>
						<li><a href="${path }/member/mypage/mypageMain">쇼핑정보</a></li>
						<li><a href="${path }/member/mypage/productOrderList">구매내역</a></li>
						<li><a href="${path }/member/mypage/cart">장바구니</a></li>
						<li><a href="${path }/member/mypage/zzim">찜 목록</a></li>
						<br>
						<li><h5><b>내정보</b></h5></li>
						<li><a href="${path }/member/mypage/changePage">프로필 정보</a></li>
						<li><a href="${path }/member/mypage/pwUpdate">비밀번호 변경</a></li>
						<li><a href="${path }/member/mypage/address">주소록</a></li>
					</ul>
				</div>
			</div>
			<div class="pwUpdate-container">
				<h4><b>비밀번호 변경</b></h4>
					<div class="pwUpdate-area">
						<div style="font-size: 16px; margin-top: 4px;">변경하실 비밀번호를 입력해 주세요.</div>
					</div>
					<br>
					<form action="${path }/member/mypage/pwUpdateEnd" id="pwUpdateForm" method="post" onsubmit="return chkPw();">
					<div>
						<div class="int-area">
							<br>
							<input type="hidden" name="memberId" id="memberId" autocomplete="off" value="<c:out value="${member.memberId }"/>">
						</div>
						<div class="int-area">
							<div style="display: flex; justify-content: space-between;">
								<label for="pw"><b>현재 비밀번호</b></label>
								<span id="nowPw"></span>
							</div>
							<input type="password" name="memberPwd" id="memberPwd" autocomplete="off" required>
						</div>
						<div class="int-area">
							<label for="pw"><b>새 비밀번호</b></label>
							<br>
							<input type="password" name="memberPwd1" id="memberPwd1" autocomplete="off" required>
							<span style="font-size: 14px; color:#999;">8자리 이상 영문,숫자,특수문자 중 2가지 이상 입력.</span>
						</div>		
						<div class="int-area">
							<div style="display: flex; justify-content: space-between;">
								<label for="pw"><b>새 비밀번호 확인</b></label>
								<span id="newPw"></span>
							</div>
							<input type="password" name="memberPwd2" id="memberPwd2" autocomplete="off" required>
						</div>							
					</div>
						<div class="btn-area">
							<button type="submit"><b>확인</b></button>
						</div>
					</form>
			</div>
	</section>
<script>

let checkPwdResult=false;

$("#memberPwd").blur(function() {
	const memberId = $("#memberId").val();
	const memberPwd = $("#memberPwd").val();
	$.ajax({
		url : "${path}/member/mypage/pwUpdateCheck",
		type : "post",
		data : {"memberId":memberId,"memberPwd":memberPwd},
		success: function(data){
			console.log(data)
			if(data==0){
				$("#nowPw").text("일치하지 않는 비밀번호입니다.");
				$("#nowPw").css("color", "red");
			}else{
				$("#nowPw").text("일치하는 비밀번호입니다.");
				$("#nowPw").css("color", "green");
				checkPwdResult=true;
			}
		}
	})
});

$("#memberPwd2").blur(function() {
	if($('#memberPwd1').val()=='' || $('#memberPwd2').val() != $('#memberPwd1').val()) {
		$("#newPw").text("다시 입력해주세요.");
		$("#newPw").css("color", "red");
	}else{
		$("#newPw").text("");
	}
})

const chkPw=()=>{
	 const pw = $("#memberPwd1").val();
	 const pwck	= $("#memberPwd2").val();
	 const num = pw.search(/[0-9]/g);
	 const eng = pw.search(/[a-z]/ig);
	 const spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	if(pw.length < 8){
		alert("비밀번호는 8자리 이상으로 입력해주세요.");
		$("#memberPwd1").focus();
		return false;
	}else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
		alert("비밀번호는 영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
		$("#memberPwd1").focus();
		return false;
	}else if(pw != pwck){
		alert("비밀번호가 일치하지 않습니다.")
		$("#memberPwd1").focus();
		return false;
	}else if(!checkPwdResult){
		alert("비밀번호가 일치하지 않습니다!");
		return false;
	}
	else {
		console.log("통과");	 
	}
	return false;
}
</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>