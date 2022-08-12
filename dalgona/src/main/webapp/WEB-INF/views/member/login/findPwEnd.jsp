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
  
.findPwEnd-form {
	display:flex;
	justify-content: center;
	height: 100vh;
	padding-top: 100px;
}

.findPwEnd-container {
	position: relative;
	z-inex: 2;
}

.findPwEnd-container h2 {
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

<section class="findPwEnd-form">
	<div class="findPwEnd-container">
		<h2><b>임시비밀번호 발송</b></h2>
		<br>
		<hr>
		<br>
		<div style="display:flex; flex-direction:column; width: 350px;">
			<div>
				<span>회원님이 가입하신 이메일</span>
				<span style="color: red;"><c:out value="${member.memberEmail}"/></span>
				<span>로 임시비밀번호가 발송 되었습니다.</span>
			</div>
			<br>
			<div>로그인 후 비밀번호를 변경해주세요.</div>
		</div>
		<br>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>