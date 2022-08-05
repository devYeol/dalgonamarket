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
			<div class="contentstitle">상품등록</div>
		<form action="${path }/insertProduct" method="post">
			<div class="enrolltablediv">
				<table class="enrolltable">
					<tr>
						<td class="theader">상품명</td>
						<td><input class="adminin" type="text"
							placeholder="내용을 입력해 주세요"></td>
					</tr>
					<tr>
						<td class="theader">카테고리</td>
						<td style="font-size: 15px; color: #808080;">
							<label><input type="radio" name="categoryName" value="스낵">스낵</label> 
							<label><input type="radio" name="categoryName" value="사탕">사탕</label> 
							<label><input type="radio" name="categoryName" value="초코">초코</label> 
							<label><input type="radio" name="categoryName" value="젤리">젤리</label> 
							<label><input type="radio" name="categoryName" value="완구">완구</label> 
							<label><input type="radio" name="categoryName" value="기타">기타</label>
						</td>
					</tr>
					<tr>
						<td class="theader">가격</td>
						<td><input class="adminin" type="text"
							placeholder="내용을 입력해 주세요"></td>
					</tr>
					<tr>
						<td class="theader">옵션</td>
						<td><input class="adminin" type="text"
							placeholder="내용을 입력해 주세요"></td>
					</tr>
					<tr>
						<td class="theader">수량</td>
						<td><input class="adminin" type="text"
							placeholder="내용을 입력해 주세요"></td>
					</tr>
					<tr>
						<td class="theader">이미지</td>
						<td>
							<input type="file" name="upfile" style="margin-bottom: 5px" >
							<input type="file" name="upfile">
						</td>
					</tr>
					<tr>
						<td class="theader">상품설명</td>
						<td><input class="adminin" type="text"
							placeholder="내용을 입력해 주세요"></td>
					</tr>
				</table>
				<div style="position: relative; top: 10px; left: 25%;">
					<button class="adminbt"
						style="background-color: #E0E0E0; color: black;">취소</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="adminbt">등록</button>
				</div>
			</div>
		</form>
		</div>
		<!-- end of contents -->
	</div>
</body>
</html>