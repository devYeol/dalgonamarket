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
			<jsp:param name="title" value="" />
		</jsp:include>
		<!-- end of sidebar -->
		<!-- 
            컨텐츠 영역 : 
            - 더미 텍스트(Lorem ipsum)을 활용하여 내용 강제로 늘려 테스트
        -->
		<div class="contents">
			<div class="contentstitle">회원관리</div>
			<div class="statsdiv">
				<div class="stats"
					style="margin-right: 20px; background-size: 75%; background-image: url(/resources/images/chart.png)"></div>
				<div class="stats"
					style="margin-left: 20px; background-size: 60%; background-image: url(/resources/images/graph.png)"></div>
			</div>
			<div class="searchdiv2">
				<div style="color: #808080; font-size: 30px; font-weight: border;">회원검색</div>
				<div>
					<form action="${path}/admin/adminSearchMember.do">
						<table>
							<tr>
								<div style="padding-left: 42px; padding-bottom: 4px; font-size: 14px;">
									<label><input type="radio" name="searchType" value="MEMBER_NAME" style="width: 11px; height: 11px;">이름</label> 
									<label><input type="radio" name="searchType" value="MEMBER_ID" style="width: 11px; height: 11px; margin-left: 20px;">아이디</label>
								</div>
							</tr>
							<tr>
								<div style="display: flex;">
									<div style="padding-top: 3px; padding-right: 10px;">
										<img src="${path}/resources/images/glass.png" style="width: 24px; height: 24px">
									</div>
									<div>
										<input type="text" name="keyword" class="search" style="width: 300px;" placeholder="검색어를 입력하세요">
									</div>
									<div style="padding-left: 7px;">
										<input type="submit" value="검색" class="adminbt" style="width: 60px; height: 32px; background-color: #707070;">
									</div>
								</div>
							</tr>
							<tr>
								<div style="padding-left: 44px; padding-top: 4px; font-size: 12px;">
									<label><input type="radio" name="searchGen" value="" style="width: 11px; height: 11px;">전체</label> 
									<label><input type="radio" name="searchGen" value="남" style="width: 11px; height: 11px; margin-left: 10px;">남</label> 
									<label><input type="radio" name="searchGen" value="여" style="width: 11px; height: 11px; margin-left: 10px;">여</label>
								</div>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="listdiv">
				<table class="listtable">
					<tr>
						<th style="width: 5%;">체크</th>
						<th style="width: 14%;">이름</th>
						<th style="width: 14%;">아이디</th>
						<th style="width: 11%;">성별</th>
						<th style="width: 17%">이메일</th>
						<th style="width: 17%;">연락처</th>
						<th style="width: 17%;">가입일</th>
						<th colspan="2" style="width: 5%;">등록/삭제</th>
					</tr>
					<c:if test="${not empty members}">
						<c:forEach var="m" items="${members}">
							<tr>
								<td><input type="checkbox"
									style="width: 15px; height: 15px;"></td>
								<td><c:out value="${m.memberName}" /></td>
								<td><c:out value="${m.memberId}" /></td>
								<td><c:out value="${m.memberGender}" /></td>
								<td><c:out value="${m.memberEmail}" /></td>
								<td><c:out value="${m.memberPhone}" /></td>
								<td><c:out value="${m.memberEnrollDate}" /></td>
								<td>
									<button class="adminbt" style="width: 80px; background-color: #6FB67F;">수정</button>

								</td>
								<td>
									<button class="adminbt" id="" name="" style="width: 80px; background-color: #D56B5A;">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty members}">
						<tr>
							<td colspan="8">조회결과 없음</td>
						</tr>
					</c:if>
				</table>
			</div>
			<div class="pageBar">
				${pageBar}
			</div>
		</div>
		<!-- end of contents -->
</body>
</html>