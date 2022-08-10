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
  
.login-form {
	display:flex;
	justify-content: center;
	align-items: center;
	height: 130vh;
}

.login-container {
	position: relative;
	z-inex: 2;
}

.login-container h2 {
	font-size: 32px;
	text-align: center;
}

.login-container h5 {
	text-align: center;
	padding-bottom: 100px;
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

input::placeholder {
	color:#999;
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

.btn-area1 button {
	width: 100%; 
	height: 50px;
	background-color: green;
	color: #fff;
	font-size: 18px;
	border: none;
	border-radius: 10px;
	margin-top: 30px;
}

.btn-area2 button {
	width: 100%; 
	height: 50px;
	background-color: yellow;
	color: black;
	font-size: 18px;
	border: none;
	border-radius: 10px;
}

.caption {
	text-align: center;
}

.caption a {
	font-size: 15px; 
	color: #999;
	text-decoration: none;
}

.caption a:hover{
	color: black;
}

.login-checkbox {
	display:inline;
	font-size: 15px;
	width:100px;
	line-height: 50px;
}
</style>

<section class="login-form">
	<div class="login-container">
		<h2><b>DALGONA MARKET</b></h2>
		<h5><b>추억속으로의 여행</b></h5>
		<form action="${path}/member/loginEnd" method="post">
			<div class="int-area">
				<label for="id"><b>아이디</b></label>
				<br>
				<input type="text" id="userId" name="memberId" placeholder="아이디를 입력해주세요" autocomplete="off" required>
			</div>
			<br>
			<div class="int-area">
				<label for="pw"><b>비밀번호</b></label>
				<br>
				<input type="password" name="memberPwd" placeholder="비밀번호를 입력해주세요" autocomplete="off" required>
			</div>
			<label class="login-checkbox">
					<input type="checkbox" id="saveId" style="width: 15px; height:15px;">
					<span>아이디 저장</span>
			</label>
			<div class="btn-area">
				<button type="submit"><b>로그인</b></button>
			</div>
			<br>
		</form>
			<div class="caption" style="display:flex; justify-content: space-between;">
				<div>
					<a href="" style="border-right:1px solid gray;">&nbsp;&nbsp;&nbsp;&nbsp;<b>아이디 찾기&nbsp;&nbsp;&nbsp;&nbsp;</b></a>
				</div>
				<div>
					<a href="" style="border-right:1px solid gray;"><b>&nbsp;&nbsp;비밀번호 찾기&nbsp;&nbsp;&nbsp;&nbsp;</b></a>
				</div>
				<div>
					<a href="${path}/member/enroll"><b>&nbsp;&nbsp;회원가입</b>&nbsp;&nbsp;&nbsp;&nbsp;</a>
				</div>
			</div>
		<br>
		<br>
		<hr>
		<div class="btn-area1">
			<button type="submit"><b>네이버로 로그인</b></button>
		</div>
		<br>
		<div class="btn-area2">
			<button type="submit"><b>카카오로 로그인</b></button>
		</div>
	</div>
</section>
<script>

//아이디 저장
$(document).ready(function(){

	 //저장된 쿠기값을 가져와서 id 칸에 넣어준다 없으면 공백으로 처리
	 var key = getCookie("key");
	 $("#userId").val(key);


	 if($("#userId").val() !=""){ // 페이지 로딩시 입력 칸에 저장된 id가 표시된 상태라면 id저장하기를 체크 상태로 둔다
	    $("#saveId").attr("checked", true); //id저장하기를 체크 상태로 둔다 (.attr()은 요소(element)의 속성(attribute)의 값을 가져오거나 속성을 추가합니다.)
	 }

	  $("#saveId").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#saveId").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#userId").val(), 2); // 하루 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	  });

	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#saveId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#userId").val(), 2); // 쿠키 보관
	        }
	    });
	});

	//쿠키 함수 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "=" + "; expires=" + expireDate.toGMTString();
	}

	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>