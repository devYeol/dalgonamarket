<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/admin.css" />
<%-- <script type="text/javascript" src="${path}/resources/js/admin.js"></script> --%>
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script> -->
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<!-- 메인 영역 -->
	<div class="container">
		<!-- 사이드바 영역 -->
		<jsp:include page="/WEB-INF/views/admin/adminSidebarForm.jsp">
			<jsp:param name="title" value=""/>
		</jsp:include>
		<!-- end of sidebar -->
		<!-- 
            컨텐츠 영역 : 
            - 더미 텍스트(Lorem ipsum)을 활용하여 내용 강제로 늘려 테스트
        -->
		<div class="contents">
		<div class="contentstitle">상품관리</div>
			<div class="searchdiv">
				<div>
					<img src="${path}/resources/images/glass.png" style="width:24px; height:24px">
				</div>
				&nbsp;
				<div>
					<input class="search" type="text" placeholder="검색하실 상품명을 입력하세요">
				</div>
			</div>
			<div class="listdiv">
				<!-- <table class="listtable">
					<tr>
						<th>체크박스</th>
						<th>상품코드</th>
						<th>상품명</th>
						<th>상품수량</th>
						<th>상품등록일</th>
						<th>상품등록</th>
						<th>상품삭제</th>
					</tr>
				</table> -->
				<div style="display: flex; padding-bottom: 8px;">
					<div style="padding-top: 10px;">
						<input type="checkbox" style="width: 15px; height: 15px;">
					</div>
					<div style="padding-top: 10px; padding-left: 5px;">
						<b>전체선택</b>
					</div>
					&nbsp;
					<div style="padding-left: 85%;">
						<button class="adminbt" style="width: 80px; background-color: #D56B5A;">선택삭제</button>
					</div>
				</div>
				<table class="listtable">
					
					<tr>
						<td style="width:50px;"><input type="checkbox" style="width: 15px; height: 15px;"></td>
						<td style="width:90px;" >20142504</td>
						<td>
							<img src="http://img3.tmon.kr/cdn4/deals/2022/02/15/5164313822/front_cd6a3_671t8.jpg" width="95" height="100" border="0" />
						</td>
						<td style="width:59%; text-align: left; padding-left:30px">달고나<br>30000원</td>
						<td>
							<input style="width:50px; font-size: 15px; padding-right:10px;" type="number" value="5">
						</td>
						<td>
							<button class="adminbt" style="width: 80px; background-color: #6FB67F;">수정</button>
							<button class="adminbt" style="width: 80px; background-color: #D56B5A;">삭제</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- end of contents -->
	</div>
</body>
</html>