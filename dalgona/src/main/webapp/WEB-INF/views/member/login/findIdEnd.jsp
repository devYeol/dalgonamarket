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
  
.findIdEnd-form {
	display:flex;
	justify-content: center;
	height: 100vh;
	padding-top: 100px;
}

.findIdEnd-container {
	position: relative;
	z-inex: 2;
}

.findIdEnd-container h2 {
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

<section class="findIdEnd-form">
	<div class="findIdEnd-container">
		<h2><b>아이디 찾기 결과</b></h2>
		<br>
		<hr>
		<br>
		<div style="display: flex; justify-content: center; width: 350px;">
			<div>회원님이 가입하신 아이디는&nbsp;</div>
			<div style="color: blue;"><c:out value="${member.memberId}"/>&nbsp;</div>
			<div>입니다.</div>
		</div>
		<br>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>