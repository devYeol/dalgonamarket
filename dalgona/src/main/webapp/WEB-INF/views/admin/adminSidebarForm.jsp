<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

<!-- 사이드바 영역 -->
<div class="sidebar">
	<!-- 메뉴 상태 변경 버튼 추가 -->
	<!-- <label class="toggle"> 
				<span></span> <span></span> <span></span>
			</label> -->
	<div class="sidebarlogo" onclick="location.assign('${path}/')">DALGONA MARKET</div>
	<div class="logcontainer">
		<div class="loginfo">
			<div style="margin-left: 7px;">
				<table>
					<tr>
						<td style="padding: 15px;">
							<img style="width: 70px; height: 70px; border-radius: 15px;" 
							src="https://intermusicakorea.com/common/img/default_profile.png">
						</td>
						<td style="color: white">
							<b style="font-size: 18px;">관리자</b> 님,<br>
							환영합니다.
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="menucontainer">
		<div class="menu" onclick="location.assign('${path}/admin/adminMain.do')">메인페이지</div>
		<br>
		<div class="menu" onclick="location.assign('${path}/admin/adminEnrollProduct.do')">상품등록</div>
		<br>
		<div class="menu" onclick="location.assign('${path}/admin/adminManageProduct.do')">상품관리</div>
		<br>
		<div class="menu" onclick="location.assign('${path}/admin/adminManageOrder.do')">주문관리</div>
		<br>
		<%-- <div class="menu" onclick="location.assign('${path}/admin/adminManageMember.do')">회원통계</div>
		<br>
		<div class="menu">매출통계</div>
		<br>
		<div class="menu">문의내역</div>
		<br>
		<div class="menu">리뷰내역</div>
		<br> --%>
		<div class="menu" onclick="location.assign('${path}/')">나가기</div>
		<br>
	</div>
</div>
<!-- end of sidebar -->
