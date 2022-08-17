<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

<!-- 사이드바 영역 -->
<div class="sidebar">
	<!-- 메뉴 상태 변경 버튼 추가 -->
	<!-- <label class="toggle"> 
				<span></span> <span></span> <span></span>
			</label> -->
	<div class="sidebarlogo"
		onclick="location.assign('${path}/admin/adminMain.do')">DALGONA
		MARKET</div>
	<div class="menucontainer">
		<div class="menu" onclick="location.assign('${path}/admin/adminEnrollProduct.do')">상품등록</div>
		<br>
		<div class="menu" onclick="location.assign('${path}/admin/adminManageProduct.do')">상품관리</div>
		<br>
		<div class="menu" onclick="location.assign('${path}/admin/adminManageOrder.do')">주문관리</div>
		<br>
		<div class="menu" onclick="location.assign('${path}/admin/adminManageMember.do')">회원통계</div>
		<br>
		<div class="menu">매출통계</div>
		<br>
		<div class="menu">문의내역</div>
		<br>
		<div class="menu">리뷰내역</div>
		<br>
		<div class="menu" onclick="location.assign('${path}/')">나가기</div>
		<br>
	</div>
</div>
<!-- end of sidebar -->
