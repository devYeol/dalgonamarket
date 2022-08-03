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

.addr-form {
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 50px;
	display: flex;
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

.pwcheck-container {
	width: 100%;
	position: relative;
	margin-left: 50px;
}

.pwcheck-container h2 {
	font-size: 32px;
}

.int-area { 
	width: 350px;
	margin-top: 20px;
}

.int-area input {
	background-color: #fff;
	width: 100%;
	padding: 10px 0px 5px;
	border: 1px solid #fff;
} 

.pwcheck-area {
	display: flex; 
	justify-content: space-between;
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
	margin: 10px 5px 0px 5px;
}

.btn-area button:hover {
	background-color: black;
	color: #fff;
}

.login-checkbox {
	display:inline;
	font-size: 15px;
	width:100px;
	line-height: 50px;
}

</style>
	<div class="headcontainer border-top" style="padding-top: 20px"></div>
	<section class="addr-form">
			<div>
				<div class="sidebar">
					<h4><strong>마이페이지</strong></h4>
					<ul>
						<li><h5><b>쇼핑정보</b></h5></li>
						<li><a href="#">구매내역</a></li> 
						<li><a href="#">장바구니</a></li> 
						<li><a href="#">찜 목록</a></li>
						<br>
						<li><h5><b>내정보</b></h5></li>
						<li><a href="#">프로필 정보</a></li>
						<li><a href="#">주소록</a></li>
					</ul>
				</div>
			</div>
			<div class="pwcheck-container">
				<h4><b>회원정보확인</b></h4>
					<br>
					<div class="pwcheck-area">
						<div style="font-size: 16px; margin-top: 4px;">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</div>
					</div>
					<form action="">
					<hr style="margin-top: 8px; margin-bottom: 0px; border:;">
						<div class="int-area">
							<label for="id"><b>아이디</b></label>
							<br>
							<input type="text"  disabled name="id" autocomplete="off" value=" kchmd4th">
						</div>
						<hr>
						<div class="int-area">
							<label for="pw"><b>비밀번호</b></label>
							<br>
							<input type="password" name="pw" autocomplete="off" required>
						</div>					
						<hr style="border: solid 1px; margin-top: 20px;">
						<div class="btn-area">
							<button type="submit"><b>취소</b></button>
							<button type="submit"><b>확인</b></button>
						</div>
					</form>
			</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>