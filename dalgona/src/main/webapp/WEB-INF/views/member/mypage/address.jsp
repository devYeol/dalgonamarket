<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
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
	position: sticky;
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

.addr-container {
	width: 100%;
	position: relative;
	margin-left: 50px;
}

.addr-container h2 {
	font-size: 32px;
}

.addr-area {
	display: flex;
	justify-content: space-between;
}

.insert-addr {
	display: flex;
	justify-content: space-between;
}

.btn-area {
	width: 120px;
	height: 30px;
	font-size: 16px;
	background-color: white;
	border: 1px solid #999;
	border-radius: 10px;
}

.btn-area:hover {
	background-color: black;
	color: #fff;
}

.btn-addr {
	width: 50px;
	height: 30px;
	font-size: 14px;
	background-color: white;
	border: 1px solid #999;
	border-radius: 10px;
}

.btn-addr:hover {
	background-color: black;
	color: #fff;
}

.btn-basicaddr {
	width: 100px;
	height: 30px;
	font-size: 14px;
	background-color: white;
	border: 1px solid #999;
	border-radius: 10px;
}

.btn-basicaddr:hover {
	background-color: black;
	color: #fff;
}

.btn-container:after {
	display: inline-block;
	height: 100%;
	content: "";
	vertical-align: middle;
}
</style>
<div class="headcontainer border-top" style="padding-top: 20px"></div>
<section class="addr-form">
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
	<div class="addr-container">
		<h4>
			<b>?????????</b>
		</h4>
		<br>
		<c:choose>
			<c:when test="${empty selectDl }">
			<span>????????? ???????????? ???????????? </span>
			</c:when>
			<c:otherwise>
		<div class="addr-area">
			<div style="font-size: 18px; margin-top: 4px;">?????????</div>
			<button class="btn-area" onclick="adressAdd();">+ ????????? ??????</button>
		</div>
			<c:forEach var="dl" items="${selectDl}">
				<hr style="margin-top: 8px; margin-bottom: 0px;">
				<div class="insert-addr">
				<input type="hidden" name="addressCode" value="${addressCode}">
					<div style="margin-bottom: 40px; margin-top: 30px;">
						<div style="font-size: 17px;">????????? : ${dl.addrReceiver }</div>
						<div style="font-size: 15px;">????????? : ${dl.addrPhone }</div>
						<div style="font-size: 15px;">????????? : (${dl.adrPostNum })${dl.addrRoadName} ${dl.addrDetail}</div>
					</div>
					<div class="btn-container">
						<button class="btn-addr" onclick="location.assign('${path}/addressDel?addressCode=${dl.addressCode}')">??????</button>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
		</c:choose>
	</div>
</section>


<script>
	/* const adressAdd=()=>{
		location.assign("${path}/member/mypage/addressadd");
	} */
	 const adressAdd=()=>{
		 const url="${path}/member/mypage/addressadd";
		 open(url,"????????? ??????","width=500,height=500");
	 }
	 
</script>





<jsp:include page="/WEB-INF/views/common/footer.jsp" />