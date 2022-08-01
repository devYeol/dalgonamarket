<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="title" value=""/>
</jsp:include>

<style>

.prd-container {
	margin-left: 100px;
	margin-right: 100px;
}
	
.sidebar {
	width: 100%;
	height: 600px; 
	width: 200px; position : sticky;
	top: 0;
	position: sticky; top : 0;
	color: black;
	background-color: white;
	border: 1px solid #adb5bd;
}

</style>	
	
<div class="headcontainer border-top" style="padding-top: 20px"> </div>

	<!-- test -->
	<section class="prd-container">
		<div class="container1">
			<div>
				<div class="sidebar">
					<div style="margin-top: 10px"><label for="expand-menu"><h2 style="font-weight: bold">마이페이지</h2></label></div>&nbsp;
					<ul id="side">
						<li id="firstMenu" class="sideMenu"><a href="#" class="item">쇼핑정보</a></li>
						<li class="sideMenu"><a href="#" class="item">찜 목록</a></li>
						<li class="sideMenu"><a href="#" class="item">장바구니</a></li>
						<li class="sideMenu"><a href="#" class="item">구매내역</a></li>
						<li class="sideMenu"><a href="#" class="item">상품문의</a></li>
						<br>
						<li class="sideMenu"><a href="#" class="item">내정보</a></li>
						<li class="sideMenu"><a href="#" class="item">내정보 수정</a></li> 
						<li class="sideMenu"><a href="#" class="item">포인트 내역</a></li>
						<li class="sideMenu"><a href="#" class="item">주소록</a></li>
					</ul>
				</div>
			</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>