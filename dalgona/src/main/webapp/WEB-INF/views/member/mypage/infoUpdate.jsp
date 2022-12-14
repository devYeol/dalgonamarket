<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<style>
.info-form {
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 50px;
	display: flex;
}

.sidebar {
	width: 100%;
	height: 600px;
	width: 200px;
	position: sticky;
	top: 50px;
}

.sidebar ul {
	padding: 0;
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

.info-container {
	width: 100%;
	position: relative;
	margin-left: 50px;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.logininfo-form {
	display:flex;
	width:70%;
	justify-content: center;
	min-height: 150vh;
}

.logininfo-container {
	position: relative;
	z-inex: 2;
}

.logininfo-container h2 {
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

.btn-withdraw {
	margin-top: 40px;
	background-color: white;
	color: #999;
	font-size: 15px;
	border: none;
}

.btn-withdraw:hover{
	border-bottom:2px solid black;
	color: black;
}
</style>

<div class="headcontainer border-top" style="padding-top: 20px"></div>
<section class="info-form">
	<div>
		<div class="sidebar">
			<h4><strong>???????????????</strong></h4>
			<ul>
				<li><a href="${path }/member/mypage/productOrderList">????????????</a></li>
				<li><a href="${path }/member/mypage/cart">????????????</a>
				<li><a href="${path }/member/mypage/zzim">??? ??????</a></li>
				<br>
				<br>
				<li><h5><b>?????????</b></h5></li>
				<li><a href="${path }/member/mypage/changePage">????????? ??????</a></li>
				<li><a href="${path }/member/mypage/pwUpdate">???????????? ??????</a></li>
				<li><a href="${path }/member/mypage/address">?????????</a></li>
			</ul>
		</div>
	</div>
	<div class="logininfo-form">
		<div class="logininfo-container">
			<h2>
				<b>????????? ??????</b>
			</h2>
			<br> <br> <br>
			<form action="${path }/member/mypage/infoUpdate" method="post">
				<div class="int-area">
					<label for="id"><b>?????????*</b></label> 
					<br> 
					<input type="text" name="memberId" value="<c:out value="${member.memberId }"/>" autocomplete="off" readonly>
				</div>
				<br>
				<div class="int-area">
					<label for="name"><b>??????*</b></label> 
					<br> 
					<input type="text" name="memberName" value="${member.memberName }" placeholder="??????" autocomplete="off">
				</div>
				<br>
				<div class="int-area">
					<label for="date"><b>????????????*</b></label> 
					<br> 
					<input type="date" name="memberBirth" value="${member.memberBirth }" name="date">
				</div>
				<br>
				<div class="gender-area">
					<label for="gender"><b>??????*</b></label> 
					<br>
					<div class=genderbox style="margin-left: 5px;">
						<div>
							<input type="radio" name="memberGender" value="???" ${member.memberGender eq "???"?"checked":"" }>
							<div style="width: 70px; margin-left: 10px;">???</div>
						</div>
						<div>
							<input type="radio" name="memberGender" value="???" ${member.memberGender eq "???"?"checked":"" }>
							<div style="width: 70px; margin-left: 10px;">???</div>
						</div>
					</div>
				</div>
				<br>
				<div class="int-area">
					<label for="email"><b>?????????*</b></label> 
					<br> 
					<input type="email" name="memberEmail" value="${member.memberEmail }" placeholder="?????????" autocomplete="off" required>
				</div>
				<br>
				<div class="int-area">
					<label for="phone"><b>?????????*</b></label> 
					<br> 
					<input type="tel" name="memberPhone" value="${member.memberPhone }" placeholder="-?????? ??????" autocomplete="off" required>
				</div>
				<br>
				<div class="btn-area">
					<button type="submit"><b>????????????</b></button>
				</div>
				<br>
			</form>
			<form action="${path }/member/mypage/withdraw" id="deleteForm" method="post">
				<input type="hidden" name="memberId" value="<c:out value="${member.memberId }"/>">	
				<button class="btn-withdraw" type="submit">?????? ??????</button>
			</form>
		</div>

	</div>
</section>

<script>
	
	if($("#deleteForm").submit(function(){
		if(!confirm("?????? ?????????????????????????")){
			return false;
		}
	}));

	const msg = "${msg}";
	
	if (msg != "") {
		alert(msg);
	}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
