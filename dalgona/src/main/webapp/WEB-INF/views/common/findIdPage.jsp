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
  
.findId-form {
	display:flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.findId-container {
	position: relative;
	z-inex: 2;
}

.findId-container h2 {
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
</style>

<section class="findId-form">
	<div class="findId-container">
		<h2><b>아이디 찾기</b></h2>
		<br>
		<hr>
		<br>
		<div>가입시 등록한 이메일을 입력하시면,</div>
		<div>가입한 아이디를 이메일로 발송해 드립니다.</div>
		<br>
		<form action="">
			<div class="int-area">
				<label for="searchEmail"><b>이메일 주소</b></label>
				<br>
				<input type="email" name="searchEmail" placeholder="예) dalgona@dalgona.com" autocomplete="off" required>
			</div>
			<div class="btn-area">
				<button type="submit"><b>이메일 발송하기</b></button>
			</div>
			<br>
		</form>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>